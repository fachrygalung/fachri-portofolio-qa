# Robot Framework - Sauce Demo Automation

This project is a UI automation testing framework developed using Robot Framework and SeleniumLibrary for the Sauce Demo web application.

The framework is designed to automate end-to-end user scenarios while applying reusable keywords and a modular project structure. It generates detailed execution reports, logs, and screenshots to support efficient test analysis and maintenance.

## 🌐 Platform

- Websites

## 🛠️ Tech Stack

- Robot Framework 7.4.2
- SeleniumLibrary 6.9.0
- Python 3.10
- Chrome Browser
- VS Code Editor
- Github Version Control

## 🔌 VS Code Extension

- *RobotCode - Robot Framework Support v2.6.2 by Daniel Biehl*

## 📂 Project Structure

```text
.
├── config/
├── resources/
│   ├── keywords/
│   ├── locators/
│   ├── utils/
├── reports/
├── tests/
├── data/
└── README.md
```

## 🚀 Installation

- this is for robotframework installation

```bash
pip install robotframework
```

- this is for selenium library

```bash
pip install robotframework-seleniumlibrary
```

## ▶️ Run Test

Run all test cases:

```bash
robot tests/
```

Run login test only:

```bash
robot tests/login.robot
```

## 📊 Test Reports

After executing the test suite, Robot Framework generates the following reports:

| File | Description |
|------|-------------|
| `report.html` | Test execution summary |
| `log.html` | Detailed execution log |
| `output.xml` | Test execution result in XML format |

### Summary Report

- Report Summary Preview
![Report](./Sauce%20Demo/screenshot/report%201.png)

- Report Detail Preview
![Report](./Sauce%20Demo/screenshot/report%202.png)

- Detail Log Preview
![Log](./Sauce%20Demo/screenshot/detail%20log.png)

## 👨‍💻 Author

### Fachri Firmansyah Hutagalung
