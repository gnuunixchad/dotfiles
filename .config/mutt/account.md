# vim:ft=muttrc
# account config example for mutt/neomutt
# @author nate zhou
# @since 2023,2024,2025,2026

## for a password login:
echo set my_pass = "password" | gpg -e > ${HOME}/.cache/mutt/account1.gpg
# source in account1.muttrc:
source "gpg -dq ${HOME}/.cache/mutt/account1.gpg |"


## oauth2 authentication for outlook
## https://www.vanormondt.net/~peter/blog/2021-03-16-mutt-office365-mfa.html
## 1. generate gpg key `gpg --full-gen-key`
# https://wiki.archlinux.org/title/Isync#Using_XOAUTH2
## 2.a (gpg key pair)"
##    `/usr/share/neomutt/oauth2/mutt_oauth2.py --verbose --authorize ~/doc/heart/.cache/mutt_oauth_account1`
## 2.b (gpg passphrase)
##    `/usr/share/neomutt/oauth2/mutt_oauth2.py --verbose --authorize ~/doc/heart/.cache/mutt/oauth-account1 --encryption-pipe 'gpg -c --cipher-algo aes256'`
## 3. choose `microsoft` provider, `authcode` OAuth2 flow, `client-secret` can
##    be empty
## https://blog.gtz.dk/posts/how-to-2famutt/
## 4. use thunderbird's client-id "9e5f94bc-e8a4-4e73-b8be-63364c29d753"
## 5. open url in browser and enter password, copy the code from the last part
##    of the URL and enter for mutt_oauth2.py # 6. run neomutt, `~/.gnupg/gpg.conf`

#set pgp_sign_as=0x123456789

## IMAP
#set imap_user = "<user>@outlook.com"
set imap_user = "<user>@outlook.com"
set imap_authenticators = "xoauth2"
## `pinentry-mode loopback` might cause trouble for gpg passphrase verification
set imap_oauth_refresh_command = "/usr/share/neomutt/oauth2/mutt_oauth2.py --decryption-pipe 'gpg --decrypt --pinentry-mode default' ~/.cache/mutt/oauth-account1"

## SMTP
## for SMTP server:
#set smtp_url = "smtps://<user>@smtp.aliyun.com:465/"
## for SMTPS-based SMTP server:
set smtp_url = smtp://$imap_user@smtp.office365.com:587
set realname = '<user>'
set smtp_authenticators = ${imap_authenticators}
set smtp_oauth_refresh_command = ${imap_oauth_refresh_command}
set from=<user>@outlook.com
set ssl_force_tls = yes
set smtp_url=smtp://$imap_user@smtp.office365.com:587
set ssl_starttls = yes

## MAILBOX
## for mbsync local mail:
set folder = "~/doc/mail/account1"
#set folder = "imaps://imap.aliyun.com"
#set folder = "imaps://outlook.office365.com"
unmailboxes *
set spoolfile = "+INBOX"
unset record # outlook and gmail auto saves sent to here
set trash = "+Deleted" # delete mails will be saved to here
set postponed = "+Drafts"
mailboxes "=INBOX" "=Drafts" "=Sent" "=Junk" "=Deleted" "=Archive"

## check for all IMAP folders
#set imap_check_subscribed

## store message headers locally
#set header_cache = "~/.cache/mutt/account1/headers"
## store message locally
#set message_cachedir = "~/.cache/mutt/account1/bodies"

#set certificate_file = "~/.cache/mutt/account1/certificates"
