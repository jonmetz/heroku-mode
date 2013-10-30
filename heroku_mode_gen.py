import re

def parse_list(string, sub1, sub2):
    l = []
    while "" not in l:
        l += [return_between(string, sub1, sub2)]
        string = string[string.index(l[-1])+len(sub2):]
    l.remove('')
    return l
    

def return_between(string, sub1, sub2):
    try:
     start = string.index(sub1) + len(sub1)
     end = string.index(sub2,start)
     return string[start:end]
    except ValueError:
     return ""

def key_bindings(commands):
    taken = 'aclop'
    key_nums = xrange(ord('A'), ord('z'))
    keys = [chr(num) for num in key_nums]
    open_keys = [key for key in keys if key not in taken and key.isalpha()] # Less special chars
    key_binding_funcs = []
    for command in commands:
        key = pick_key_binding_letter(cmd, open_keys)
        open_keys.remove(key)
        key_binding_funcs.append(gen_key_binding_func(command, key))
    return key_binding_funcs
        

def gen_key_binding_func(cmd, key):
    return '(global-set-key (kbd "C-c %s") \'%s)\n' % (key, cmd)

def pick_key_binding_letter(cmd, open_keys):
    if cmd[0] in open_keys:
        return cmd[0]
    elif cmd[0].upper in open_keys:
        return cmd.upper
    elif open_keys == '':
        print "NOT ENOUGH KEYS"
        raise Exception
    else:
        reverse_keys = open_keys[::-1] # choose uppercase only if easy to remember
        return reverse_keys[0]

def create_elisp_cmd(commmented_cmd):
    return '(defun heroku-mode-%s()\n\t"%s"\n\t(interactive)\n\t(shell-command "%s")\n)\n\n' % (commmented_cmd[0], commmented_cmd[1], commmented_cmd[0])
    

if __name__=='__main__':
    text = open("help.txt").read()
    commands_text_list = parse_list(text, ":\n\n", "\n\n")
    commands_text = "\n"+commands_text_list[0] + commands_text_list[1]
    command_docs = parse_list(commands_text, "#  ", "\n")
    command_docs = [cmd_doc.strip(' ') for cmd_doc in command_docs]
    commands = parse_list(commands_text,"\n  ", "#  ")
    commands = [cmd.strip(' ') for cmd in commands]
    commented_cmds = zip(commands, command_docs)
    elisp = ''.join([create_elisp_cmd(commented_cmd) for commented_cmd in commented_cmds])
    elisp += ''.join(key_bindings(commands))

