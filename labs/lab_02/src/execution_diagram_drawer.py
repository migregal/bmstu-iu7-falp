import subprocess
import re

from pdf_exporter import create_pdf

#   USAGE:
#       1. python3 ./execution_diagram_drawer.py
#       2. Input valid Lisp expression, for example:
#           2.1. (equal (* 4 7) 21)
#           2.2. ((lambda (a b) (sqrt (+ (* a a) (* b b)))) 3 4)
#           2.3. ((lambda (l1 l2) (> (length l1) (length l2))) `(1 2) `(2))


FUNC_REGEX = re.compile(r'(([-+*/><==`]|[a-zA-Z]+)[-_a-zA-Z0-9]*)')


def encode_lisp(sexpression):
    func = str(sexpression).replace('[', '(')
    func = func.replace(']', ')')
    func = func.replace(',', '')
    func = func.replace('\'', '')

    return func


def decode_lisp(string):
    string = string.replace('`', '` ')
    string = re.sub(r'\(\s*', '(', string)
    string = re.sub(r'\s*\)', ')', string)

    sexpression = FUNC_REGEX.sub(r'"\1"', string)
    sexpression = sexpression.replace(' ', ',')
    sexpression = sexpression.replace('(', '[')
    sexpression = sexpression.replace(')', ']')

    sexpression = eval(sexpression)

    for i in range(len(sexpression)-1, -1, -1):
        if sexpression[i] == '`':
            sexpression[i] = '`' + encode_lisp(sexpression[i+1])
            sexpression.pop(i+1)

    return sexpression


def call_sbcl_func(sexpression, context: dict = {}):
    ctx = ' '.join(f'({a} {b})' for a, b in context.items())

    func_call = f"(let ({ctx}) {str(sexpression)})"

    process = subprocess.run(
        ['sbcl',
         '--noinform',
         '--eval',
         f'(progn (print {func_call}) (sb-ext:quit))',
         ],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE)

    res = process.stdout.strip().decode('utf-8')
    if res[0] == '(':
        res = '`' + res
    return res


result = []


def print_diagram(sexpression, prefix: str = "", context: dict = {}):
    if type(sexpression) is int or type(sexpression) is float:
        result.append(f"{prefix}{str(sexpression)} выч. к {str(sexpression)}")
        return sexpression

    if type(sexpression) is str:
        res = call_sbcl_func(sexpression, context)
        result.append(f"{prefix}{str(sexpression)} выч. к {str(res)}")
        return res

    if type(sexpression) is not list:
        raise Exception("fuck")
    elif len(sexpression) == 0:
        return []

    result.append(f"{prefix}┌────► {encode_lisp(sexpression)}")

    arg_prefix = prefix + "│   "

    args = []
    for arg in sexpression[1:]:
        args.append(print_diagram(arg, arg_prefix))

    result.append(
        f"{prefix}╔════► прим. {encode_lisp(sexpression[0])} к {' '.join(map(str, args))}")

    if type(sexpression[0]) is list and sexpression[0][0] == 'lambda':
        for l, v in zip(sexpression[0][1], args):
            context[l] = v

        func_prefix = prefix + "║   "

        res = print_diagram(sexpression[0][2], func_prefix, context)
    else:
        res = call_sbcl_func(encode_lisp(sexpression), context)

    result.append(f"{prefix}╚════► {str(res)}")

    if prefix != "":
        result.append(f"{prefix}{str(res)} выч. к {str(res)}")

    return res


if __name__ == "__main__":
    print('Input function call in Lisp-style:\n')
    expression = input()
    print()

    expression = decode_lisp(expression)

    print_diagram(expression)

    create_pdf(result)
