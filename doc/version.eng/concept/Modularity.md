# Modularity of the system

Describe differences between modular and monolithic systems and concepts behind it.

### The system and its components.

Lets try to conceptualize what module is from engineer perspective. In computer science module could be represented by 3 crucial components:

- Source code.
- Test
- Documentation.

Similarly in any other engineering field module consists of 3 components. Development of each part takes relatively same time.

### The interface

What is common between documentation and source code? What is common between source code and test? The interface in general. Documentation describes either API of the system or UI. Test covers API of the system either its UI. Interface is a glue which stick together all elements of the system.

![The system](../../img/modularity/TheSystem.png)

On the diagram above interface is the borderline between all components of the system. Source code ( or any kind of blueprint ) is the core component of the system. Source can exist and be functional itself but to make interaction between engineer and the system productive the system should have documentation as well as test.

Interface can be conceptualized like a language between elements of the system. Documentation aim to describe all grammatically and syntactically correct texts in human-human ( natural ) language and test do the same thing in human-machine ( programming ) language.

### Documentation

Documentation sharps learning curve of engineer having limited knowledge about the system. Documentation becomes outdated if interface undergo changes.

![The system](../../img/modularity/LearningCurve.png)

On the diagram above you may see learning curve depending of presence of documentation.

Such relations are evident:

- Documentation improves analyzability of the system.
- More volatile interface - more cost of updating documentation.
- More documentation written - more cost of updating documentation.
- Bigger team - more value from documentation.
- No value from documentation if team is a single person.
- Documentation improve cooperation of the team because it costs less for one team member to reuse work of another.
- Documentation has cost, but it could decrease overall cost of the system improving learning curve and cooperation of the team.

### Test

Test as well as documentation is based on an interface either API or any kind of UI. Test is required to make sure interaction with the system produce expected results. Fixing interface unchangeable is by-product of that. Unlike documentation test restricts source code, not opposite. Changes in source code could cause change of the interface what causes outdating of documentation, but source code cant be changed without changing test if development process follows rules of test driven development ( TDD ).

![The system](../../img/modularity/RestrictingChain.png)

On the diagram above you may see that test restricts source code and source code restricts documentation. Changes in tests invalidate source code, but changes in source code invalidates documentation. This is valid if test driven development technique is followed.

Such relations are evident:

- Test improves maintainability of the system, engineer become more confident about the code.
- Test improve reliability and stability of the system decreasing number of bugs.
- Test encourages engineer to refactor the system what make it more robust.
- Resilience test improves resilience of the system.
- Negative testing improves fault tolerance of the system.
- Test can increase portability of the system because test require defined abstract interface what pushes engineer toward more abstract solutions decoupled from the platforms.
- Efficiency test improves efficiency and performance of the system encouraging engineer to focus on performance issues.
- Test improve reusability of the system because tests leverage defining interfaces what is required for reusing the system as a module.
- Test make changing of the interface more costly.
- More times the system reused more benefit from tests. The system which used only once has non-zero value too.
- Test has cost, but it could decrease overall cost of the system improving maintainability and other property of the system. Good test are often longer than source code.

### Blueprint

Source code is central component of the system because it is functional part, unlike test and documentation. On diagrams source code is yellow circle inside the interface exposed by it.

### Modularization

From architectural point of view system could be monolithic or modular. Each architecture has pros and cons.

Modularization is the architectural design process of replacing a monolithic system by several modules which are interrelated somehow. Each module is itself a system. A module could depends of another module or few.

![Modularization](../../img/modularity/Modularization.png)

On the diagram above one monolithic system produce 5 modules. Each module has its own documentation, test and source code as well as interface. Modularization gives lots of benefits, but it inflates interface as well as area of 3 components of the system.

On practice most variants of input data often are not used what let significantly decrease cost of development if the system is monolithic. But modularization exposes such interfaces and test becomes requirement. More than half time of writing tests takes covering extreme degenerate cases. In system with monolithic design such cases are often out of focus. On the other hand there could be no confidence in systems with monolithic design with high complexity.

Modular system cons

- Modular system has larger interfaces and inflated area to cover.
- Modular system could have extensive functionality, requires extensive tests and extensive documentation what could be avoided in monolithic systems.
- Modular system is more difficult to setup properly.
- Modular system is more sensitive to technical debt buildup.
- Increase cost of tests covering.
- Increase cost of documenting.

Modular system pros

- Modularization increases maintainability.
- Modularization increases extendability and configurability.
- Modularization improves testability.
- Improve scalability because of replaceability of parts.
- Development of modular system is easier to distribute between team members or the world.
- Decrease cost of maintenance.
- Increase complexity limit of the system which could be designed.
- Improve privacy through different policies behind different modules.

### Modularization for pu

[Back to content](../README.md#Concepts)
