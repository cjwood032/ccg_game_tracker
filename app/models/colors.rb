class Colors
    Color = Struct.new(:name,:colors)
    include Enumerable
    def initialize()
        @colors = [
            #mono color
            Color.new("White", "W"),
            Color.new("Blue", "U"),
            Color.new("Black", "B"),
            Color.new("Red", "R"),
            Color.new("Green", "G"),
            # 2 color combinations
            Color.new("Azorious", "WU"),
            Color.new("Dimir", "UB"),
            Color.new("Rakdos", "BR"), 
            Color.new("Gruul", "RG"),
            Color.new("Selesnya", "GW"),
            Color.new("Orzhov", "WB" ),
            Color.new("Izzet", "UR"),
            Color.new("Golgari", "BG"),
            Color.new("Boros", "RW"),
            Color.new("Simic", "GU"),
            #Shards
            Color.new("Bant", "GWU"),
            Color.new("Esper", "WUB"),
            Color.new("Grixis", "UBR"),
            Color.new("Jund", "BRG"),
            Color.new("Naya", "RGW"),
            #Wedges
            Color.new("Abzan", "WBG"),
            Color.new("Jeskai", "URW"),
            Color.new("Sultai", "BGU"),
            Color.new("Mardu", "RWB"),
            Color.new("Temur", "GUR"),
            #4 colors
            Color.new("UBRG","UBRG"),
            Color.new("WBRG","WBRG"),
            Color.new("WURG","WURG"),
            Color.new("WUBG","WUBG"),
            Color.new("WUBR","WUBR"),
            #5 color and colorless
            Color.new("WUBRG", "WUBRG"),
            Color.new("Colorless", "")
        ]
    end
    def each(&block)
        @colors.each(&block)
    end
end
