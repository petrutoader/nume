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

module.exports = Nume
