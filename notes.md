Classes:
    - Toy Box
    - Toy

Toy Box:
    Attributes: 
        - Name: string
        - Photo: string

    Association: 
        - has_many toys

Toy:
    Attributes:
        - Name: string
        - Photo: string
        - Price: string
        - Brand: string
        - url: string
        - rating: integer 
        - needs repair? boolean
        - squeaker? boolean
        - crinkle? boolean
        - hides treats? boolean

    Association:
        - belongs_to toy box
