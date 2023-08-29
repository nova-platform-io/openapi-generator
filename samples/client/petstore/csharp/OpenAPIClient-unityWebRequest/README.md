# Org.OpenAPITools - the C# library for the OpenAPI Petstore

This spec is mainly for testing Petstore server and contains fake endpoints, models. Please do not use this for any other purpose. Special characters: \" \\

This C# SDK is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 1.0.0
- SDK version: 1.0.0
- Build package: org.openapitools.codegen.languages.CSharpClientCodegen

<a id="version-support"></a>
## Version support
This generator should support all current LTS versions of Unity
- Unity 2020.3 (LTS) and up
- .NET Standard 2.1 / .NET Framework

<a id="dependencies"></a>
## Dependencies

- [Newtonsoft.Json](https://docs.unity3d.com/Packages/com.unity.nuget.newtonsoft-json@3.0/manual/index.html) - 3.0.2 or later
- [Unity Test Framework](https://docs.unity3d.com/Packages/com.unity.test-framework@1.1/manual/index.html) - 1.1.33 or later

<a id="installation"></a>
## Installation
Add the dependencies to `Packages/manifest.json`
```
{
  "dependencies": {
    ...
    "com.unity.nuget.newtonsoft-json": "3.0.2",
    "com.unity.test-framework": "1.1.33",
  }
}
```

Then use the namespaces:
```csharp
using Org.OpenAPITools.Api;
using Org.OpenAPITools.Client;
using Org.OpenAPITools.Model;
```

<a id="getting-started"></a>
## Getting Started

```csharp
using System;
using System.Collections.Generic;
using UnityEngine;
using Org.OpenAPITools.Api;
using Org.OpenAPITools.Client;
using Org.OpenAPITools.Model;

namespace Org.OpenAPIToolsExample
{

    public class Call123TestSpecialTagsExample : MonoBehaviour
    {
        async void Start()
        {
            Configuration config = new Configuration();
            config.BasePath = "http://petstore.swagger.io:80/v2";
            var apiInstance = new AnotherFakeApi(config);
            var modelClient = new ModelClient(); // ModelClient | client model

            try
            {
                // To test special tags
                ModelClient result = await apiInstance.Call123TestSpecialTagsAsync(modelClient);
                Debug.Log(result);
                Debug.Log("Done!");
            }
            catch (ApiException e)
            {
                Debug.LogError("Exception when calling AnotherFakeApi.Call123TestSpecialTags: " + e.Message );
                Debug.LogError("Status Code: "+ e.ErrorCode);
                Debug.LogError(e.StackTrace);
            }

        }
    }
}
```

<a id="documentation-for-api-endpoints"></a>
## Documentation for API Endpoints

All URIs are relative to *http://petstore.swagger.io:80/v2*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AnotherFakeApi* | [**Call123TestSpecialTags**](AnotherFakeApi.md#call123testspecialtags) | **PATCH** /another-fake/dummy | To test special tags
*DefaultApi* | [**FooGet**](DefaultApi.md#fooget) | **GET** /foo | 
*DefaultApi* | [**GetCountry**](DefaultApi.md#getcountry) | **POST** /country | 
*DefaultApi* | [**Hello**](DefaultApi.md#hello) | **GET** /hello | Hello
*DefaultApi* | [**RolesReportGet**](DefaultApi.md#rolesreportget) | **GET** /roles/report | 
*DefaultApi* | [**Test**](DefaultApi.md#test) | **GET** /test | Retrieve an existing Notificationtest's Elements
*FakeApi* | [**FakeHealthGet**](FakeApi.md#fakehealthget) | **GET** /fake/health | Health check endpoint
*FakeApi* | [**FakeOuterBooleanSerialize**](FakeApi.md#fakeouterbooleanserialize) | **POST** /fake/outer/boolean | 
*FakeApi* | [**FakeOuterCompositeSerialize**](FakeApi.md#fakeoutercompositeserialize) | **POST** /fake/outer/composite | 
*FakeApi* | [**FakeOuterNumberSerialize**](FakeApi.md#fakeouternumberserialize) | **POST** /fake/outer/number | 
*FakeApi* | [**FakeOuterStringSerialize**](FakeApi.md#fakeouterstringserialize) | **POST** /fake/outer/string | 
*FakeApi* | [**GetArrayOfEnums**](FakeApi.md#getarrayofenums) | **GET** /fake/array-of-enums | Array of Enums
*FakeApi* | [**TestBodyWithFileSchema**](FakeApi.md#testbodywithfileschema) | **PUT** /fake/body-with-file-schema | 
*FakeApi* | [**TestBodyWithQueryParams**](FakeApi.md#testbodywithqueryparams) | **PUT** /fake/body-with-query-params | 
*FakeApi* | [**TestClientModel**](FakeApi.md#testclientmodel) | **PATCH** /fake | To test \"client\" model
*FakeApi* | [**TestEndpointParameters**](FakeApi.md#testendpointparameters) | **POST** /fake | Fake endpoint for testing various parameters 假端點 偽のエンドポイント 가짜 엔드 포인트 
*FakeApi* | [**TestEnumParameters**](FakeApi.md#testenumparameters) | **GET** /fake | To test enum parameters
*FakeApi* | [**TestGroupParameters**](FakeApi.md#testgroupparameters) | **DELETE** /fake | Fake endpoint to test group parameters (optional)
*FakeApi* | [**TestInlineAdditionalProperties**](FakeApi.md#testinlineadditionalproperties) | **POST** /fake/inline-additionalProperties | test inline additionalProperties
*FakeApi* | [**TestJsonFormData**](FakeApi.md#testjsonformdata) | **GET** /fake/jsonFormData | test json serialization of form data
*FakeApi* | [**TestQueryParameterCollectionFormat**](FakeApi.md#testqueryparametercollectionformat) | **PUT** /fake/test-query-parameters | 
*FakeClassnameTags123Api* | [**TestClassname**](FakeClassnameTags123Api.md#testclassname) | **PATCH** /fake_classname_test | To test class name in snake case
*PetApi* | [**AddPet**](PetApi.md#addpet) | **POST** /pet | Add a new pet to the store
*PetApi* | [**DeletePet**](PetApi.md#deletepet) | **DELETE** /pet/{petId} | Deletes a pet
*PetApi* | [**FindPetsByStatus**](PetApi.md#findpetsbystatus) | **GET** /pet/findByStatus | Finds Pets by status
*PetApi* | [**FindPetsByTags**](PetApi.md#findpetsbytags) | **GET** /pet/findByTags | Finds Pets by tags
*PetApi* | [**GetPetById**](PetApi.md#getpetbyid) | **GET** /pet/{petId} | Find pet by ID
*PetApi* | [**UpdatePet**](PetApi.md#updatepet) | **PUT** /pet | Update an existing pet
*PetApi* | [**UpdatePetWithForm**](PetApi.md#updatepetwithform) | **POST** /pet/{petId} | Updates a pet in the store with form data
*PetApi* | [**UploadFile**](PetApi.md#uploadfile) | **POST** /pet/{petId}/uploadImage | uploads an image
*PetApi* | [**UploadFileWithRequiredFile**](PetApi.md#uploadfilewithrequiredfile) | **POST** /fake/{petId}/uploadImageWithRequiredFile | uploads an image (required)
*StoreApi* | [**DeleteOrder**](StoreApi.md#deleteorder) | **DELETE** /store/order/{order_id} | Delete purchase order by ID
*StoreApi* | [**GetInventory**](StoreApi.md#getinventory) | **GET** /store/inventory | Returns pet inventories by status
*StoreApi* | [**GetOrderById**](StoreApi.md#getorderbyid) | **GET** /store/order/{order_id} | Find purchase order by ID
*StoreApi* | [**PlaceOrder**](StoreApi.md#placeorder) | **POST** /store/order | Place an order for a pet
*UserApi* | [**CreateUser**](UserApi.md#createuser) | **POST** /user | Create user
*UserApi* | [**CreateUsersWithArrayInput**](UserApi.md#createuserswitharrayinput) | **POST** /user/createWithArray | Creates list of users with given input array
*UserApi* | [**CreateUsersWithListInput**](UserApi.md#createuserswithlistinput) | **POST** /user/createWithList | Creates list of users with given input array
*UserApi* | [**DeleteUser**](UserApi.md#deleteuser) | **DELETE** /user/{username} | Delete user
*UserApi* | [**GetUserByName**](UserApi.md#getuserbyname) | **GET** /user/{username} | Get user by user name
*UserApi* | [**LoginUser**](UserApi.md#loginuser) | **GET** /user/login | Logs user into the system
*UserApi* | [**LogoutUser**](UserApi.md#logoutuser) | **GET** /user/logout | Logs out current logged in user session
*UserApi* | [**UpdateUser**](UserApi.md#updateuser) | **PUT** /user/{username} | Updated user


<a id="documentation-for-models"></a>
## Documentation for Models

 - [Model.Activity](Activity.md)
 - [Model.ActivityOutputElementRepresentation](ActivityOutputElementRepresentation.md)
 - [Model.AdditionalPropertiesClass](AdditionalPropertiesClass.md)
 - [Model.Animal](Animal.md)
 - [Model.ApiResponse](ApiResponse.md)
 - [Model.Apple](Apple.md)
 - [Model.AppleReq](AppleReq.md)
 - [Model.ArrayOfArrayOfNumberOnly](ArrayOfArrayOfNumberOnly.md)
 - [Model.ArrayOfNumberOnly](ArrayOfNumberOnly.md)
 - [Model.ArrayTest](ArrayTest.md)
 - [Model.Banana](Banana.md)
 - [Model.BananaReq](BananaReq.md)
 - [Model.BasquePig](BasquePig.md)
 - [Model.Capitalization](Capitalization.md)
 - [Model.Cat](Cat.md)
 - [Model.Category](Category.md)
 - [Model.ChildCat](ChildCat.md)
 - [Model.ClassModel](ClassModel.md)
 - [Model.ComplexQuadrilateral](ComplexQuadrilateral.md)
 - [Model.DanishPig](DanishPig.md)
 - [Model.DateOnlyClass](DateOnlyClass.md)
 - [Model.DeprecatedObject](DeprecatedObject.md)
 - [Model.Dog](Dog.md)
 - [Model.Drawing](Drawing.md)
 - [Model.EnumArrays](EnumArrays.md)
 - [Model.EnumClass](EnumClass.md)
 - [Model.EnumTest](EnumTest.md)
 - [Model.EquilateralTriangle](EquilateralTriangle.md)
 - [Model.File](File.md)
 - [Model.FileSchemaTestClass](FileSchemaTestClass.md)
 - [Model.Foo](Foo.md)
 - [Model.FooGetDefaultResponse](FooGetDefaultResponse.md)
 - [Model.FormatTest](FormatTest.md)
 - [Model.Fruit](Fruit.md)
 - [Model.FruitReq](FruitReq.md)
 - [Model.GmFruit](GmFruit.md)
 - [Model.GrandparentAnimal](GrandparentAnimal.md)
 - [Model.HasOnlyReadOnly](HasOnlyReadOnly.md)
 - [Model.HealthCheckResult](HealthCheckResult.md)
 - [Model.IsoscelesTriangle](IsoscelesTriangle.md)
 - [Model.List](List.md)
 - [Model.LiteralStringClass](LiteralStringClass.md)
 - [Model.Mammal](Mammal.md)
 - [Model.MapTest](MapTest.md)
 - [Model.MixedPropertiesAndAdditionalPropertiesClass](MixedPropertiesAndAdditionalPropertiesClass.md)
 - [Model.Model200Response](Model200Response.md)
 - [Model.ModelClient](ModelClient.md)
 - [Model.Name](Name.md)
 - [Model.NotificationtestGetElementsV1ResponseMPayload](NotificationtestGetElementsV1ResponseMPayload.md)
 - [Model.NullableClass](NullableClass.md)
 - [Model.NullableGuidClass](NullableGuidClass.md)
 - [Model.NullableShape](NullableShape.md)
 - [Model.NumberOnly](NumberOnly.md)
 - [Model.ObjectWithDeprecatedFields](ObjectWithDeprecatedFields.md)
 - [Model.OneOfString](OneOfString.md)
 - [Model.Order](Order.md)
 - [Model.OuterComposite](OuterComposite.md)
 - [Model.OuterEnum](OuterEnum.md)
 - [Model.OuterEnumDefaultValue](OuterEnumDefaultValue.md)
 - [Model.OuterEnumInteger](OuterEnumInteger.md)
 - [Model.OuterEnumIntegerDefaultValue](OuterEnumIntegerDefaultValue.md)
 - [Model.ParentPet](ParentPet.md)
 - [Model.Pet](Pet.md)
 - [Model.Pig](Pig.md)
 - [Model.PolymorphicProperty](PolymorphicProperty.md)
 - [Model.Quadrilateral](Quadrilateral.md)
 - [Model.QuadrilateralInterface](QuadrilateralInterface.md)
 - [Model.ReadOnlyFirst](ReadOnlyFirst.md)
 - [Model.Return](Return.md)
 - [Model.RolesReportsHash](RolesReportsHash.md)
 - [Model.RolesReportsHashRole](RolesReportsHashRole.md)
 - [Model.ScaleneTriangle](ScaleneTriangle.md)
 - [Model.Shape](Shape.md)
 - [Model.ShapeInterface](ShapeInterface.md)
 - [Model.ShapeOrNull](ShapeOrNull.md)
 - [Model.SimpleQuadrilateral](SimpleQuadrilateral.md)
 - [Model.SpecialModelName](SpecialModelName.md)
 - [Model.Tag](Tag.md)
 - [Model.TestCollectionEndingWithWordList](TestCollectionEndingWithWordList.md)
 - [Model.TestCollectionEndingWithWordListObject](TestCollectionEndingWithWordListObject.md)
 - [Model.Triangle](Triangle.md)
 - [Model.TriangleInterface](TriangleInterface.md)
 - [Model.User](User.md)
 - [Model.Whale](Whale.md)
 - [Model.Zebra](Zebra.md)
 - [Model.ZeroBasedEnum](ZeroBasedEnum.md)
 - [Model.ZeroBasedEnumClass](ZeroBasedEnumClass.md)


<a id="documentation-for-authorization"></a>
## Documentation for Authorization


Authentication schemes defined for the API:
<a id="petstore_auth"></a>
### petstore_auth

- **Type**: OAuth
- **Flow**: implicit
- **Authorization URL**: http://petstore.swagger.io/api/oauth/dialog
- **Scopes**: 
  - write:pets: modify pets in your account
  - read:pets: read your pets

<a id="api_key"></a>
### api_key

- **Type**: API key
- **API key parameter name**: api_key
- **Location**: HTTP header

<a id="api_key_query"></a>
### api_key_query

- **Type**: API key
- **API key parameter name**: api_key_query
- **Location**: URL query string

<a id="http_basic_test"></a>
### http_basic_test

- **Type**: HTTP basic authentication

<a id="bearer_test"></a>
### bearer_test

- **Type**: Bearer Authentication

<a id="http_signature_test"></a>
### http_signature_test

- **Type**: HTTP signature authentication
