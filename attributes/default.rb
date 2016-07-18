default['sysdig']['install_method'] = 'binary'

default['sysdig']['yum']['base_url'] = 'http://download.draios.com/stable/rpm/$basearch'
default['sysdig']['yum']['gpg_key'] = 'https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public'

default['sysdig']['apt']['uri'] = 'http://download.draios.com/stable/deb'
default['sysdig']['apt']['components'] = ["stable-$(ARCH)/"]
default['sysdig']['apt']['key'] = 'https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public'
default['sysdig']['apt']['key_id'] = 'EC51E8C4'
