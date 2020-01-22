# cost-explorer
Sample application

A simple web service with one endpoint that returns the cost data for all clients and their projects.

[This application is deployed on Heroku](https://mighty-anchorage-14676.herokuapp.com/)

Information about the endpoints:

```
/clients
{
  "clients": [
    {
      "id": "bed2db21-0427-413f-8800-59929b3a6ef5",
      "name": "Avengers",
      "amount": 859672
    },
    {
      "id": "d7a2b34c-cfe2-4a7d-b3bf-4cda509f58ca",
      "name": "Defenders",
      "amount": 1552556
    },
    {
      "id": "84c17602-55f5-45df-89d3-d9e3531803c7",
      "name": "Guardians of the Galaxy",
      "amount": 612048
    }
  ]
}
```

```
/projects
{
  "projects": [
    {
      "id": "9dedb1dd-04ae-4272-a775-12290e666520",
      "name": "Project 1",
      "amount": 314261
    },
    {
      "id": "15e1a009-35bf-41af-a209-34bf272448b4",
      "name": "Project 2",
      "amount": 545411
    },
    {
      "id": "78a0a633-9bfe-4834-8039-329ae2b7bd2d",
      "name": "Project 3",
      "amount": 748891
    },
    {
      "id": "f3c8897b-7837-4bb5-9acc-bca65ae37ef0",
      "name": "Project 4",
      "amount": 803665
    },
    {
      "id": "9d011908-a92e-4ef8-8bd7-f94471647ded",
      "name": "Project 5",
      "amount": 216325
    },
    {
      "id": "549eecad-ee45-4d91-ad95-1d3ffc83dc7f",
      "name": "Project 6",
      "amount": 395723
    }
  ]
}
```
And the `cost-explorer` endpoint:
```
/cost-explorer

/cost-explorer?client_ids[]=bed2db21-0427-413f-8800-59929b3a6ef5&client_ids[]=d7a2b34c-cfe2-4a7d-b3bf-4cda509f58ca&project_ids[]=9dedb1dd-04ae-4272-a775-12290e666520

[
  {
    "id": "bed2db21-0427-413f-8800-59929b3a6ef5",
    "name": "Avengers",
    "amount": 859672,
    "breakdown": [
      {
        "id": "9dedb1dd-04ae-4272-a775-12290e666520",
        "name": "Project 1",
        "amount": 314261,
        "breakdown": [
          {
            "id": "76ded913-0224-47ce-8c6b-3db32536b5e6",
            "name": "Development",
            "amount": 116910,
            "breakdown": [
              {
                "id": "4094402d-62ae-4bf0-b8bd-3776e56672ea",
                "name": "Website Development",
                "amount": 160394,
                "breakdown": [
                  {
                    "id": "23f86673-96eb-45e4-abdd-81923f71272f",
                    "name": "Payment Gateway License",
                    "amount": 87887,
                    "breakdown": []
                  },
                  {
                    "id": "d16a34a4-acae-4fb4-beb2-f65b15b62488",
                    "name": "JavaScript Plugin License",
                    "amount": 199124,
                    "breakdown": []
                  }
                ]
              },
              {
                "id": "a0c7c9f2-5ef3-420a-8690-356cf199227c",
                "name": "Mobile App Development",
                "amount": 52858,
                "breakdown": [
                  {
                    "id": "d1bd3db7-4a3f-4409-81d6-fdb32941cb8d",
                    "name": "Google Play Store Fees",
                    "amount": 21235,
                    "breakdown": []
                  },
                  {
                    "id": "af0da366-c0dc-4d23-9a2a-af2b7f3fed73",
                    "name": "Apple App Store Fees",
                    "amount": 122120,
                    "breakdown": []
                  }
                ]
              },
              {
                "id": "c943ad74-e6bd-47cd-988e-84e1c4ad32d2",
                "name": "DevOps",
                "amount": 167449,
                "breakdown": [
                  {
                    "id": "f2718507-2ff7-490e-a850-bc25fff85834",
                    "name": "Servers",
                    "amount": 394731,
                    "breakdown": []
                  },
                  {
                    "id": "bd1b6ef1-9aa9-4d03-b526-a0f19682ccd7",
                    "name": "Domain Name",
                    "amount": 155442,
                    "breakdown": []
                  },
                  {
                    "id": "c0944036-ea99-4ec3-8da1-2a31df1e5138",
                    "name": "SSL Certificate",
                    "amount": 179712,
                    "breakdown": []
                  }
                ]
              }
            ]
          },
          {
            "id": "555c592f-91e5-4fe3-922f-f63d9517d990",
            "name": "Designing",
            "amount": 115482,
            "breakdown": [
              {
                "id": "5854c392-1c5e-4a7b-b444-1eed25ae3a00",
                "name": "Wireframing",
                "amount": 373521,
                "breakdown": []
              },
              {
                "id": "27ef93f7-4f60-4ca2-995e-ecd1e0e57559",
                "name": "UI Design",
                "amount": 334474,
                "breakdown": []
              },
              {
                "id": "b0d13337-986c-423b-baa1-03a9a54b99ad",
                "name": "Brochure Design",
                "amount": 155322,
                "breakdown": []
              }
            ]
          },
          {
            "id": "8cd59e4b-6caa-4fe9-9bc8-5b339754e8b9",
            "name": "Marketing",
            "amount": 81869,
            "breakdown": [
              {
                "id": "b972240e-5e69-48d6-bf90-323418489b2e",
                "name": "Social Media Marketing",
                "amount": 298330,
                "breakdown": []
              },
              {
                "id": "f0e5e7b9-22a3-40bf-8320-6e59e123a804",
                "name": "Print Media Marketing",
                "amount": 119953,
                "breakdown": []
              }
            ]
          }
        ]
      }
    ]
  },
]
```
