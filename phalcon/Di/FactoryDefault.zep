
/**
 * This file is part of the Phalcon Framework.
 *
 * (c) Phalcon Team <team@phalcon.io>
 *
 * For the full copyright and license information, please view the LICENSE.txt
 * file that was distributed with this source code.
 */

namespace Phalcon\Di;

use Phalcon\Filter\FilterFactory;

/**
 * This is a variant of the standard Phalcon\Di\Di. By default it automatically
 * registers all the services provided by the framework. Thanks to this, the
 * developer does not need to register each service individually providing a
 * full stack framework
 */
class FactoryDefault extends \Phalcon\Di\Di
{
    /**
     * Phalcon\Di\FactoryDefault constructor
     */
    public function __construct(<AutowireInterface> autowire = null, bool addBinds = false)
    {
        var filter;

        parent::__construct(autowire);

        let filter = new FilterFactory();

        let this->services = [
            "annotations"        : new Service("Phalcon\\Annotations\\Adapter\\Memory", true),
            "assets"             : new Service(
                [
                    "className" : "Phalcon\\Assets\\Manager",
                    "arguments" : [
                        [
                            "type" : "service",
                            "name" : "tag"
                        ]
                    ]
                ],
                true
            ),
            "crypt"              : new Service("Phalcon\\Encryption\\Crypt", true),
            "cookies"            : new Service("Phalcon\\Http\\Response\\Cookies", true),
            "dispatcher"         : new Service("Phalcon\\Mvc\\Dispatcher", true),
            "escaper"            : new Service("Phalcon\\Html\\Escaper", true),
            "eventsManager"      : new Service("Phalcon\\Events\\Manager", true),
            "flash"              : new Service("Phalcon\\Flash\\Direct", true),
            "flashSession"       : new Service("Phalcon\\Flash\\Session", true),
            "filter"             : new Service(filter->newInstance(), true),
            "helper"             : new Service("Phalcon\\Support\\HelperFactory", true),
            "modelsManager"      : new Service("Phalcon\\Mvc\\Model\\Manager", true),
            "modelsMetadata"     : new Service("Phalcon\\Mvc\\Model\\MetaData\\Memory", true),
            "request"            : new Service("Phalcon\\Http\\Request", true),
            "response"           : new Service("Phalcon\\Http\\Response", true),
            "router"             : new Service("Phalcon\\Mvc\\Router", true),
            "security"           : new Service("Phalcon\\Encryption\\Security", true),
            "tag"                : new Service(
                [
                    "className" : "Phalcon\\Html\\TagFactory",
                    "arguments" : [
                        [
                            "type" : "service",
                            "name" : "escaper"
                        ]
                    ]
                ],
                true
            ),
            "transactionManager" : new Service("Phalcon\\Mvc\\Model\\Transaction\\Manager", true),
            "url"                : new Service("Phalcon\\Mvc\\Url", true)
        ];

        if autowire != null && addBinds {
            autowire->addBinds([
                "Phalcon\\Annotations\\Adapter\\Memory": "annotations",
                "Phalcon\\Assets\\Manager": "assets",
                "Phalcon\\Encryption\\Crypt": "crypt",
                "Phalcon\\Http\\Response\\Cookies": "cookies",
                "Phalcon\\Mvc\\Dispatcher": "dispatcher",
                "Phalcon\\Html\\Escaper": "escaper",
                "Phalcon\\Events\\Manager": "eventsManager",
                "Phalcon\\Flash\\Direct": "flash",
                "Phalcon\\Flash\\Session": "flashSession",
                "Phalcon\\Mvc\\Model\\Manager": "modelsManager",
                "Phalcon\\Mvc\\Model\\MetaData\\Memory": "modelsMetadata",
                "Phalcon\\Http\\Request": "request",
                "Phalcon\\Http\\Response": "response",
                "Phalcon\\Mvc\\Router": "router",
                "Phalcon\\Encryption\\Security": "security",
                "Phalcon\\Html\\TagFactory": "tag",
                "Phalcon\\Mvc\\Model\\Transaction\\Manager": "transactionManager",
                "Phalcon\\Mvc\\Url": "url",
                "Phalcon\\Filter\\Filter": "filter"
            ]);
        }
    }
}
