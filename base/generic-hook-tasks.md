
## Open tasks for adjusting hooks support for generic hooks

- provide deprecation commands for

    - \ProvideHook
    - \ProvideReversedHook
    - \ProvideHookPair
    - \hook_provide:n
    - \hook_provide_reversed:n
    - \hook_provide_pair:n


- simplify logic:

    - if activation only works on normal hooks the logic for checking
      and executing could be made simpler in the future


- test files

    - lthooks-029 needs cleanup
    - lthooks-error needs cleanup
