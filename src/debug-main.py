try:
    import ptvsd
    ptvsd.enable_attach(address=('0.0.0.0',3000))
    print('wait for debugger to attach')
    ptvsd.wait_for_attach()
    import main

    main.main()

except Exception as ex:
    print('Not working: {}'.format(ex))
