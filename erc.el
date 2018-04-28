(use-package erc
  :config
  (progn
    (setq
     erc-autojoin-channels-alist (quote (("unistra.fr" "#geodata")))
     erc-modules (quote (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands notifications readonly ring smiley stamp spelling track))
     erc-nick "jonathan"
     erc-server "irc.unistra.fr:6667"
     )
    )
  )
