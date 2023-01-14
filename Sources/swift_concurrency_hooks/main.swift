import ConcurrencyRuntimeC

swift_task_enqueueGlobal_hook = { job, original in 
    print("enqueueGlobal")
    original(job)
}

swift_task_enqueueMainExecutor_hook = { job, original in 
    print("enqueueMainExecutor")
    original(job)
}

@MainActor
func someMainActorFunc() async {
    print("We are running on the main actor?")
}

Task { @MainActor in 
    print("Main actor task 1")
}

Task.detached { @MainActor in
    print("Main actor task 2")
}

Task.detached {
    print("Non main actor task")
}

await Task.detached {
    await someMainActorFunc()
    await withTaskGroup(of: Void.self) { group in 
        for _ in 0..<5 {
            group.addTask {
                try! await Task.sleep(nanoseconds: 1_000_000_000)
            }
        }
    }
    print("Done")
}.value
