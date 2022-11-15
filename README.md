#Readme

##Self Evaluation

###Functionality
  - I successfully implemented en/decrypt CLI interfaces. They appropriately output encrypted and decrypted messages and return the key and date used in the process.

  - I have some aspects of 'crack' working. I did not implement an Enigma.crack method, but I have working methods that could compute a shift needed to decode a message without being given a key, only a date.

###OOP
  - I feel that I have done a good job breaking down the project into logical components. The enigma class acquires data from the command line interface and injects a Cipher class with this data so that it can appropritaley transform a message, whether decrypting or encrypting.
  - Many of my classes follow SRP, I have a class for generating keys, dates, and shifts. The Cipher stores instances of these classes so that it can take any message and transform it using that data, whether it is encrypting or decrypting.
  - I did not use a module or an inhertiance structure but I think that this is a good thing. My code is very DRY, there is not a behavior that I felt needed to be shared between classes. Furthermore, I wouldn't describe the difference between an encryption and a decryption as following an is_a relationship. Rather I have isolated the thing that varies, a negative or positive direction shifted on the alphabet, and injected that varying behavior into one class. 

###Ruby Conventions and Mechanics
  - I feel my code follows ruby conventions for the most part. I have short and efficient methods, nothing more than a few lines long. Many, although not all, of my enumerables were best choice for the given situation, such as map.with_index etc,.

###TDD 
  - Every method is tested at both the unit and integration level. I use mocks and stubs to get data 'above' objects in a tree structure. I have test coverage over 95%.

###Version Control
  - I made more than 7 PRs and more than 75 commits, far above the 40 needed for suggested proper version control. Most of my PRs represent logical pieces of functionality. Admittied the refactor/enigma branch was a much larger and less well organized feature as far as version control is concerned. I started to let considerations concerning the 'crack' method bleed into that feature. 