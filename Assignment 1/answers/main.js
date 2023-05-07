const express = require('express');
const app = express();

var cors = require("cors");
app.use(cors()); 



const Person = require('./person');

const port = 3000;

let people = [];

app.get('/', (req, res) => {
    return res.send('Hello World!');
});


app.get('/persons', (req, res) => {
    // return all people as json
    return res.json(people);
});


app.get('/persons', (req, res) => {
    const id = req.params.id;

    const person = people.find((p) => p.id === id);

    if (!person) {
        return res.status(404).send('Person not found');
    }

    return res.status(200).json(person);
});


app.post('/persons', (req, res) => {
    const person = new Person(req.query.name, parseInt(req.query.age), req.query.email);

    console.log(person);

    people.push(person);
    return res.json(person);
})

app.put('/persons/:id', (req, res) => {
    const id = req.params.id;
    const person = people.find((p) => p.id === id);

    if (!person) {
        return res.status(404).send('Person not found');
    }

    person.name = req.query.name;
    person.age = parseInt(req.query.age);
    person.email = req.query.email;


    // replace the person in the array
    people = people.map((p) => {
        if (p.id === id) {
            return person;
        }
        return p;
    });

    return res.json(person);
});


app.delete('/persons/:id', (req, res) => {
    const id = req.params.id;
    const person = people.find((p) => p.id === id);
    if (!person) {
        return res.status(404).send('Person not found');
    }
    people = people.filter((p) => p.id !== id);
    return res.json(person);
})

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);

    // create some fake people to work with
    for (let i = 0; i < 20; i++) {
        people.push(Person.fake());
    }

})
