@RestResource(urlMapping='/contact')
global with sharing class MyRestResourceApexClass  {

    @HttpGet
    global static Contact show() {

        Contact obj;

        return obj;

    }

    @HttpPost
    global static Contact create() {

        Contact obj;

        return obj;

    }

    @HttpPut
    global static Contact updateObject() {

        Contact obj;

        return obj;

    }

    @HttpDelete
    global static void remove() {

    }

}