import pexpect, sys

password = sys.argv[1]

child = pexpect.spawn('jupyter notebook password')

child.expect(u'Enter password: ')
child.sendline(password)
child.expect(u'Verify password: ')
child.sendline(password)

child.expect(pexpect.EOF)
