def build_test_command(base):
    def test_command(args):
        if args.test_method == 'ci':
            test_ci = base.build_command_func('docker-compose run ci yarn run test-cov-jenkins')
            test_ci(args)
        else:
            test_dev = base.build_command_func(f"docker-compose run --rm dev yarn run {args.test_method}")
            test_dev(args)
    return test_command

def init_gadget(gobase):
    gobase.register_start()
    gobase.register_stop()
    gobase.register_clean()

    gobase.register_custom_child('lint', 'Run the linter', lint)
    
    test_subparser = gobase.register_test(build_test_command(gobase))
    test_subparser.add_argument('test_method',
                                choices=['debug', 'ci', 'test'],
                                default='test',
                                nargs='?',
                                help='help run the tests in a specific way')
