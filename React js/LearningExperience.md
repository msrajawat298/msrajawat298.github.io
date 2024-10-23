# React.js Learning Experience

This repository documents my learning journey with React.js, providing a structured outline of topics covered, best practices, common pitfalls, and useful tips. The goal is to serve as a reference and guide for both beginners and experienced developers diving into React.js development.

## Getting Started

To begin your React.js learning journey, follow the official [React.js documentation](https://react.dev/learn/start-a-new-react-project).

## Topics to Cover

- Introduction to React
- Setting Up a React Project
  - Understand `package.json` configuration
  - Difference between `devDependencies` and `dependencies`
- Understanding Components
- React JSX & React Fragment
- React Props and Hooks
- React Events and Event Handling (e.g., onClick, onChange)
- State Management
- Re-rendering Components
- Conditional Rendering
- Virtual DOM Update
- Lifecycle Methods
- Component State vs. Redux Confusion
- React Router
- What setupTests.js file

## Best Practices
* Recommend Don’t use pure react CRA (Create React App) (https://react.dev/learn/start-a-new-react-project)
* If you are using core react js then you can use webpack for minify your js, css etc.
* Implement module bundler like webpack or vite similar type of pacakge we can use
* Keeping components small and focused.
* DRY (Don't Repeat Yourself) principles.
* Code organization and folder structure.
* Use Husky, lint, prettier, sonarqube. These tools help maintain code quality and formatting standards.
* Implement React unit test, snapshots etc.

## Common Pitfalls and Solutions

- Avoid common mistakes:
  - Neglecting Error Boundaries
  - Not Using `key` Properly
  - Understand the difference between `onClick = callFunction()` and `onClick = () => callFunction()`
  - Pay attention to React-specific keywords like `className`, `onChange`, `onKeyUp`
  - `key` is required when printing lists using `ul`, `li`, or similar elements
  - Create separate files for utility, constants, environment variables, and style components
- Use functional components instead of classes ([React Function Components](https://react.dev/docs/components-and-props#function-and-class-components))
- Consider reasons not to use pure React ([Why Not Pure React](https://react.dev/learn/start-a-new-react-project))

## Tips for Debugging React Applications

- Use `console.trace()`
- Learn how to test packages locally without releasing them
- How to check code coverage in local system before pushing the code?

## VS Code Extensions

- [ES7+ React/Redux/React-Native Snippets](https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [Jest](https://marketplace.visualstudio.com/items?itemName=Orta.vscode-jest)
- [vscode-styled-components](https://marketplace.visualstudio.com/items?itemName=jpoissonnier.vscode-styled-components)
- [JavaScript Booster](https://marketplace.visualstudio.com/items?itemName=sburg.vscode-javascript-booster)
- [Prettier ESLint](https://marketplace.visualstudio.com/items?itemName=rvest.vs-code-prettier-eslint)
- [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense)
- [Turbo Console Log](https://marketplace.visualstudio.com/items?itemName=ChakrounAnas.turbo-console-log)
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- [Live server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)

## Reference Links

- [General JS Toolkit](https://github.com/vitabletech/general-js-toolkit)
- [React.js Examples](https://github.com/msrajawat298/msrajawat298.github.io/tree/main/React%20js)
- [Git Help](https://github.com/msrajawat298/msrajawat298.github.io/tree/main/git_help)
- [React App Template](https://github.com/msrajawat298/react-app-template)
- [React Vite Starter App Template](https://github.com/vitabletech/react-vite-starter-app-template)
- [W3Schools React Tutorial](https://www.w3schools.com/react/react_getstarted.asp)
- [React Official Documentation](https://react.new/)
- [React Component Reference](https://react.dev/reference/react/Component)
- [Browser DOM vs. Virtual DOM](https://media.geeksforgeeks.org/wp-content/uploads/20230725135348/Browser-DOM-Virtual-DOM-copy.webp)
- [SonarQube](https://www.sonarsource.com/products/sonarcloud/)
- [React Testing Library](https://testing-library.com/docs/react-testing-library/intro/)
- [Jest Documentation](https://jestjs.io/docs/tutorial-react)
- [DOM Testing Library Cheatsheet](https://testing-library.com/docs/dom-testing-library/cheatsheet)
- [running-tests](https://create-react-app.dev/docs/running-tests/)
- [vite vs webpack](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*vmJC9y5GRk_ZYS0GbI_w7Q.png)
- [vite-crash-course](https://www.traversymedia.com/blog/vite-crash-course)
- [Some more usefull features in vite: ](https://www.youtube.com/watch?v=89NJdbYTgJ8&ab_channel=Traversy)