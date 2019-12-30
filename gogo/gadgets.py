def init_gadget(gobase):
    gobase.register_start()
    gobase.register_stop()
    gobase.register_clean()

    version_subparser.add_argument('asset',
                                   choices=['all', 'package-json', 'image'],
                                   default='all',
                                   nargs='?',
                                   help='version assets of the service')
