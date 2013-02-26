enum RedBlack <R B>;

sub MAIN { 
    my $tree = Any; 

    for (1..10).pick(*) -> $node { 
        $tree = add_to_tree($node, $tree); 
        printf "%2d: %s\n", $node, $tree.perl; 
    } 
} 

multi add_to_tree( $node, $tree ) { 
    [B, insert( $node, $tree )[1..3]]; 
} 

multi insert( $node, Any:U ) { [R, Any, $node, Any] } 

multi insert( $node, @tree [RedBlack $color, $left, $pivot, $right] ) { 
    when $node before $pivot { balance $color, insert($node, $left), $pivot, $right             } 
    when $node after  $pivot { balance $color, $left,             $pivot, insert($node, $right) } 
    default                  { @tree } 
} 

multi balance(RedBlack $color, $a, $x, $b) { [$color, $a, $x, $b] } 

multi balance(B, [R, [R,$a,$x,$b], $y, $c ], $pivot, $right ) {
    [ R, [B,$a,$x,$b],        $y, [B,$c,$pivot,$right]] 
} 
multi balance(B, [R, $a, $x, [R,$b,$y,$c] ], $pivot, $right ) { 
    [ R, [B,$a,$x,$b],        $y, [B,$c,$pivot,$right]] 
} 
multi balance(B, $left, $pivot, [R, [R,$b,$y,$c], $z, $d]  ) { 
    [ R, [B,$left,$pivot,$b], $y, [B,$c,$z,$d]] 
} 
multi balance(B, $left, $pivot, [R, $b, $y, [R,$c,$z,$d] ]) { 
    [ R, [B,$left,$pivot,$b], $y, [B,$c,$z,$d]] 
}
