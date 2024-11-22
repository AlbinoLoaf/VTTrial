public record Character{
    public required String Name {get; init;}
    public required int Initiative {get; init;}
    public Stats Stats {get; init;}
    public int AC {get; init;}
    public int Speed {get; init;}
    public int HP {get;init;}
    public int MaxHP {get;init;}
    
}