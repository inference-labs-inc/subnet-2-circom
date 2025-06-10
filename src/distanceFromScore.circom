pragma circom 2.0.0;

include "./where.circom";
include "./clampTensor.circom";

template DistanceFromScore(b){

    signal input verified;
    signal input maximum_score;
    signal input previous_score;
    signal output distanceFromScore;
    signal output isPos;

    signal temp_sub;
    signal temp_sub_2;

    component n2b_previous_score;
    component n2b_maximum_score;
    component where;
    component positive;

    n2b_previous_score = Num2Bits(b);
    n2b_previous_score.in <== previous_score;
    n2b_maximum_score = Num2Bits(b);
    n2b_maximum_score.in <== maximum_score;

    positive = LessThan(b);
    positive.in[0] <== previous_score;
    positive.in[1] <== maximum_score;
    isPos <== positive.out;

    temp_sub <== (maximum_score - previous_score)*isPos;
    temp_sub_2 <== (previous_score - maximum_score)*(1 - isPos);

    where = Where();
    where.selector <== verified;
    where.choices[0] <== temp_sub + temp_sub_2;
    where.choices[1] <== previous_score;
    distanceFromScore <== where.out;
}
