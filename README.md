# swift_concurrency_hooks

An executable package to reproduce a bug with the ```swift_task_enqueueMainExecutor_hook```, i.e. it is never called even though user code assigns a closure to it. ```swift_task_enqueueGlobal_hook``` works as expected though.
