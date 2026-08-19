# Write-up: [your name]

> Fill in each section below. Bullet points are fine. Clarity beats length.
> If you're invited to the Assessment Day you'll talk an engineer through this
> document, so write it as something you'd be happy to present.

## 1. What was broken

List each fault you found and fixed. For each one: where it was, what the
symptom was, what the root cause was, and what you changed.

| # | Where (file) | Symptom						  | Root cause																	   | My fix																			 |
|---|--------------|----------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| 1 | Package.json | unable to start				  | Starting script targeted index.js which does not exist						   | Changed index.js to server.js													 |
| 2 | Package.json | unable to start				  | Did not contain all used packages within the dependencies					   | Added morgan package to the dependencies										 |
| 3 | server.json  | unable to start				  | Was listening to the wrong port												   | Changed port 300 to port 3000													 |
| 4 | server.json  | Could not toggle completed flag  | Was compareing an int to a string in app.put								   | Changed req.params.id to a int variable so comparison would be correct			 |
| 5 | server.json  | Could not delete highest id todo | Was using the todo id to splice array cousing out of bound error in app.delete | used the index of the todo id instead to stop out of bounds error when splicing |

## 2. Security concerns

Which of the issues above (or anything else you spotted) were security
problems? Why do they matter, and what could someone actually do with them?

1) The Admin token was hard coded into the server.js file. This is a security concern because if someone were to gain access to the codebase, they would have access to the admin token and could potentially perform unauthorized actions on the application.
2) The app.get('api/debug') exposed the env:process.env variable. This is a security concern because it could potentially expose sensitive information about the environment in which the application is running, such as database credentials or API keys. An attacker could use this information to gain unauthorized access to the application or its resources.
3) There is no authentication or authorization implemented in the application. This is a security concern because it means that anyone can access the application's endpoints and perform actions without any restrictions. An attacker could exploit this vulnerability to perform unauthorized actions, such as deleting or modifying data.
4) The application does not validate user input. This is a security concern because it could allow an attacker to inject malicious code or data into the application, potentially leading to security vulnerabilities such as SQL injection or cross-site scripting (XSS) attacks.

## 3. How to run my submission

- App: `cd app && npm install && npm start` (plus anything extra I've added:)
- Log tool: `./analyse.sh <LEVEL> <path-to-log-file>` (written in [language])
- Anything else an engineer needs to know to run or test my work: I used the bash ../analyse.sh ERROR ../logs/app-events.log command to get it to work on my local machine.

## 4. My top three production improvements

Exactly three, in priority order, with your reasoning for both the choice and
the order.

1. Validate user input to prevent malicious code or data injection.
2. Implement authentication and authorization to restrict access to the application's endpoints and actions.
3. Add better and more comprehensive error handling to improve the application's stability and user experience.

## 5. Optional extensions (if attempted)

Which did you pick, why, how far did you get, and what would you finish with
more time?

## 6. How I used AI tools

Which tools (if any), what you used them for, where they helped, and where
they were wrong or you overrode them. Honesty here is a positive signal.

I used Github Copilot to double check any errors that was in the code and the changes I made to fix these errors.
I also used Github Copilot to help me research and write the analyse.sh script to read the log file and output the correct information.

## 7. Reflections

- The hardest part of this exercise was: Was creating the analyse.sh script to read the log file and output the correct information.
- One thing I learned doing it: I had to research how to read files in bash and how to use grep and awk to filter the log file.
- If I had another day, I would: Try to attempt the optional challenges.
