Source = require('../source')

Nume =
  firstName: (gender) ->
    throw 'Invalid gender.' if gender? && (gender != 'male' && gender != 'female')

    if !gender?
      pool = Source.firstName.male.concat Source.firstName.female 
    else
      pool = Source.firstName[gender]

    pool[Math.floor(Math.random() * pool.length)]

  lastName: ->
    Source.lastName[Math.floor(Math.random() * Source.lastName.length)]

  isInDatabase: (string) ->
    firstNameData = Source.firstName.male.concat Source.firstName.female
    lastNameData = Source.lastName

    nameDatabase = firstNameData.concat lastNameData
    return string in nameDatabase

  isRomanian: (string) ->
    nameArray = string.split(" ")

    romanianNames = nameArray.filter (name) ->
      Nume.isInDatabase name

    return (romanianNames.length / nameArray.length * 100) >= 50

module.exports = Nume
