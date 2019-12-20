def build_version_command(base):
    def version_command(args):
        if args.asset == 'package-json':
            version_package_json_file(package_json_location, get_version())
            exit(0)
        elif args.asset == 'all':
            version_package_json_file(package_json_location, get_version())

        version_image = base.build_command_func(f"docker tag {service_image_name} {service_image_name}:{get_version()}")
        version_image(args)
    return version_command

def init_gadget(gobase):
    gobase.register_start()
    gobase.register_stop()
    gobase.register_clean()

    version_subparser = gobase.register_custom_child('version', 'version the image built for this service', build_version_command(gobase))
    version_subparser.add_argument('asset',
                                   choices=['all', 'package-json', 'image'],
                                   default='all',
                                   nargs='?',
                                   help='version assets of the service')
