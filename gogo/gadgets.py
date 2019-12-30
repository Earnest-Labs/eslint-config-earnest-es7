def init_gadget(gobase):
    gobase.register_start()
    gobase.register_stop()
    gobase.register_clean()

    gobase.register_custom_child('publish', 'publish the image for this library',
                         f"npm install autopublish && ./node_modules/.bin/autopublish . .")