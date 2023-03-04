
/**
 * This file is part of the Phalcon Framework.
 *
 * (c) Phalcon Team <team@phalcon.io>
 *
 * For the full copyright and license information, please view the LICENSE.txt
 * file that was distributed with this source code.
 */

namespace Phalcon\Cli;

use Phalcon\Di\AutowireInterface;
use Phalcon\Di\DiInterface;
use Phalcon\Di\Injectable;
use Phalcon\Events\EventsAwareInterface;
use Phalcon\Events\ManagerInterface;

/**
 * Every command-line task should extend this class that encapsulates all the
 * task functionality
 *
 * A task can be used to run "tasks" such as migrations, cronjobs, unit-tests,
 * or anything that you want. The Task class should at least have a "mainAction"
 * method.
 *
 *```php
 * class HelloTask extends \Phalcon\Cli\Task
 * {
 *     // This action will be executed by default
 *     public function mainAction()
 *     {
 *
 *     }
 *
 *     public function findAction()
 *     {
 *
 *     }
 * }
 *```
 */
class Task extends Injectable implements TaskInterface, EventsAwareInterface
{
    /**
     * @var ManagerInterface
     */
    protected eventsManager;

    /**
     * Phalcon\Cli\Task constructor
     */
    final public function __construct()
    {
        var autowire, container;

        if method_exists(this, "onConstruct") {
            let container = this->getDI();

            if method_exists(container, "getAutowire") {
                let autowire = container->getAutowire();
            }

            if autowire && autowire instanceof AutowireInterface {
                autowire->resolveMethod(container, this, "onConstruct");
            } else {
                this->{"onConstruct"}();
            }
        }
    }

     /**
     * Returns the internal event manager
     */
    public function getEventsManager() -> <ManagerInterface> | null
    {
        return this->eventsManager;
    }

    /**
     * Sets the events manager
     */
    public function setEventsManager(<ManagerInterface> eventsManager) -> void
    {
        let this->eventsManager = eventsManager;
    }
}
