Classes:
    - Toy Box
    - Toy

Toy Box:
    Attributes: 
        - Name
        - Photo

    Association: 
        - has_many toys

Toy:
    Attributes:
        - Name
        - Photo
        - Price
        - url
        - rating
        - needs repair?

    Association:
        - belongs_to toy box
