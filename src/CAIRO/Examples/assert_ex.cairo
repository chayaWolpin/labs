fn main(x: felt252, y: felt252){
    assert(x!=y, 'ERROR! x equals y');
}
#[test]
fn test_main(){
    main(1,2);
}