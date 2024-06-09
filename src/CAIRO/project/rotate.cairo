use array::ArrayTrait;
fn rotate_image(arr: Array<felt252>, width: felt252) -> Array<felt252> {
   let mut a = ArrayTrait::<u128>::new();
   let mut i: felt252 = 0;
   let mut j: felt252 = width - 1;
   let length_i: felt252 = arr.len() - width;
   loop{
    if i >  length_i {
        break ();
    }
      loop{
        if i > j {
            break ();
        }
        *a.at(i) = *arr.at(j);
        i + 1;
        j - 1;
      };
      i + width/2;
      j+ width/2;
   };
   a
}