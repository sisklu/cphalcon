
extern zend_class_entry *phalcon_di_factorydefault_ce;

ZEPHIR_INIT_CLASS(Phalcon_Di_FactoryDefault);

PHP_METHOD(Phalcon_Di_FactoryDefault, __construct);

ZEND_BEGIN_ARG_INFO_EX(arginfo_phalcon_di_factorydefault___construct, 0, 0, 0)
	ZEND_ARG_OBJ_INFO(0, autowire, Phalcon\\Di\\AutowireInterface, 1)
	ZEND_ARG_TYPE_INFO(0, addBinds, _IS_BOOL, 0)
ZEND_END_ARG_INFO()

ZEPHIR_INIT_FUNCS(phalcon_di_factorydefault_method_entry) {
	PHP_ME(Phalcon_Di_FactoryDefault, __construct, arginfo_phalcon_di_factorydefault___construct, ZEND_ACC_PUBLIC|ZEND_ACC_CTOR)
	PHP_FE_END
};
