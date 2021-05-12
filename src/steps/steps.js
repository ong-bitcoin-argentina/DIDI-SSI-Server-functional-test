const {Given, When, Then, AfterAll, After} = require('cucumber');
const assert = require('assert').strict
const restHelper = require('../util/restHelper');

Given('A account {}', function (request) {
    this.context['request'] = JSON.parse(request);
});

Given('A account', function () {
});

Given('A token {}', function (request) {
    this.context['request'] = JSON.parse(request);
});

When('I send POST request to {}', async function (path) {
    this.context['response'] = await restHelper.postData(`${process.env.SERVICE_URL}${path}`, this.context['request']);
});

When('I send POST request to {} {}', async function (path, id) {
    this.context['response'] = await restHelper.postData(`${process.env.SERVICE_URL}${path + id}`, this.context['request']);
});

When('I send PATCH request to {}', async function (path) {
    this.context['response'] = await restHelper.postData(`${process.env.SERVICE_URL}${path}`, this.context['request']);
});

When('I send DELETE request to {} {}', async function (path,param) {
    this.context['response'] = await restHelper.postData(`${process.env.SERVICE_URL}${path + param}`);
});

When('I send DELETE request to route {string}', async function (path) {
    this.context['response'] = await restHelper.postData(`${process.env.SERVICE_URL}${path}`);
});

When('I send GET request to {}', async function (path) {
    this.context['response'] = await restHelper.getData(`${process.env.SERVICE_URL}${path}`);
});

When('I send GET request to {} {string}', async function (path, id) {
    this.context['response'] = await restHelper.getData(`${process.env.SERVICE_URL}${path+id}`);
});

Then('I get response code {int}', async function (code) {
    assert.equal(this.context['response'].status, code);
});
Then('I get response code {int} and body {}', async function (code, body) {
    assert.equal(this.context['response'].status, code);
    console.log(this.context['response']);
    assert.equal(this.context['response'].data['status'], body);

});
