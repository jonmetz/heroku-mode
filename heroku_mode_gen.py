import subprocess

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
    taken = 'aclops'
    key_nums = xrange(ord('A'), ord('z'))
    keys = [chr(num) for num in key_nums]
    open_keys = [key for key in keys if key not in taken and key.isalpha()] # Less special chars
    key_binding_funcs = []
    for command in commands:
        key = pick_key_binding_letter(command, open_keys)
        open_keys.remove(key)
        key_binding_funcs.append(gen_key_binding_func(command, key))
    return key_binding_funcs
        

def gen_key_binding_func(cmd, key):
    return '(global-set-key (kbd "C-c %s") \'heroku-mode-%s)\n' % (key, cmd)

def is_in(letter, string):
    if letter in string:
        return letter
    elif letter.upper() in string:
        return letter.upper()
    else:
        return ''

def pick_key_binding_letter(cmd, open_keys):
    if open_keys == '':
        print "NOT ENOUGH KEYS"
        raise Exception
    for letter in cmd:
        if is_in(letter, open_keys):
            return is_in(letter, open_keys)
    reverse_keys = open_keys[::-1] # choose uppercase only if easy to remember
    return reverse_keys[0]

def create_elisp_simple_cmd(commented_cmd):
    return '(defun heroku-mode-%s()\n\t"%s"\n\t(interactive)\n\t(heroku-mode-execute "%s"))\n\n' % (commented_cmd[0], commented_cmd[1], commented_cmd[0])

def create_elisp_option_cmd(commented_cmd):
    el_func = "(defun heroku-mode-%s(&optional arg)\n\t\"%s\"\n\t\t(interactive \"s"  % (commented_cmd[0], commented_cmd[1])
    el_func += "Enter option(s) and any necessary arguments: \")\n\t\t(if (not (equal arg \"\"))\n\t\t\t\t(heroku-mode-execute" 
    el_func += "(format \"%s:%%s\" arg))\n\t\t\t(heroku-mode-execute \"%s\")))\n\n" % (commented_cmd[0], commented_cmd[0])
    return el_func


if __name__=="__main__":
    text = open("help.txt").read()
    commands_text_list = parse_list(text, ":\n\n", "\n\n")
    commands_text = "\n"+commands_text_list[0] + '\n' + commands_text_list[1]
    command_docs = parse_list(commands_text, "#  ", "\n")
    command_docs = [cmd_doc.strip(' ') for cmd_doc in command_docs]
    commands = parse_list(commands_text,"\n  ", "#  ")
    commands = [cmd.strip(' ') for cmd in commands]
    bash_commands = [str('heroku help ' + cmd).split() for cmd in commands]
    secondary_help = ''
    for bash_command in bash_commands:
        process = subprocess.Popen(bash_command, stdout=subprocess.PIPE)
        secondary_help += process.communicate()[0]
    commented_cmds = zip(commands, command_docs)
    simple_cmds = [commented_cmd for commented_cmd in commented_cmds if commented_cmd[0]+":" not in secondary_help]
    option_cmds = [cmd for cmd in commented_cmds if cmd not in simple_cmds]
    elisp = ''.join([create_elisp_simple_cmd(simple_cmd) for simple_cmd in simple_cmds])
    elisp += ''.join([create_elisp_option_cmd(option_cmd) for option_cmd in option_cmds])
    elisp += ''.join(key_bindings(commands))
    print elisp
