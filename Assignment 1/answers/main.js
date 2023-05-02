const express = require('express');
const app = express();


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
    const person = new Person(req.params.name, req.params.age, req.params.email);
    people.push(person);
    return res.json(person);
})


app.delete('/persons', (req, res) => {
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