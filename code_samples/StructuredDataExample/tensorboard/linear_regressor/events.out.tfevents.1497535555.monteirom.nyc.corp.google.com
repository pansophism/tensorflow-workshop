       �K"	  ��P�Abrain.Event:2T�3 ��     R��.	�N��P�A"��


global_step/Initializer/zerosConst*
dtype0	*
_output_shapes
: *
value	B	 R *
_class
loc:@global_step
�
global_step
VariableV2*
	container *
_class
loc:@global_step*
dtype0	*
_output_shapes
: *
shape: *
shared_name 
�
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
T0	*
_output_shapes
: *
validate_shape(*
use_locking(*
_class
loc:@global_step
j
global_step/readIdentityglobal_step*
T0	*
_output_shapes
: *
_class
loc:@global_step
�
"enqueue_input/random_shuffle_queueRandomShuffleQueueV2*
	container *
seed2 * 
component_types
2		*
min_after_dequeue�*
_output_shapes
: *

seed *
shapes
: : : : : : : : : *
capacity�*
shared_name 
^
enqueue_input/PlaceholderPlaceholder*
dtype0	*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_1Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_2Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_3Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_4Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_5Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_6Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_7Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_8Placeholder*
dtype0*
_output_shapes
:*
shape:
�
.enqueue_input/random_shuffle_queue_EnqueueManyQueueEnqueueManyV2"enqueue_input/random_shuffle_queueenqueue_input/Placeholderenqueue_input/Placeholder_1enqueue_input/Placeholder_2enqueue_input/Placeholder_3enqueue_input/Placeholder_4enqueue_input/Placeholder_5enqueue_input/Placeholder_6enqueue_input/Placeholder_7enqueue_input/Placeholder_8*
Tcomponents
2		*

timeout_ms���������
{
(enqueue_input/random_shuffle_queue_CloseQueueCloseV2"enqueue_input/random_shuffle_queue*
cancel_pending_enqueues( 
}
*enqueue_input/random_shuffle_queue_Close_1QueueCloseV2"enqueue_input/random_shuffle_queue*
cancel_pending_enqueues(
r
'enqueue_input/random_shuffle_queue_SizeQueueSizeV2"enqueue_input/random_shuffle_queue*
_output_shapes
: 
V
enqueue_input/sub/yConst*
dtype0*
_output_shapes
: *
value
B :�
w
enqueue_input/subSub'enqueue_input/random_shuffle_queue_Sizeenqueue_input/sub/y*
T0*
_output_shapes
: 
Y
enqueue_input/Maximum/xConst*
dtype0*
_output_shapes
: *
value	B : 
m
enqueue_input/MaximumMaximumenqueue_input/Maximum/xenqueue_input/sub*
T0*
_output_shapes
: 
a
enqueue_input/CastCastenqueue_input/Maximum*

SrcT0*
_output_shapes
: *

DstT0
X
enqueue_input/mul/yConst*
dtype0*
_output_shapes
: *
valueB
 *>î:
b
enqueue_input/mulMulenqueue_input/Castenqueue_input/mul/y*
T0*
_output_shapes
: 
�
Xenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full/tagsConst*
dtype0*
_output_shapes
: *d
value[BY BSenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full
�
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullScalarSummaryXenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full/tagsenqueue_input/mul*
T0*
_output_shapes
: 
d
"random_shuffle_queue_DequeueMany/nConst*
dtype0*
_output_shapes
: *
value	B :@
�
 random_shuffle_queue_DequeueManyQueueDequeueManyV2"enqueue_input/random_shuffle_queue"random_shuffle_queue_DequeueMany/n*J
_output_shapes8
6:@:@:@:@:@:@:@:@:@*

timeout_ms���������* 
component_types
2		
n
#linear/linear/height/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/height/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:6#linear/linear/height/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
-linear/height/weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *.
_class$
" loc:@linear/height/weight/part_0
�
linear/height/weight/part_0
VariableV2*
	container *.
_class$
" loc:@linear/height/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
"linear/height/weight/part_0/AssignAssignlinear/height/weight/part_0-linear/height/weight/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
�
 linear/height/weight/part_0/readIdentitylinear/height/weight/part_0*
T0*
_output_shapes

:*.
_class$
" loc:@linear/height/weight/part_0
k
linear/height/weightIdentity linear/height/weight/part_0/read*
T0*
_output_shapes

:
�
linear/linear/height/matmulMatMullinear/linear/height/ExpandDimslinear/height/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
l
linear/linear/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/ReshapeReshapelinear/linear/height/matmullinear/linear/Reshape/shape*
T0*
_output_shapes

:@*
Tshape0
r
'linear/linear/horsepower/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
#linear/linear/horsepower/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:3'linear/linear/horsepower/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
1linear/horsepower/weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
linear/horsepower/weight/part_0
VariableV2*
	container *2
_class(
&$loc:@linear/horsepower/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
&linear/horsepower/weight/part_0/AssignAssignlinear/horsepower/weight/part_01linear/horsepower/weight/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
$linear/horsepower/weight/part_0/readIdentitylinear/horsepower/weight/part_0*
T0*
_output_shapes

:*2
_class(
&$loc:@linear/horsepower/weight/part_0
s
linear/horsepower/weightIdentity$linear/horsepower/weight/part_0/read*
T0*
_output_shapes

:
�
linear/linear/horsepower/matmulMatMul#linear/linear/horsepower/ExpandDimslinear/horsepower/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
n
linear/linear/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_1Reshapelinear/linear/horsepower/matmullinear/linear/Reshape_1/shape*
T0*
_output_shapes

:@*
Tshape0
n
#linear/linear/length/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/length/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:5#linear/linear/length/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
-linear/length/weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *.
_class$
" loc:@linear/length/weight/part_0
�
linear/length/weight/part_0
VariableV2*
	container *.
_class$
" loc:@linear/length/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
"linear/length/weight/part_0/AssignAssignlinear/length/weight/part_0-linear/length/weight/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
�
 linear/length/weight/part_0/readIdentitylinear/length/weight/part_0*
T0*
_output_shapes

:*.
_class$
" loc:@linear/length/weight/part_0
k
linear/length/weightIdentity linear/length/weight/part_0/read*
T0*
_output_shapes

:
�
linear/linear/length/matmulMatMullinear/linear/length/ExpandDimslinear/length/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
n
linear/linear/Reshape_2/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_2Reshapelinear/linear/length/matmullinear/linear/Reshape_2/shape*
T0*
_output_shapes

:@*
Tshape0
m
"linear/linear/width/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/width/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:7"linear/linear/width/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
,linear/width/weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *-
_class#
!loc:@linear/width/weight/part_0
�
linear/width/weight/part_0
VariableV2*
	container *-
_class#
!loc:@linear/width/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
!linear/width/weight/part_0/AssignAssignlinear/width/weight/part_0,linear/width/weight/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
linear/width/weight/part_0/readIdentitylinear/width/weight/part_0*
T0*
_output_shapes

:*-
_class#
!loc:@linear/width/weight/part_0
i
linear/width/weightIdentitylinear/width/weight/part_0/read*
T0*
_output_shapes

:
�
linear/linear/width/matmulMatMullinear/linear/width/ExpandDimslinear/width/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
n
linear/linear/Reshape_3/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_3Reshapelinear/linear/width/matmullinear/linear/Reshape_3/shape*
T0*
_output_shapes

:@*
Tshape0
h
linear/linear/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:4linear/linear/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
x
'linear/linear/DenseToSparseTensor/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
&linear/linear/DenseToSparseTensor/CastCast'linear/linear/DenseToSparseTensor/Shape*

SrcT0*
_output_shapes
:*

DstT0	
k
*linear/linear/DenseToSparseTensor/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
*linear/linear/DenseToSparseTensor/NotEqualNotEquallinear/linear/expand_dims*linear/linear/DenseToSparseTensor/Cast_1/x*
T0*
_output_shapes

:@
�
'linear/linear/DenseToSparseTensor/WhereWhere*linear/linear/DenseToSparseTensor/NotEqual*'
_output_shapes
:���������
�
/linear/linear/DenseToSparseTensor/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
)linear/linear/DenseToSparseTensor/ReshapeReshapelinear/linear/expand_dims/linear/linear/DenseToSparseTensor/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
5linear/linear/DenseToSparseTensor/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
7linear/linear/DenseToSparseTensor/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
7linear/linear/DenseToSparseTensor/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
/linear/linear/DenseToSparseTensor/strided_sliceStridedSlice'linear/linear/DenseToSparseTensor/Where5linear/linear/DenseToSparseTensor/strided_slice/stack7linear/linear/DenseToSparseTensor/strided_slice/stack_17linear/linear/DenseToSparseTensor/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
7linear/linear/DenseToSparseTensor/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
9linear/linear/DenseToSparseTensor/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
1linear/linear/DenseToSparseTensor/strided_slice_1StridedSlice'linear/linear/DenseToSparseTensor/Where7linear/linear/DenseToSparseTensor/strided_slice_1/stack9linear/linear/DenseToSparseTensor/strided_slice_1/stack_19linear/linear/DenseToSparseTensor/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
)linear/linear/DenseToSparseTensor/unstackUnpack&linear/linear/DenseToSparseTensor/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
'linear/linear/DenseToSparseTensor/stackPack+linear/linear/DenseToSparseTensor/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
%linear/linear/DenseToSparseTensor/MulMul1linear/linear/DenseToSparseTensor/strided_slice_1'linear/linear/DenseToSparseTensor/stack*
T0	*'
_output_shapes
:���������
�
7linear/linear/DenseToSparseTensor/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
%linear/linear/DenseToSparseTensor/SumSum%linear/linear/DenseToSparseTensor/Mul7linear/linear/DenseToSparseTensor/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
%linear/linear/DenseToSparseTensor/AddAdd/linear/linear/DenseToSparseTensor/strided_slice%linear/linear/DenseToSparseTensor/Sum*
T0	*#
_output_shapes
:���������
�
(linear/linear/DenseToSparseTensor/GatherGather)linear/linear/DenseToSparseTensor/Reshape%linear/linear/DenseToSparseTensor/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
�
linear/linear/lookupStringToHashBucketFast(linear/linear/DenseToSparseTensor/Gather*
num_buckets2*#
_output_shapes
:���������
�
,linear/make/weights/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:2*
valueB2*    *-
_class#
!loc:@linear/make/weights/part_0
�
linear/make/weights/part_0
VariableV2*
	container *-
_class#
!loc:@linear/make/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
!linear/make/weights/part_0/AssignAssignlinear/make/weights/part_0,linear/make/weights/part_0/Initializer/zeros*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
linear/make/weights/part_0/readIdentitylinear/make/weights/part_0*
T0*
_output_shapes

:2*-
_class#
!loc:@linear/make/weights/part_0
u
+linear/linear/make/make_weights/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 
t
*linear/linear/make/make_weights/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
%linear/linear/make/make_weights/SliceSlice&linear/linear/DenseToSparseTensor/Cast+linear/linear/make/make_weights/Slice/begin*linear/linear/make/make_weights/Slice/size*
T0	*
_output_shapes
:*
Index0
o
%linear/linear/make/make_weights/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
$linear/linear/make/make_weights/ProdProd%linear/linear/make/make_weights/Slice%linear/linear/make/make_weights/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
p
.linear/linear/make/make_weights/Gather/indicesConst*
dtype0*
_output_shapes
: *
value	B :
�
&linear/linear/make/make_weights/GatherGather&linear/linear/DenseToSparseTensor/Cast.linear/linear/make/make_weights/Gather/indices*
_output_shapes
: *
validate_indices(*
Tparams0	*
Tindices0
�
&linear/linear/make/make_weights/Cast/xPack$linear/linear/make/make_weights/Prod&linear/linear/make/make_weights/Gather*
T0	*
_output_shapes
:*
N*

axis 
�
-linear/linear/make/make_weights/SparseReshapeSparseReshape'linear/linear/DenseToSparseTensor/Where&linear/linear/DenseToSparseTensor/Cast&linear/linear/make/make_weights/Cast/x*-
_output_shapes
:���������:
�
6linear/linear/make/make_weights/SparseReshape/IdentityIdentitylinear/linear/lookup*
T0	*#
_output_shapes
:���������
p
.linear/linear/make/make_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
,linear/linear/make/make_weights/GreaterEqualGreaterEqual6linear/linear/make/make_weights/SparseReshape/Identity.linear/linear/make/make_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
%linear/linear/make/make_weights/WhereWhere,linear/linear/make/make_weights/GreaterEqual*'
_output_shapes
:���������
�
-linear/linear/make/make_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
'linear/linear/make/make_weights/ReshapeReshape%linear/linear/make/make_weights/Where-linear/linear/make/make_weights/Reshape/shape*
T0	*#
_output_shapes
:���������*
Tshape0
�
(linear/linear/make/make_weights/Gather_1Gather-linear/linear/make/make_weights/SparseReshape'linear/linear/make/make_weights/Reshape*'
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
(linear/linear/make/make_weights/Gather_2Gather6linear/linear/make/make_weights/SparseReshape/Identity'linear/linear/make/make_weights/Reshape*#
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
(linear/linear/make/make_weights/IdentityIdentity/linear/linear/make/make_weights/SparseReshape:1*
T0	*
_output_shapes
:
{
9linear/linear/make/make_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
Glinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/strided_sliceStridedSlice(linear/linear/make/make_weights/IdentityGlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stackIlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stack_1Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
8linear/linear/make/make_weights/SparseFillEmptyRows/CastCastAlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice*

SrcT0	*
_output_shapes
: *

DstT0
�
?linear/linear/make/make_weights/SparseFillEmptyRows/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
?linear/linear/make/make_weights/SparseFillEmptyRows/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
9linear/linear/make/make_weights/SparseFillEmptyRows/rangeRange?linear/linear/make/make_weights/SparseFillEmptyRows/range/start8linear/linear/make/make_weights/SparseFillEmptyRows/Cast?linear/linear/make/make_weights/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:���������
�
:linear/linear/make/make_weights/SparseFillEmptyRows/Cast_1Cast9linear/linear/make/make_weights/SparseFillEmptyRows/range*

SrcT0*#
_output_shapes
:���������*

DstT0	
�
Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
Clinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1StridedSlice(linear/linear/make/make_weights/Gather_1Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stackKlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stack_1Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
<linear/linear/make/make_weights/SparseFillEmptyRows/ListDiffListDiff:linear/linear/make/make_weights/SparseFillEmptyRows/Cast_1Clinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Clinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2StridedSlice(linear/linear/make/make_weights/IdentityIlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stackKlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stack_1Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Blinear/linear/make/make_weights/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
>linear/linear/make/make_weights/SparseFillEmptyRows/ExpandDims
ExpandDimsClinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2Blinear/linear/make/make_weights/SparseFillEmptyRows/ExpandDims/dim*
T0	*
_output_shapes
:*

Tdim0
�
Olinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
_output_shapes
: *
value	B
 Z
�
Olinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
_output_shapes
: *
value	B
 Z 
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDenseSparseToDense<linear/linear/make/make_weights/SparseFillEmptyRows/ListDiff>linear/linear/make/make_weights/SparseFillEmptyRows/ExpandDimsOlinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesOlinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/default_value*
T0
*#
_output_shapes
:���������*
validate_indices(*
Tindices0	
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
;linear/linear/make/make_weights/SparseFillEmptyRows/ReshapeReshape<linear/linear/make/make_weights/SparseFillEmptyRows/ListDiffAlinear/linear/make/make_weights/SparseFillEmptyRows/Reshape/shape*
T0	*'
_output_shapes
:���������*
Tshape0
�
>linear/linear/make/make_weights/SparseFillEmptyRows/zeros_like	ZerosLike;linear/linear/make/make_weights/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:���������
�
?linear/linear/make/make_weights/SparseFillEmptyRows/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
�
:linear/linear/make/make_weights/SparseFillEmptyRows/concatConcatV2;linear/linear/make/make_weights/SparseFillEmptyRows/Reshape>linear/linear/make/make_weights/SparseFillEmptyRows/zeros_like?linear/linear/make/make_weights/SparseFillEmptyRows/concat/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
9linear/linear/make/make_weights/SparseFillEmptyRows/ShapeShape<linear/linear/make/make_weights/SparseFillEmptyRows/ListDiff*
T0	*
out_type0*
_output_shapes
:
�
8linear/linear/make/make_weights/SparseFillEmptyRows/FillFill9linear/linear/make/make_weights/SparseFillEmptyRows/Shape9linear/linear/make/make_weights/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:���������
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
<linear/linear/make/make_weights/SparseFillEmptyRows/concat_1ConcatV2(linear/linear/make/make_weights/Gather_1:linear/linear/make/make_weights/SparseFillEmptyRows/concatAlinear/linear/make/make_weights/SparseFillEmptyRows/concat_1/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
<linear/linear/make/make_weights/SparseFillEmptyRows/concat_2ConcatV2(linear/linear/make/make_weights/Gather_28linear/linear/make/make_weights/SparseFillEmptyRows/FillAlinear/linear/make/make_weights/SparseFillEmptyRows/concat_2/axis*

Tidx0*
T0	*#
_output_shapes
:���������*
N
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/SparseReorderSparseReorder<linear/linear/make/make_weights/SparseFillEmptyRows/concat_1<linear/linear/make/make_weights/SparseFillEmptyRows/concat_2(linear/linear/make/make_weights/Identity*
T0	*6
_output_shapes$
":���������:���������
�
<linear/linear/make/make_weights/SparseFillEmptyRows/IdentityIdentity(linear/linear/make/make_weights/Identity*
T0	*
_output_shapes
:
�
Klinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
Mlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
Mlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
Elinear/linear/make/make_weights/embedding_lookup_sparse/strided_sliceStridedSliceAlinear/linear/make/make_weights/SparseFillEmptyRows/SparseReorderKlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stackMlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stack_1Mlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
<linear/linear/make/make_weights/embedding_lookup_sparse/CastCastElinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:���������*

DstT0
�
>linear/linear/make/make_weights/embedding_lookup_sparse/UniqueUniqueClinear/linear/make/make_weights/SparseFillEmptyRows/SparseReorder:1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
Hlinear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookupGatherlinear/make/weights/part_0/read>linear/linear/make/make_weights/embedding_lookup_sparse/Unique*'
_output_shapes
:���������*
validate_indices(*
Tparams0*-
_class#
!loc:@linear/make/weights/part_0*
Tindices0	
�
7linear/linear/make/make_weights/embedding_lookup_sparseSparseSegmentSumHlinear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup@linear/linear/make/make_weights/embedding_lookup_sparse/Unique:1<linear/linear/make/make_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:���������
�
/linear/linear/make/make_weights/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
)linear/linear/make/make_weights/Reshape_1ReshapeAlinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/linear/linear/make/make_weights/Reshape_1/shape*
T0
*'
_output_shapes
:���������*
Tshape0
�
%linear/linear/make/make_weights/ShapeShape7linear/linear/make/make_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
}
3linear/linear/make/make_weights/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:

5linear/linear/make/make_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:

5linear/linear/make/make_weights/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
-linear/linear/make/make_weights/strided_sliceStridedSlice%linear/linear/make/make_weights/Shape3linear/linear/make/make_weights/strided_slice/stack5linear/linear/make/make_weights/strided_slice/stack_15linear/linear/make/make_weights/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
i
'linear/linear/make/make_weights/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
�
%linear/linear/make/make_weights/stackPack'linear/linear/make/make_weights/stack/0-linear/linear/make/make_weights/strided_slice*
T0*
_output_shapes
:*
N*

axis 
�
$linear/linear/make/make_weights/TileTile)linear/linear/make/make_weights/Reshape_1%linear/linear/make/make_weights/stack*
T0
*0
_output_shapes
:������������������*

Tmultiples0
�
*linear/linear/make/make_weights/zeros_like	ZerosLike7linear/linear/make/make_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
linear/linear/make/make_weightsSelect$linear/linear/make/make_weights/Tile*linear/linear/make/make_weights/zeros_like7linear/linear/make/make_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
&linear/linear/make/make_weights/Cast_1Cast&linear/linear/DenseToSparseTensor/Cast*

SrcT0	*
_output_shapes
:*

DstT0
w
-linear/linear/make/make_weights/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 
v
,linear/linear/make/make_weights/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
'linear/linear/make/make_weights/Slice_1Slice&linear/linear/make/make_weights/Cast_1-linear/linear/make/make_weights/Slice_1/begin,linear/linear/make/make_weights/Slice_1/size*
T0*
_output_shapes
:*
Index0
�
'linear/linear/make/make_weights/Shape_1Shapelinear/linear/make/make_weights*
T0*
out_type0*
_output_shapes
:
w
-linear/linear/make/make_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:

,linear/linear/make/make_weights/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
'linear/linear/make/make_weights/Slice_2Slice'linear/linear/make/make_weights/Shape_1-linear/linear/make/make_weights/Slice_2/begin,linear/linear/make/make_weights/Slice_2/size*
T0*
_output_shapes
:*
Index0
m
+linear/linear/make/make_weights/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
&linear/linear/make/make_weights/concatConcatV2'linear/linear/make/make_weights/Slice_1'linear/linear/make/make_weights/Slice_2+linear/linear/make/make_weights/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
)linear/linear/make/make_weights/Reshape_2Reshapelinear/linear/make/make_weights&linear/linear/make/make_weights/concat*
T0*'
_output_shapes
:���������*
Tshape0
n
linear/linear/Reshape_4/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_4Reshape)linear/linear/make/make_weights/Reshape_2linear/linear/Reshape_4/shape*
T0*'
_output_shapes
:���������*
Tshape0
j
linear/linear/expand_dims_1/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/expand_dims_1
ExpandDims"random_shuffle_queue_DequeueMany:2linear/linear/expand_dims_1/dim*
T0*
_output_shapes

:@*

Tdim0
z
)linear/linear/DenseToSparseTensor_1/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
(linear/linear/DenseToSparseTensor_1/CastCast)linear/linear/DenseToSparseTensor_1/Shape*

SrcT0*
_output_shapes
:*

DstT0	
m
,linear/linear/DenseToSparseTensor_1/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
,linear/linear/DenseToSparseTensor_1/NotEqualNotEquallinear/linear/expand_dims_1,linear/linear/DenseToSparseTensor_1/Cast_1/x*
T0*
_output_shapes

:@
�
)linear/linear/DenseToSparseTensor_1/WhereWhere,linear/linear/DenseToSparseTensor_1/NotEqual*'
_output_shapes
:���������
�
1linear/linear/DenseToSparseTensor_1/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
+linear/linear/DenseToSparseTensor_1/ReshapeReshapelinear/linear/expand_dims_11linear/linear/DenseToSparseTensor_1/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
7linear/linear/DenseToSparseTensor_1/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor_1/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor_1/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
1linear/linear/DenseToSparseTensor_1/strided_sliceStridedSlice)linear/linear/DenseToSparseTensor_1/Where7linear/linear/DenseToSparseTensor_1/strided_slice/stack9linear/linear/DenseToSparseTensor_1/strided_slice/stack_19linear/linear/DenseToSparseTensor_1/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
9linear/linear/DenseToSparseTensor_1/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
;linear/linear/DenseToSparseTensor_1/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
;linear/linear/DenseToSparseTensor_1/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
3linear/linear/DenseToSparseTensor_1/strided_slice_1StridedSlice)linear/linear/DenseToSparseTensor_1/Where9linear/linear/DenseToSparseTensor_1/strided_slice_1/stack;linear/linear/DenseToSparseTensor_1/strided_slice_1/stack_1;linear/linear/DenseToSparseTensor_1/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
+linear/linear/DenseToSparseTensor_1/unstackUnpack(linear/linear/DenseToSparseTensor_1/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
)linear/linear/DenseToSparseTensor_1/stackPack-linear/linear/DenseToSparseTensor_1/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
'linear/linear/DenseToSparseTensor_1/MulMul3linear/linear/DenseToSparseTensor_1/strided_slice_1)linear/linear/DenseToSparseTensor_1/stack*
T0	*'
_output_shapes
:���������
�
9linear/linear/DenseToSparseTensor_1/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
'linear/linear/DenseToSparseTensor_1/SumSum'linear/linear/DenseToSparseTensor_1/Mul9linear/linear/DenseToSparseTensor_1/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
'linear/linear/DenseToSparseTensor_1/AddAdd1linear/linear/DenseToSparseTensor_1/strided_slice'linear/linear/DenseToSparseTensor_1/Sum*
T0	*#
_output_shapes
:���������
�
*linear/linear/DenseToSparseTensor_1/GatherGather+linear/linear/DenseToSparseTensor_1/Reshape'linear/linear/DenseToSparseTensor_1/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
�
linear/linear/lookup_1/ConstConst*
dtype0*
_output_shapes
:*?
value6B4BeightBfiveBfourBsixBthreeBtwelveBtwo
]
linear/linear/lookup_1/SizeConst*
dtype0*
_output_shapes
: *
value	B :
d
"linear/linear/lookup_1/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
d
"linear/linear/lookup_1/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
linear/linear/lookup_1/rangeRange"linear/linear/lookup_1/range/startlinear/linear/lookup_1/Size"linear/linear/lookup_1/range/delta*

Tidx0*
_output_shapes
:
x
linear/linear/lookup_1/ToInt64Castlinear/linear/lookup_1/range*

SrcT0*
_output_shapes
:*

DstT0	
�
!linear/linear/lookup_1/hash_table	HashTable*
	container *
	key_dtype0*
use_node_name_sharing( *
_output_shapes
:*
value_dtype0	*
shared_name 
r
'linear/linear/lookup_1/hash_table/ConstConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
,linear/linear/lookup_1/hash_table/table_initInitializeTable!linear/linear/lookup_1/hash_tablelinear/linear/lookup_1/Constlinear/linear/lookup_1/ToInt64*

Tval0	*

Tkey0*4
_class*
(&loc:@linear/linear/lookup_1/hash_table
�
linear/linear/hash_table_LookupLookupTableFind!linear/linear/lookup_1/hash_table*linear/linear/DenseToSparseTensor_1/Gather'linear/linear/lookup_1/hash_table/Const*#
_output_shapes
:���������*

Tout0	*	
Tin0*4
_class*
(&loc:@linear/linear/lookup_1/hash_table
�
8linear/num-of-cylinders/weights/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
&linear/num-of-cylinders/weights/part_0
VariableV2*
	container *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
-linear/num-of-cylinders/weights/part_0/AssignAssign&linear/num-of-cylinders/weights/part_08linear/num-of-cylinders/weights/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
+linear/num-of-cylinders/weights/part_0/readIdentity&linear/num-of-cylinders/weights/part_0*
T0*
_output_shapes

:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Clinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 
�
Blinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/SliceSlice(linear/linear/DenseToSparseTensor_1/CastClinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice/beginBlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice/size*
T0	*
_output_shapes
:*
Index0
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
<linear/linear/num-of-cylinders/num-of-cylinders_weights/ProdProd=linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice=linear/linear/num-of-cylinders/num-of-cylinders_weights/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
�
Flinear/linear/num-of-cylinders/num-of-cylinders_weights/Gather/indicesConst*
dtype0*
_output_shapes
: *
value	B :
�
>linear/linear/num-of-cylinders/num-of-cylinders_weights/GatherGather(linear/linear/DenseToSparseTensor_1/CastFlinear/linear/num-of-cylinders/num-of-cylinders_weights/Gather/indices*
_output_shapes
: *
validate_indices(*
Tparams0	*
Tindices0
�
>linear/linear/num-of-cylinders/num-of-cylinders_weights/Cast/xPack<linear/linear/num-of-cylinders/num-of-cylinders_weights/Prod>linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather*
T0	*
_output_shapes
:*
N*

axis 
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshapeSparseReshape)linear/linear/DenseToSparseTensor_1/Where(linear/linear/DenseToSparseTensor_1/Cast>linear/linear/num-of-cylinders/num-of-cylinders_weights/Cast/x*-
_output_shapes
:���������:
�
Nlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape/IdentityIdentitylinear/linear/hash_table_Lookup*
T0	*#
_output_shapes
:���������
�
Flinear/linear/num-of-cylinders/num-of-cylinders_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
Dlinear/linear/num-of-cylinders/num-of-cylinders_weights/GreaterEqualGreaterEqualNlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape/IdentityFlinear/linear/num-of-cylinders/num-of-cylinders_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/WhereWhereDlinear/linear/num-of-cylinders/num-of-cylinders_weights/GreaterEqual*'
_output_shapes
:���������
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/ReshapeReshape=linear/linear/num-of-cylinders/num-of-cylinders_weights/WhereElinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape/shape*
T0	*#
_output_shapes
:���������*
Tshape0
�
@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_1GatherElinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape?linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape*'
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_2GatherNlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape/Identity?linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape*#
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
@linear/linear/num-of-cylinders/num-of-cylinders_weights/IdentityIdentityGlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape:1*
T0	*
_output_shapes
:
�
Qlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
_linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_sliceStridedSlice@linear/linear/num-of-cylinders/num-of-cylinders_weights/Identity_linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stackalinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stack_1alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Plinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/CastCastYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice*

SrcT0	*
_output_shapes
: *

DstT0
�
Wlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
Wlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
Qlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/rangeRangeWlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range/startPlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/CastWlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:���������
�
Rlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Cast_1CastQlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range*

SrcT0*#
_output_shapes
:���������*

DstT0	
�
alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1StridedSlice@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_1alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stackclinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stack_1clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ListDiffListDiffRlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Cast_1[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2StridedSlice@linear/linear/num-of-cylinders/num-of-cylinders_weights/Identityalinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stackclinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stack_1clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Zlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Vlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ExpandDims
ExpandDims[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2Zlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ExpandDims/dim*
T0	*
_output_shapes
:*

Tdim0
�
glinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
_output_shapes
: *
value	B
 Z
�
glinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
_output_shapes
: *
value	B
 Z 
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDenseSparseToDenseTlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ListDiffVlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ExpandDimsglinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesglinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDense/default_value*
T0
*#
_output_shapes
:���������*
validate_indices(*
Tindices0	
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
Slinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ReshapeReshapeTlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ListDiffYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Reshape/shape*
T0	*'
_output_shapes
:���������*
Tshape0
�
Vlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/zeros_like	ZerosLikeSlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:���������
�
Wlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
�
Rlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concatConcatV2Slinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ReshapeVlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/zeros_likeWlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Qlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ShapeShapeTlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ListDiff*
T0	*
out_type0*
_output_shapes
:
�
Plinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/FillFillQlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ShapeQlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:���������
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_1ConcatV2@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_1Rlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concatYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_1/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_2ConcatV2@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_2Plinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/FillYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_2/axis*

Tidx0*
T0	*#
_output_shapes
:���������*
N
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseReorderSparseReorderTlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_1Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_2@linear/linear/num-of-cylinders/num-of-cylinders_weights/Identity*
T0	*6
_output_shapes$
":���������:���������
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/IdentityIdentity@linear/linear/num-of-cylinders/num-of-cylinders_weights/Identity*
T0	*
_output_shapes
:
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
elinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
elinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
]linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_sliceStridedSliceYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseReorderclinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stackelinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stack_1elinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/CastCast]linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:���������*

DstT0
�
Vlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/UniqueUnique[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseReorder:1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
`linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookupGather+linear/num-of-cylinders/weights/part_0/readVlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique*'
_output_shapes
:���������*
validate_indices(*
Tparams0*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
Tindices0	
�
Olinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparseSparseSegmentSum`linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookupXlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique:1Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:���������
�
Glinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
Alinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_1ReshapeYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDenseGlinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_1/shape*
T0
*'
_output_shapes
:���������*
Tshape0
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/ShapeShapeOlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
�
Klinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
Mlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Mlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_sliceStridedSlice=linear/linear/num-of-cylinders/num-of-cylinders_weights/ShapeKlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stackMlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stack_1Mlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/stackPack?linear/linear/num-of-cylinders/num-of-cylinders_weights/stack/0Elinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice*
T0*
_output_shapes
:*
N*

axis 
�
<linear/linear/num-of-cylinders/num-of-cylinders_weights/TileTileAlinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_1=linear/linear/num-of-cylinders/num-of-cylinders_weights/stack*
T0
*0
_output_shapes
:������������������*

Tmultiples0
�
Blinear/linear/num-of-cylinders/num-of-cylinders_weights/zeros_like	ZerosLikeOlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
7linear/linear/num-of-cylinders/num-of-cylinders_weightsSelect<linear/linear/num-of-cylinders/num-of-cylinders_weights/TileBlinear/linear/num-of-cylinders/num-of-cylinders_weights/zeros_likeOlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
>linear/linear/num-of-cylinders/num-of-cylinders_weights/Cast_1Cast(linear/linear/DenseToSparseTensor_1/Cast*

SrcT0	*
_output_shapes
:*

DstT0
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 
�
Dlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1Slice>linear/linear/num-of-cylinders/num-of-cylinders_weights/Cast_1Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1/beginDlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1/size*
T0*
_output_shapes
:*
Index0
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/Shape_1Shape7linear/linear/num-of-cylinders/num-of-cylinders_weights*
T0*
out_type0*
_output_shapes
:
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
�
Dlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2Slice?linear/linear/num-of-cylinders/num-of-cylinders_weights/Shape_1Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2/beginDlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2/size*
T0*
_output_shapes
:*
Index0
�
Clinear/linear/num-of-cylinders/num-of-cylinders_weights/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
>linear/linear/num-of-cylinders/num-of-cylinders_weights/concatConcatV2?linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1?linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2Clinear/linear/num-of-cylinders/num-of-cylinders_weights/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
Alinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2Reshape7linear/linear/num-of-cylinders/num-of-cylinders_weights>linear/linear/num-of-cylinders/num-of-cylinders_weights/concat*
T0*'
_output_shapes
:���������*
Tshape0
n
linear/linear/Reshape_5/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_5ReshapeAlinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2linear/linear/Reshape_5/shape*
T0*'
_output_shapes
:���������*
Tshape0
j
linear/linear/expand_dims_2/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/expand_dims_2
ExpandDims"random_shuffle_queue_DequeueMany:1linear/linear/expand_dims_2/dim*
T0*
_output_shapes

:@*

Tdim0
z
)linear/linear/DenseToSparseTensor_2/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
(linear/linear/DenseToSparseTensor_2/CastCast)linear/linear/DenseToSparseTensor_2/Shape*

SrcT0*
_output_shapes
:*

DstT0	
m
,linear/linear/DenseToSparseTensor_2/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
,linear/linear/DenseToSparseTensor_2/NotEqualNotEquallinear/linear/expand_dims_2,linear/linear/DenseToSparseTensor_2/Cast_1/x*
T0*
_output_shapes

:@
�
)linear/linear/DenseToSparseTensor_2/WhereWhere,linear/linear/DenseToSparseTensor_2/NotEqual*'
_output_shapes
:���������
�
1linear/linear/DenseToSparseTensor_2/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
+linear/linear/DenseToSparseTensor_2/ReshapeReshapelinear/linear/expand_dims_21linear/linear/DenseToSparseTensor_2/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
7linear/linear/DenseToSparseTensor_2/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor_2/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor_2/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
1linear/linear/DenseToSparseTensor_2/strided_sliceStridedSlice)linear/linear/DenseToSparseTensor_2/Where7linear/linear/DenseToSparseTensor_2/strided_slice/stack9linear/linear/DenseToSparseTensor_2/strided_slice/stack_19linear/linear/DenseToSparseTensor_2/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
9linear/linear/DenseToSparseTensor_2/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
;linear/linear/DenseToSparseTensor_2/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
;linear/linear/DenseToSparseTensor_2/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
3linear/linear/DenseToSparseTensor_2/strided_slice_1StridedSlice)linear/linear/DenseToSparseTensor_2/Where9linear/linear/DenseToSparseTensor_2/strided_slice_1/stack;linear/linear/DenseToSparseTensor_2/strided_slice_1/stack_1;linear/linear/DenseToSparseTensor_2/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
+linear/linear/DenseToSparseTensor_2/unstackUnpack(linear/linear/DenseToSparseTensor_2/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
)linear/linear/DenseToSparseTensor_2/stackPack-linear/linear/DenseToSparseTensor_2/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
'linear/linear/DenseToSparseTensor_2/MulMul3linear/linear/DenseToSparseTensor_2/strided_slice_1)linear/linear/DenseToSparseTensor_2/stack*
T0	*'
_output_shapes
:���������
�
9linear/linear/DenseToSparseTensor_2/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
'linear/linear/DenseToSparseTensor_2/SumSum'linear/linear/DenseToSparseTensor_2/Mul9linear/linear/DenseToSparseTensor_2/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
'linear/linear/DenseToSparseTensor_2/AddAdd1linear/linear/DenseToSparseTensor_2/strided_slice'linear/linear/DenseToSparseTensor_2/Sum*
T0	*#
_output_shapes
:���������
�
*linear/linear/DenseToSparseTensor_2/GatherGather+linear/linear/DenseToSparseTensor_2/Reshape'linear/linear/DenseToSparseTensor_2/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
n
linear/linear/lookup_2/ConstConst*
dtype0*
_output_shapes
:*
valueBBtwoBfour
]
linear/linear/lookup_2/SizeConst*
dtype0*
_output_shapes
: *
value	B :
d
"linear/linear/lookup_2/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
d
"linear/linear/lookup_2/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
linear/linear/lookup_2/rangeRange"linear/linear/lookup_2/range/startlinear/linear/lookup_2/Size"linear/linear/lookup_2/range/delta*

Tidx0*
_output_shapes
:
x
linear/linear/lookup_2/ToInt64Castlinear/linear/lookup_2/range*

SrcT0*
_output_shapes
:*

DstT0	
�
!linear/linear/lookup_2/hash_table	HashTable*
	container *
	key_dtype0*
use_node_name_sharing( *
_output_shapes
:*
value_dtype0	*
shared_name 
r
'linear/linear/lookup_2/hash_table/ConstConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
,linear/linear/lookup_2/hash_table/table_initInitializeTable!linear/linear/lookup_2/hash_tablelinear/linear/lookup_2/Constlinear/linear/lookup_2/ToInt64*

Tval0	*

Tkey0*4
_class*
(&loc:@linear/linear/lookup_2/hash_table
�
!linear/linear/hash_table_Lookup_1LookupTableFind!linear/linear/lookup_2/hash_table*linear/linear/DenseToSparseTensor_2/Gather'linear/linear/lookup_2/hash_table/Const*#
_output_shapes
:���������*

Tout0	*	
Tin0*4
_class*
(&loc:@linear/linear/lookup_2/hash_table
�
4linear/num-of-doors/weights/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
"linear/num-of-doors/weights/part_0
VariableV2*
	container *5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
)linear/num-of-doors/weights/part_0/AssignAssign"linear/num-of-doors/weights/part_04linear/num-of-doors/weights/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
'linear/num-of-doors/weights/part_0/readIdentity"linear/num-of-doors/weights/part_0*
T0*
_output_shapes

:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
;linear/linear/num-of-doors/num-of-doors_weights/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 
�
:linear/linear/num-of-doors/num-of-doors_weights/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
5linear/linear/num-of-doors/num-of-doors_weights/SliceSlice(linear/linear/DenseToSparseTensor_2/Cast;linear/linear/num-of-doors/num-of-doors_weights/Slice/begin:linear/linear/num-of-doors/num-of-doors_weights/Slice/size*
T0	*
_output_shapes
:*
Index0

5linear/linear/num-of-doors/num-of-doors_weights/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
4linear/linear/num-of-doors/num-of-doors_weights/ProdProd5linear/linear/num-of-doors/num-of-doors_weights/Slice5linear/linear/num-of-doors/num-of-doors_weights/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
�
>linear/linear/num-of-doors/num-of-doors_weights/Gather/indicesConst*
dtype0*
_output_shapes
: *
value	B :
�
6linear/linear/num-of-doors/num-of-doors_weights/GatherGather(linear/linear/DenseToSparseTensor_2/Cast>linear/linear/num-of-doors/num-of-doors_weights/Gather/indices*
_output_shapes
: *
validate_indices(*
Tparams0	*
Tindices0
�
6linear/linear/num-of-doors/num-of-doors_weights/Cast/xPack4linear/linear/num-of-doors/num-of-doors_weights/Prod6linear/linear/num-of-doors/num-of-doors_weights/Gather*
T0	*
_output_shapes
:*
N*

axis 
�
=linear/linear/num-of-doors/num-of-doors_weights/SparseReshapeSparseReshape)linear/linear/DenseToSparseTensor_2/Where(linear/linear/DenseToSparseTensor_2/Cast6linear/linear/num-of-doors/num-of-doors_weights/Cast/x*-
_output_shapes
:���������:
�
Flinear/linear/num-of-doors/num-of-doors_weights/SparseReshape/IdentityIdentity!linear/linear/hash_table_Lookup_1*
T0	*#
_output_shapes
:���������
�
>linear/linear/num-of-doors/num-of-doors_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
<linear/linear/num-of-doors/num-of-doors_weights/GreaterEqualGreaterEqualFlinear/linear/num-of-doors/num-of-doors_weights/SparseReshape/Identity>linear/linear/num-of-doors/num-of-doors_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
5linear/linear/num-of-doors/num-of-doors_weights/WhereWhere<linear/linear/num-of-doors/num-of-doors_weights/GreaterEqual*'
_output_shapes
:���������
�
=linear/linear/num-of-doors/num-of-doors_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
7linear/linear/num-of-doors/num-of-doors_weights/ReshapeReshape5linear/linear/num-of-doors/num-of-doors_weights/Where=linear/linear/num-of-doors/num-of-doors_weights/Reshape/shape*
T0	*#
_output_shapes
:���������*
Tshape0
�
8linear/linear/num-of-doors/num-of-doors_weights/Gather_1Gather=linear/linear/num-of-doors/num-of-doors_weights/SparseReshape7linear/linear/num-of-doors/num-of-doors_weights/Reshape*'
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
8linear/linear/num-of-doors/num-of-doors_weights/Gather_2GatherFlinear/linear/num-of-doors/num-of-doors_weights/SparseReshape/Identity7linear/linear/num-of-doors/num-of-doors_weights/Reshape*#
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
8linear/linear/num-of-doors/num-of-doors_weights/IdentityIdentity?linear/linear/num-of-doors/num-of-doors_weights/SparseReshape:1*
T0	*
_output_shapes
:
�
Ilinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
Wlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_sliceStridedSlice8linear/linear/num-of-doors/num-of-doors_weights/IdentityWlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stackYlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stack_1Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Hlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/CastCastQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice*

SrcT0	*
_output_shapes
: *

DstT0
�
Olinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
Olinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
Ilinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/rangeRangeOlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range/startHlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/CastOlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:���������
�
Jlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Cast_1CastIlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range*

SrcT0*#
_output_shapes
:���������*

DstT0	
�
Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
Slinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1StridedSlice8linear/linear/num-of-doors/num-of-doors_weights/Gather_1Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack_1[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ListDiffListDiffJlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Cast_1Slinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Slinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2StridedSlice8linear/linear/num-of-doors/num-of-doors_weights/IdentityYlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack_1[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Rlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Nlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ExpandDims
ExpandDimsSlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2Rlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ExpandDims/dim*
T0	*
_output_shapes
:*

Tdim0
�
_linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
_output_shapes
: *
value	B
 Z
�
_linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
_output_shapes
: *
value	B
 Z 
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDenseSparseToDenseLlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ListDiffNlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ExpandDims_linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense/sparse_values_linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense/default_value*
T0
*#
_output_shapes
:���������*
validate_indices(*
Tindices0	
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
Klinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ReshapeReshapeLlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ListDiffQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Reshape/shape*
T0	*'
_output_shapes
:���������*
Tshape0
�
Nlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/zeros_like	ZerosLikeKlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:���������
�
Olinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
�
Jlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concatConcatV2Klinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ReshapeNlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/zeros_likeOlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Ilinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ShapeShapeLlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ListDiff*
T0	*
out_type0*
_output_shapes
:
�
Hlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/FillFillIlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ShapeIlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:���������
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_1ConcatV28linear/linear/num-of-doors/num-of-doors_weights/Gather_1Jlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concatQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_1/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_2ConcatV28linear/linear/num-of-doors/num-of-doors_weights/Gather_2Hlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/FillQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_2/axis*

Tidx0*
T0	*#
_output_shapes
:���������*
N
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseReorderSparseReorderLlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_1Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_28linear/linear/num-of-doors/num-of-doors_weights/Identity*
T0	*6
_output_shapes$
":���������:���������
�
Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/IdentityIdentity8linear/linear/num-of-doors/num-of-doors_weights/Identity*
T0	*
_output_shapes
:
�
[linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
]linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
]linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
Ulinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_sliceStridedSliceQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseReorder[linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack]linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack_1]linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
Llinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/CastCastUlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:���������*

DstT0
�
Nlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/UniqueUniqueSlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseReorder:1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
Xlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookupGather'linear/num-of-doors/weights/part_0/readNlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique*'
_output_shapes
:���������*
validate_indices(*
Tparams0*5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
Tindices0	
�
Glinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparseSparseSegmentSumXlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookupPlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique:1Llinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:���������
�
?linear/linear/num-of-doors/num-of-doors_weights/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
9linear/linear/num-of-doors/num-of-doors_weights/Reshape_1ReshapeQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense?linear/linear/num-of-doors/num-of-doors_weights/Reshape_1/shape*
T0
*'
_output_shapes
:���������*
Tshape0
�
5linear/linear/num-of-doors/num-of-doors_weights/ShapeShapeGlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
�
Clinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
Elinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Elinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
=linear/linear/num-of-doors/num-of-doors_weights/strided_sliceStridedSlice5linear/linear/num-of-doors/num-of-doors_weights/ShapeClinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stackElinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stack_1Elinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
y
7linear/linear/num-of-doors/num-of-doors_weights/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
�
5linear/linear/num-of-doors/num-of-doors_weights/stackPack7linear/linear/num-of-doors/num-of-doors_weights/stack/0=linear/linear/num-of-doors/num-of-doors_weights/strided_slice*
T0*
_output_shapes
:*
N*

axis 
�
4linear/linear/num-of-doors/num-of-doors_weights/TileTile9linear/linear/num-of-doors/num-of-doors_weights/Reshape_15linear/linear/num-of-doors/num-of-doors_weights/stack*
T0
*0
_output_shapes
:������������������*

Tmultiples0
�
:linear/linear/num-of-doors/num-of-doors_weights/zeros_like	ZerosLikeGlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
/linear/linear/num-of-doors/num-of-doors_weightsSelect4linear/linear/num-of-doors/num-of-doors_weights/Tile:linear/linear/num-of-doors/num-of-doors_weights/zeros_likeGlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
6linear/linear/num-of-doors/num-of-doors_weights/Cast_1Cast(linear/linear/DenseToSparseTensor_2/Cast*

SrcT0	*
_output_shapes
:*

DstT0
�
=linear/linear/num-of-doors/num-of-doors_weights/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 
�
<linear/linear/num-of-doors/num-of-doors_weights/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
7linear/linear/num-of-doors/num-of-doors_weights/Slice_1Slice6linear/linear/num-of-doors/num-of-doors_weights/Cast_1=linear/linear/num-of-doors/num-of-doors_weights/Slice_1/begin<linear/linear/num-of-doors/num-of-doors_weights/Slice_1/size*
T0*
_output_shapes
:*
Index0
�
7linear/linear/num-of-doors/num-of-doors_weights/Shape_1Shape/linear/linear/num-of-doors/num-of-doors_weights*
T0*
out_type0*
_output_shapes
:
�
=linear/linear/num-of-doors/num-of-doors_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
�
<linear/linear/num-of-doors/num-of-doors_weights/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
7linear/linear/num-of-doors/num-of-doors_weights/Slice_2Slice7linear/linear/num-of-doors/num-of-doors_weights/Shape_1=linear/linear/num-of-doors/num-of-doors_weights/Slice_2/begin<linear/linear/num-of-doors/num-of-doors_weights/Slice_2/size*
T0*
_output_shapes
:*
Index0
}
;linear/linear/num-of-doors/num-of-doors_weights/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
6linear/linear/num-of-doors/num-of-doors_weights/concatConcatV27linear/linear/num-of-doors/num-of-doors_weights/Slice_17linear/linear/num-of-doors/num-of-doors_weights/Slice_2;linear/linear/num-of-doors/num-of-doors_weights/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
9linear/linear/num-of-doors/num-of-doors_weights/Reshape_2Reshape/linear/linear/num-of-doors/num-of-doors_weights6linear/linear/num-of-doors/num-of-doors_weights/concat*
T0*'
_output_shapes
:���������*
Tshape0
n
linear/linear/Reshape_6/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_6Reshape9linear/linear/num-of-doors/num-of-doors_weights/Reshape_2linear/linear/Reshape_6/shape*
T0*'
_output_shapes
:���������*
Tshape0
�
linear/linear/AddNAddNlinear/linear/Reshapelinear/linear/Reshape_1linear/linear/Reshape_2linear/linear/Reshape_3linear/linear/Reshape_4linear/linear/Reshape_5linear/linear/Reshape_6*
T0*
_output_shapes

:@*
N
�
+linear/bias_weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *,
_class"
 loc:@linear/bias_weight/part_0
�
linear/bias_weight/part_0
VariableV2*
	container *,
_class"
 loc:@linear/bias_weight/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
 linear/bias_weight/part_0/AssignAssignlinear/bias_weight/part_0+linear/bias_weight/part_0/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
�
linear/bias_weight/part_0/readIdentitylinear/bias_weight/part_0*
T0*
_output_shapes
:*,
_class"
 loc:@linear/bias_weight/part_0
c
linear/bias_weightIdentitylinear/bias_weight/part_0/read*
T0*
_output_shapes
:
�
linear/linear/BiasAddBiasAddlinear/linear/AddNlinear/bias_weight*
T0*
_output_shapes

:@*
data_formatNHWC
�
)linear/regression_head/predictions/scoresSqueezelinear/linear/BiasAdd*
T0*
_output_shapes
:@*
squeeze_dims

�
+linear/regression_head/predictions/IdentityIdentity)linear/regression_head/predictions/scores*
T0*
_output_shapes
:@
�
7linear/regression_head/mean_squared_loss/ExpandDims/dimConst*
dtype0*
_output_shapes
:*
valueB:
�
3linear/regression_head/mean_squared_loss/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:87linear/regression_head/mean_squared_loss/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
,linear/regression_head/mean_squared_loss/subSublinear/linear/BiasAdd3linear/regression_head/mean_squared_loss/ExpandDims*
T0*
_output_shapes

:@
�
(linear/regression_head/mean_squared_lossSquare,linear/regression_head/mean_squared_loss/sub*
T0*
_output_shapes

:@
�
3linear/regression_head/mean_squared_loss/loss/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
-linear/regression_head/mean_squared_loss/lossMean(linear/regression_head/mean_squared_loss3linear/regression_head/mean_squared_loss/loss/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
n
)linear/regression_head/ScalarSummary/tagsConst*
dtype0*
_output_shapes
: *
valueB
 Bloss
�
$linear/regression_head/ScalarSummaryScalarSummary)linear/regression_head/ScalarSummary/tags-linear/regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: 
m
linear/regression_head/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
t
*linear/regression_head/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
v
,linear/regression_head/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
v
,linear/regression_head/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
$linear/regression_head/strided_sliceStridedSlicelinear/regression_head/Shape*linear/regression_head/strided_slice/stack,linear/regression_head/strided_slice/stack_1,linear/regression_head/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
r
/linear/regression_head/train_op/gradients/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
t
/linear/regression_head/train_op/gradients/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
.linear/regression_head/train_op/gradients/FillFill/linear/regression_head/train_op/gradients/Shape/linear/regression_head/train_op/gradients/Const*
T0*
_output_shapes
: 
�
jlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"      
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/ReshapeReshape.linear/regression_head/train_op/gradients/Filljlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Reshape/shape*
T0*
_output_shapes

:*
Tshape0
�
klinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Tile/multiplesConst*
dtype0*
_output_shapes
:*
valueB"@      
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/TileTiledlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Reshapeklinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Tile/multiples*
T0*
_output_shapes

:@*

Tmultiples0
�
blinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Shape_1Const*
dtype0*
_output_shapes
: *
valueB 
�
blinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/ProdProdblinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Shapeblinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
clinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Prod_1Proddlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Shape_1dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Const_1*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
flinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Maximum/yConst*
dtype0*
_output_shapes
: *
value	B :
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/MaximumMaximumclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Prod_1flinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Maximum/y*
T0*
_output_shapes
: 
�
elinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/floordivFloorDivalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Proddlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Maximum*
T0*
_output_shapes
: 
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/CastCastelinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/truedivRealDivalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Tilealinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Cast*
T0*
_output_shapes

:@
�
]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul/xConste^linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/truediv*
dtype0*
_output_shapes
: *
valueB
 *   @
�
[linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mulMul]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul/x,linear/regression_head/mean_squared_loss/sub*
T0*
_output_shapes

:@
�
]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul_1Muldlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/truediv[linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul*
T0*
_output_shapes

:@
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
clinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB"@      
�
qlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgsBroadcastGradientArgsalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
_linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/SumSum]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul_1qlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgs*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
�
clinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeReshape_linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Sumalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Sum_1Sum]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul_1slinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
�
_linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/NegNegalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Sum_1*
T0*
_output_shapes
:
�
elinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Reshape_1Reshape_linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Negclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shape_1*
T0*
_output_shapes

:@*
Tshape0
�
Plinear/regression_head/train_op/gradients/linear/linear/BiasAdd_grad/BiasAddGradBiasAddGradclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Reshape*
T0*
_output_shapes
:*
data_formatNHWC
�
Jlinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeJlinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_4_grad/ShapeShape)linear/linear/make/make_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_4_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_4_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_5_grad/ShapeShapeAlinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_5_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_5_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_6_grad/ShapeShape9linear/linear/num-of-doors/num-of-doors_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_6_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_6_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Qlinear/regression_head/train_op/gradients/linear/linear/height/matmul_grad/MatMulMatMulLlinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/Reshapelinear/height/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Slinear/regression_head/train_op/gradients/linear/linear/height/matmul_grad/MatMul_1MatMullinear/linear/height/ExpandDimsLlinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/Reshape*
T0*
_output_shapes

:*
transpose_a(*
transpose_b( 
�
Ulinear/regression_head/train_op/gradients/linear/linear/horsepower/matmul_grad/MatMulMatMulNlinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/Reshapelinear/horsepower/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Wlinear/regression_head/train_op/gradients/linear/linear/horsepower/matmul_grad/MatMul_1MatMul#linear/linear/horsepower/ExpandDimsNlinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/Reshape*
T0*
_output_shapes

:*
transpose_a(*
transpose_b( 
�
Qlinear/regression_head/train_op/gradients/linear/linear/length/matmul_grad/MatMulMatMulNlinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/Reshapelinear/length/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Slinear/regression_head/train_op/gradients/linear/linear/length/matmul_grad/MatMul_1MatMullinear/linear/length/ExpandDimsNlinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/Reshape*
T0*
_output_shapes

:*
transpose_a(*
transpose_b( 
�
Plinear/regression_head/train_op/gradients/linear/linear/width/matmul_grad/MatMulMatMulNlinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/Reshapelinear/width/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Rlinear/regression_head/train_op/gradients/linear/linear/width/matmul_grad/MatMul_1MatMullinear/linear/width/ExpandDimsNlinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/Reshape*
T0*
_output_shapes

:*
transpose_a(*
transpose_b( 
�
^linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/ShapeShapelinear/linear/make/make_weights*
T0*
out_type0*
_output_shapes
:
�
`linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/ReshapeReshapeNlinear/regression_head/train_op/gradients/linear/linear/Reshape_4_grad/Reshape^linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
vlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/ShapeShape7linear/linear/num-of-cylinders/num-of-cylinders_weights*
T0*
out_type0*
_output_shapes
:
�
xlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/ReshapeReshapeNlinear/regression_head/train_op/gradients/linear/linear/Reshape_5_grad/Reshapevlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
nlinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/ShapeShape/linear/linear/num-of-doors/num-of-doors_weights*
T0*
out_type0*
_output_shapes
:
�
plinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/ReshapeReshapeNlinear/regression_head/train_op/gradients/linear/linear/Reshape_6_grad/Reshapenlinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Ylinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/zeros_like	ZerosLike*linear/linear/make/make_weights/zeros_like*
T0*'
_output_shapes
:���������
�
Ulinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/SelectSelect$linear/linear/make/make_weights/Tile`linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/ReshapeYlinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/zeros_like*
T0*
_output_shapes

:@
�
Wlinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/Select_1Select$linear/linear/make/make_weights/TileYlinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/zeros_like`linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/Reshape*
T0*
_output_shapes

:@
�
qlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/zeros_like	ZerosLikeBlinear/linear/num-of-cylinders/num-of-cylinders_weights/zeros_like*
T0*'
_output_shapes
:���������
�
mlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/SelectSelect<linear/linear/num-of-cylinders/num-of-cylinders_weights/Tilexlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/Reshapeqlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/zeros_like*
T0*
_output_shapes

:@
�
olinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/Select_1Select<linear/linear/num-of-cylinders/num-of-cylinders_weights/Tileqlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/zeros_likexlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/Reshape*
T0*
_output_shapes

:@
�
ilinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/zeros_like	ZerosLike:linear/linear/num-of-doors/num-of-doors_weights/zeros_like*
T0*'
_output_shapes
:���������
�
elinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/SelectSelect4linear/linear/num-of-doors/num-of-doors_weights/Tileplinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/Reshapeilinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/zeros_like*
T0*
_output_shapes

:@
�
glinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/Select_1Select4linear/linear/num-of-doors/num-of-doors_weights/Tileilinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/zeros_likeplinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/Reshape*
T0*
_output_shapes

:@
�
llinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/ShapeShapeHlinear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup*
T0*
out_type0*
_output_shapes
:
�
zlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
tlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_sliceStridedSlicellinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/Shapezlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack_1|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
�
mlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/GatherGatherWlinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/Select_1<linear/linear/make/make_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0
�
ylinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/UnsortedSegmentSumUnsortedSegmentSummlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/Gather@linear/linear/make/make_weights/embedding_lookup_sparse/Unique:1tlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice*
T0*'
_output_shapes
:���������*
Tindices0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/ShapeShape`linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup*
T0*
out_type0*
_output_shapes
:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_sliceStridedSlice�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/GatherGatherolinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/Select_1Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/UnsortedSegmentSumUnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/GatherXlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique:1�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice*
T0*'
_output_shapes
:���������*
Tindices0
�
|linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/ShapeShapeXlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup*
T0*
out_type0*
_output_shapes
:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_sliceStridedSlice|linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
�
}linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/GatherGatherglinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/Select_1Llinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/UnsortedSegmentSumUnsortedSegmentSum}linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/GatherPlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique:1�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice*
T0*'
_output_shapes
:���������*
Tindices0
�
}linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"2      *-
_class#
!loc:@linear/make/weights/part_0
�
|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/SizeSize>linear/linear/make/make_weights/embedding_lookup_sparse/Unique*
T0	*
out_type0*
_output_shapes
: 
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims
ExpandDims|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/Size�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_sliceStridedSlice}linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
:*

begin_mask *
Index0
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
~linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/concatConcatV2�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeReshapeylinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/UnsortedSegmentSum~linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/concat*
T0*0
_output_shapes
:������������������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1Reshape>linear/linear/make/make_weights/embedding_lookup_sparse/Unique�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims*
T0	*#
_output_shapes
:���������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"      *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/SizeSizeVlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique*
T0	*
out_type0*
_output_shapes
: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims
ExpandDims�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Size�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_sliceStridedSlice�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
:*

begin_mask *
Index0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/concatConcatV2�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeReshape�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/UnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/concat*
T0*0
_output_shapes
:������������������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1ReshapeVlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims*
T0	*#
_output_shapes
:���������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"      *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/SizeSizeNlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique*
T0	*
out_type0*
_output_shapes
: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims
ExpandDims�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/Size�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_sliceStridedSlice�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
:*

begin_mask *
Index0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/concatConcatV2�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeReshape�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/UnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/concat*
T0*0
_output_shapes
:������������������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1ReshapeNlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims*
T0	*#
_output_shapes
:���������*
Tshape0
�
%linear/regression_head/train_op/ConstConst*
dtype0*
_output_shapes

:*
valueB*���=*.
_class$
" loc:@linear/height/weight/part_0
�
7linear/regression_head/linear/height/weight/part_0/Ftrl
VariableV2*
	container *.
_class$
" loc:@linear/height/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
>linear/regression_head/linear/height/weight/part_0/Ftrl/AssignAssign7linear/regression_head/linear/height/weight/part_0/Ftrl%linear/regression_head/train_op/Const*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
�
<linear/regression_head/linear/height/weight/part_0/Ftrl/readIdentity7linear/regression_head/linear/height/weight/part_0/Ftrl*
T0*
_output_shapes

:*.
_class$
" loc:@linear/height/weight/part_0
�
Klinear/regression_head/linear/height/weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *.
_class$
" loc:@linear/height/weight/part_0
�
9linear/regression_head/linear/height/weight/part_0/Ftrl_1
VariableV2*
	container *.
_class$
" loc:@linear/height/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
@linear/regression_head/linear/height/weight/part_0/Ftrl_1/AssignAssign9linear/regression_head/linear/height/weight/part_0/Ftrl_1Klinear/regression_head/linear/height/weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
�
>linear/regression_head/linear/height/weight/part_0/Ftrl_1/readIdentity9linear/regression_head/linear/height/weight/part_0/Ftrl_1*
T0*
_output_shapes

:*.
_class$
" loc:@linear/height/weight/part_0
�
'linear/regression_head/train_op/Const_1Const*
dtype0*
_output_shapes

:*
valueB*���=*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
;linear/regression_head/linear/horsepower/weight/part_0/Ftrl
VariableV2*
	container *2
_class(
&$loc:@linear/horsepower/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Blinear/regression_head/linear/horsepower/weight/part_0/Ftrl/AssignAssign;linear/regression_head/linear/horsepower/weight/part_0/Ftrl'linear/regression_head/train_op/Const_1*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
@linear/regression_head/linear/horsepower/weight/part_0/Ftrl/readIdentity;linear/regression_head/linear/horsepower/weight/part_0/Ftrl*
T0*
_output_shapes

:*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
Olinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1
VariableV2*
	container *2
_class(
&$loc:@linear/horsepower/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Dlinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/AssignAssign=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1Olinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
Blinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/readIdentity=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1*
T0*
_output_shapes

:*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
'linear/regression_head/train_op/Const_2Const*
dtype0*
_output_shapes

:*
valueB*���=*.
_class$
" loc:@linear/length/weight/part_0
�
7linear/regression_head/linear/length/weight/part_0/Ftrl
VariableV2*
	container *.
_class$
" loc:@linear/length/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
>linear/regression_head/linear/length/weight/part_0/Ftrl/AssignAssign7linear/regression_head/linear/length/weight/part_0/Ftrl'linear/regression_head/train_op/Const_2*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
�
<linear/regression_head/linear/length/weight/part_0/Ftrl/readIdentity7linear/regression_head/linear/length/weight/part_0/Ftrl*
T0*
_output_shapes

:*.
_class$
" loc:@linear/length/weight/part_0
�
Klinear/regression_head/linear/length/weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *.
_class$
" loc:@linear/length/weight/part_0
�
9linear/regression_head/linear/length/weight/part_0/Ftrl_1
VariableV2*
	container *.
_class$
" loc:@linear/length/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
@linear/regression_head/linear/length/weight/part_0/Ftrl_1/AssignAssign9linear/regression_head/linear/length/weight/part_0/Ftrl_1Klinear/regression_head/linear/length/weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
�
>linear/regression_head/linear/length/weight/part_0/Ftrl_1/readIdentity9linear/regression_head/linear/length/weight/part_0/Ftrl_1*
T0*
_output_shapes

:*.
_class$
" loc:@linear/length/weight/part_0
�
'linear/regression_head/train_op/Const_3Const*
dtype0*
_output_shapes

:*
valueB*���=*-
_class#
!loc:@linear/width/weight/part_0
�
6linear/regression_head/linear/width/weight/part_0/Ftrl
VariableV2*
	container *-
_class#
!loc:@linear/width/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
=linear/regression_head/linear/width/weight/part_0/Ftrl/AssignAssign6linear/regression_head/linear/width/weight/part_0/Ftrl'linear/regression_head/train_op/Const_3*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
;linear/regression_head/linear/width/weight/part_0/Ftrl/readIdentity6linear/regression_head/linear/width/weight/part_0/Ftrl*
T0*
_output_shapes

:*-
_class#
!loc:@linear/width/weight/part_0
�
Jlinear/regression_head/linear/width/weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *-
_class#
!loc:@linear/width/weight/part_0
�
8linear/regression_head/linear/width/weight/part_0/Ftrl_1
VariableV2*
	container *-
_class#
!loc:@linear/width/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
?linear/regression_head/linear/width/weight/part_0/Ftrl_1/AssignAssign8linear/regression_head/linear/width/weight/part_0/Ftrl_1Jlinear/regression_head/linear/width/weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
=linear/regression_head/linear/width/weight/part_0/Ftrl_1/readIdentity8linear/regression_head/linear/width/weight/part_0/Ftrl_1*
T0*
_output_shapes

:*-
_class#
!loc:@linear/width/weight/part_0
�
'linear/regression_head/train_op/Const_4Const*
dtype0*
_output_shapes

:2*
valueB2*���=*-
_class#
!loc:@linear/make/weights/part_0
�
6linear/regression_head/linear/make/weights/part_0/Ftrl
VariableV2*
	container *-
_class#
!loc:@linear/make/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
=linear/regression_head/linear/make/weights/part_0/Ftrl/AssignAssign6linear/regression_head/linear/make/weights/part_0/Ftrl'linear/regression_head/train_op/Const_4*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
;linear/regression_head/linear/make/weights/part_0/Ftrl/readIdentity6linear/regression_head/linear/make/weights/part_0/Ftrl*
T0*
_output_shapes

:2*-
_class#
!loc:@linear/make/weights/part_0
�
Jlinear/regression_head/linear/make/weights/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:2*
valueB2*    *-
_class#
!loc:@linear/make/weights/part_0
�
8linear/regression_head/linear/make/weights/part_0/Ftrl_1
VariableV2*
	container *-
_class#
!loc:@linear/make/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
?linear/regression_head/linear/make/weights/part_0/Ftrl_1/AssignAssign8linear/regression_head/linear/make/weights/part_0/Ftrl_1Jlinear/regression_head/linear/make/weights/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
=linear/regression_head/linear/make/weights/part_0/Ftrl_1/readIdentity8linear/regression_head/linear/make/weights/part_0/Ftrl_1*
T0*
_output_shapes

:2*-
_class#
!loc:@linear/make/weights/part_0
�
'linear/regression_head/train_op/Const_5Const*
dtype0*
_output_shapes

:*
valueB*���=*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Blinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl
VariableV2*
	container *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Ilinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl/AssignAssignBlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl'linear/regression_head/train_op/Const_5*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Glinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl/readIdentityBlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl*
T0*
_output_shapes

:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Vlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Dlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1
VariableV2*
	container *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Klinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/AssignAssignDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1Vlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Ilinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/readIdentityDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1*
T0*
_output_shapes

:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
'linear/regression_head/train_op/Const_6Const*
dtype0*
_output_shapes

:*
valueB*���=*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl
VariableV2*
	container *5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Elinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl/AssignAssign>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl'linear/regression_head/train_op/Const_6*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Clinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl/readIdentity>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl*
T0*
_output_shapes

:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Rlinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1
VariableV2*
	container *5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Glinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/AssignAssign@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1Rlinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Elinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/readIdentity@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1*
T0*
_output_shapes

:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
'linear/regression_head/train_op/Const_7Const*
dtype0*
_output_shapes
:*
valueB*���=*,
_class"
 loc:@linear/bias_weight/part_0
�
5linear/regression_head/linear/bias_weight/part_0/Ftrl
VariableV2*
	container *,
_class"
 loc:@linear/bias_weight/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
<linear/regression_head/linear/bias_weight/part_0/Ftrl/AssignAssign5linear/regression_head/linear/bias_weight/part_0/Ftrl'linear/regression_head/train_op/Const_7*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
�
:linear/regression_head/linear/bias_weight/part_0/Ftrl/readIdentity5linear/regression_head/linear/bias_weight/part_0/Ftrl*
T0*
_output_shapes
:*,
_class"
 loc:@linear/bias_weight/part_0
�
Ilinear/regression_head/linear/bias_weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *,
_class"
 loc:@linear/bias_weight/part_0
�
7linear/regression_head/linear/bias_weight/part_0/Ftrl_1
VariableV2*
	container *,
_class"
 loc:@linear/bias_weight/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
>linear/regression_head/linear/bias_weight/part_0/Ftrl_1/AssignAssign7linear/regression_head/linear/bias_weight/part_0/Ftrl_1Ilinear/regression_head/linear/bias_weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
�
<linear/regression_head/linear/bias_weight/part_0/Ftrl_1/readIdentity7linear/regression_head/linear/bias_weight/part_0/Ftrl_1*
T0*
_output_shapes
:*,
_class"
 loc:@linear/bias_weight/part_0
w
2linear/regression_head/train_op/Ftrl/learning_rateConst*
dtype0*
_output_shapes
: *
valueB
 *��L>
�
?linear/regression_head/train_op/Ftrl/l1_regularization_strengthConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
?linear/regression_head/train_op/Ftrl/l2_regularization_strengthConst*
dtype0*
_output_shapes
: *
valueB
 *    
}
8linear/regression_head/train_op/Ftrl/learning_rate_powerConst*
dtype0*
_output_shapes
: *
valueB
 *   �
�
Qlinear/regression_head/train_op/Ftrl/update_linear/height/weight/part_0/ApplyFtrl	ApplyFtrllinear/height/weight/part_07linear/regression_head/linear/height/weight/part_0/Ftrl9linear/regression_head/linear/height/weight/part_0/Ftrl_1Slinear/regression_head/train_op/gradients/linear/linear/height/matmul_grad/MatMul_12linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *.
_class$
" loc:@linear/height/weight/part_0
�
Ulinear/regression_head/train_op/Ftrl/update_linear/horsepower/weight/part_0/ApplyFtrl	ApplyFtrllinear/horsepower/weight/part_0;linear/regression_head/linear/horsepower/weight/part_0/Ftrl=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1Wlinear/regression_head/train_op/gradients/linear/linear/horsepower/matmul_grad/MatMul_12linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
Qlinear/regression_head/train_op/Ftrl/update_linear/length/weight/part_0/ApplyFtrl	ApplyFtrllinear/length/weight/part_07linear/regression_head/linear/length/weight/part_0/Ftrl9linear/regression_head/linear/length/weight/part_0/Ftrl_1Slinear/regression_head/train_op/gradients/linear/linear/length/matmul_grad/MatMul_12linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *.
_class$
" loc:@linear/length/weight/part_0
�
Plinear/regression_head/train_op/Ftrl/update_linear/width/weight/part_0/ApplyFtrl	ApplyFtrllinear/width/weight/part_06linear/regression_head/linear/width/weight/part_0/Ftrl8linear/regression_head/linear/width/weight/part_0/Ftrl_1Rlinear/regression_head/train_op/gradients/linear/linear/width/matmul_grad/MatMul_12linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *-
_class#
!loc:@linear/width/weight/part_0
�
Mlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/UniqueUnique�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0*-
_class#
!loc:@linear/make/weights/part_0
�
Llinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/ShapeShapeMlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/Unique*
T0	*
out_type0*
_output_shapes
:*-
_class#
!loc:@linear/make/weights/part_0
�
Zlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: *-
_class#
!loc:@linear/make/weights/part_0
�
\linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:*-
_class#
!loc:@linear/make/weights/part_0
�
\linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:*-
_class#
!loc:@linear/make/weights/part_0
�
Tlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_sliceStridedSliceLlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/ShapeZlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack\linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack_1\linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *
Index0*

begin_mask *-
_class#
!loc:@linear/make/weights/part_0
�
Ylinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/UnsortedSegmentSumUnsortedSegmentSumlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeOlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/Unique:1Tlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice*
T0*0
_output_shapes
:������������������*-
_class#
!loc:@linear/make/weights/part_0*
Tindices0
�
Vlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/SparseApplyFtrlSparseApplyFtrllinear/make/weights/part_06linear/regression_head/linear/make/weights/part_0/Ftrl8linear/regression_head/linear/make/weights/part_0/Ftrl_1Ylinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/UnsortedSegmentSumMlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/Unique2linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:2*
use_locking( *
Tindices0	*-
_class#
!loc:@linear/make/weights/part_0
�
Ylinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/UniqueUnique�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Xlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/ShapeShapeYlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/Unique*
T0	*
out_type0*
_output_shapes
:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
flinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
hlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
hlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
`linear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_sliceStridedSliceXlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/Shapeflinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stackhlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stack_1hlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *
Index0*

begin_mask *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
elinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/UnsortedSegmentSumUnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape[linear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/Unique:1`linear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice*
T0*0
_output_shapes
:������������������*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
Tindices0
�
blinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/SparseApplyFtrlSparseApplyFtrl&linear/num-of-cylinders/weights/part_0Blinear/regression_head/linear/num-of-cylinders/weights/part_0/FtrlDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1elinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/UnsortedSegmentSumYlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/Unique2linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *
Tindices0	*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Ulinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/UniqueUnique�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Tlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/ShapeShapeUlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/Unique*
T0	*
out_type0*
_output_shapes
:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
blinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
dlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
dlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
\linear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_sliceStridedSliceTlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/Shapeblinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stackdlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stack_1dlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *
Index0*

begin_mask *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
alinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/UnsortedSegmentSumUnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeWlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/Unique:1\linear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice*
T0*0
_output_shapes
:������������������*5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
Tindices0
�
^linear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/SparseApplyFtrlSparseApplyFtrl"linear/num-of-doors/weights/part_0>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1alinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/UnsortedSegmentSumUlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/Unique2linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *
Tindices0	*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Olinear/regression_head/train_op/Ftrl/update_linear/bias_weight/part_0/ApplyFtrl	ApplyFtrllinear/bias_weight/part_05linear/regression_head/linear/bias_weight/part_0/Ftrl7linear/regression_head/linear/bias_weight/part_0/Ftrl_1Plinear/regression_head/train_op/gradients/linear/linear/BiasAdd_grad/BiasAddGrad2linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes
:*
use_locking( *,
_class"
 loc:@linear/bias_weight/part_0
�
+linear/regression_head/train_op/Ftrl/updateNoOpR^linear/regression_head/train_op/Ftrl/update_linear/height/weight/part_0/ApplyFtrlV^linear/regression_head/train_op/Ftrl/update_linear/horsepower/weight/part_0/ApplyFtrlR^linear/regression_head/train_op/Ftrl/update_linear/length/weight/part_0/ApplyFtrlQ^linear/regression_head/train_op/Ftrl/update_linear/width/weight/part_0/ApplyFtrlW^linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/SparseApplyFtrlc^linear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/SparseApplyFtrl_^linear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/SparseApplyFtrlP^linear/regression_head/train_op/Ftrl/update_linear/bias_weight/part_0/ApplyFtrl
�
*linear/regression_head/train_op/Ftrl/valueConst,^linear/regression_head/train_op/Ftrl/update*
dtype0	*
_output_shapes
: *
value	B	 R*
_class
loc:@global_step
�
$linear/regression_head/train_op/Ftrl	AssignAddglobal_step*linear/regression_head/train_op/Ftrl/value*
T0	*
_output_shapes
: *
use_locking( *
_class
loc:@global_step
n
)linear/regression_head/metrics/mean/zerosConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
)linear/regression_head/metrics/mean/total
VariableV2*
dtype0*
	container *
_output_shapes
: *
shape: *
shared_name 
�
0linear/regression_head/metrics/mean/total/AssignAssign)linear/regression_head/metrics/mean/total)linear/regression_head/metrics/mean/zeros*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*<
_class2
0.loc:@linear/regression_head/metrics/mean/total
�
.linear/regression_head/metrics/mean/total/readIdentity)linear/regression_head/metrics/mean/total*
T0*
_output_shapes
: *<
_class2
0.loc:@linear/regression_head/metrics/mean/total
p
+linear/regression_head/metrics/mean/zeros_1Const*
dtype0*
_output_shapes
: *
valueB
 *    
�
)linear/regression_head/metrics/mean/count
VariableV2*
dtype0*
	container *
_output_shapes
: *
shape: *
shared_name 
�
0linear/regression_head/metrics/mean/count/AssignAssign)linear/regression_head/metrics/mean/count+linear/regression_head/metrics/mean/zeros_1*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*<
_class2
0.loc:@linear/regression_head/metrics/mean/count
�
.linear/regression_head/metrics/mean/count/readIdentity)linear/regression_head/metrics/mean/count*
T0*
_output_shapes
: *<
_class2
0.loc:@linear/regression_head/metrics/mean/count
j
(linear/regression_head/metrics/mean/SizeConst*
dtype0*
_output_shapes
: *
value	B :
�
-linear/regression_head/metrics/mean/ToFloat_1Cast(linear/regression_head/metrics/mean/Size*

SrcT0*
_output_shapes
: *

DstT0
l
)linear/regression_head/metrics/mean/ConstConst*
dtype0*
_output_shapes
: *
valueB 
�
'linear/regression_head/metrics/mean/SumSum-linear/regression_head/mean_squared_loss/loss)linear/regression_head/metrics/mean/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
-linear/regression_head/metrics/mean/AssignAdd	AssignAdd)linear/regression_head/metrics/mean/total'linear/regression_head/metrics/mean/Sum*
T0*
_output_shapes
: *
use_locking( *<
_class2
0.loc:@linear/regression_head/metrics/mean/total
�
/linear/regression_head/metrics/mean/AssignAdd_1	AssignAdd)linear/regression_head/metrics/mean/count-linear/regression_head/metrics/mean/ToFloat_1.^linear/regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: *
use_locking( *<
_class2
0.loc:@linear/regression_head/metrics/mean/count
r
-linear/regression_head/metrics/mean/Greater/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
+linear/regression_head/metrics/mean/GreaterGreater.linear/regression_head/metrics/mean/count/read-linear/regression_head/metrics/mean/Greater/y*
T0*
_output_shapes
: 
�
+linear/regression_head/metrics/mean/truedivRealDiv.linear/regression_head/metrics/mean/total/read.linear/regression_head/metrics/mean/count/read*
T0*
_output_shapes
: 
p
+linear/regression_head/metrics/mean/value/eConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
)linear/regression_head/metrics/mean/valueSelect+linear/regression_head/metrics/mean/Greater+linear/regression_head/metrics/mean/truediv+linear/regression_head/metrics/mean/value/e*
T0*
_output_shapes
: 
t
/linear/regression_head/metrics/mean/Greater_1/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
-linear/regression_head/metrics/mean/Greater_1Greater/linear/regression_head/metrics/mean/AssignAdd_1/linear/regression_head/metrics/mean/Greater_1/y*
T0*
_output_shapes
: 
�
-linear/regression_head/metrics/mean/truediv_1RealDiv-linear/regression_head/metrics/mean/AssignAdd/linear/regression_head/metrics/mean/AssignAdd_1*
T0*
_output_shapes
: 
t
/linear/regression_head/metrics/mean/update_op/eConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
-linear/regression_head/metrics/mean/update_opSelect-linear/regression_head/metrics/mean/Greater_1-linear/regression_head/metrics/mean/truediv_1/linear/regression_head/metrics/mean/update_op/e*
T0*
_output_shapes
: "���o��     '��U	�P�AJӡ
�0�0
9
Add
x"T
y"T
z"T"
Ttype:
2	
S
AddN
inputs"T*N
sum"T"
Nint(0"
Ttype:
2	��
�
	ApplyFtrl
var"T�
accum"T�
linear"T�	
grad"T
lr"T
l1"T
l2"T
lr_power"T
out"T�"
Ttype:
2	"
use_lockingbool( 
x
Assign
ref"T�

value"T

output_ref"T�"	
Ttype"
validate_shapebool("
use_lockingbool(�
p
	AssignAdd
ref"T�

value"T

output_ref"T�"
Ttype:
2	"
use_lockingbool( 
{
BiasAdd

value"T	
bias"T
output"T"
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
{
BiasAddGrad
out_backprop"T
output"T"
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
4
Fill
dims

value"T
output"T"	
Ttype
>
FloorDiv
x"T
y"T
z"T"
Ttype:
2	
�
Gather
params"Tparams
indices"Tindices
output"Tparams"
validate_indicesbool("
Tparamstype"
Tindicestype:
2	
:
Greater
x"T
y"T
z
"
Ttype:
2		
?
GreaterEqual
x"T
y"T
z
"
Ttype:
2		
�
	HashTable
table_handle�"
	containerstring "
shared_namestring "!
use_node_name_sharingbool( "
	key_dtypetype"
value_dtypetype�
.
Identity

input"T
output"T"	
Ttype
`
InitializeTable
table_handle�
keys"Tkey
values"Tval"
Tkeytype"
Tvaltype
\
ListDiff
x"T
y"T
out"T
idx"out_idx"	
Ttype"
out_idxtype0:
2	
u
LookupTableFind
table_handle�
keys"Tin
default_value"Tout
values"Tout"
Tintype"
Touttype
o
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2
:
Maximum
x"T
y"T
z"T"
Ttype:	
2	�
�
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
<
Mul
x"T
y"T
z"T"
Ttype:
2	�
-
Neg
x"T
y"T"
Ttype:
	2	

NoOp
D
NotEqual
x"T
y"T
z
"
Ttype:
2	
�
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
�
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
B
QueueCloseV2

handle"#
cancel_pending_enqueuesbool( �
�
QueueDequeueManyV2

handle
n

components2component_types"!
component_types
list(type)(0"

timeout_msint����������
}
QueueEnqueueManyV2

handle

components2Tcomponents"
Tcomponents
list(type)(0"

timeout_msint����������
&
QueueSizeV2

handle
size�
�
RandomShuffleQueueV2

handle"!
component_types
list(type)(0"
shapeslist(shape)
 ("
capacityint���������"
min_after_dequeueint "
seedint "
seed2int "
	containerstring "
shared_namestring �
`
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:
2	
=
RealDiv
x"T
y"T
z"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
M
ScalarSummary
tags
values"T
summary"
Ttype:
2		
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
O
Size

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
�
SparseApplyFtrl
var"T�
accum"T�
linear"T�	
grad"T
indices"Tindices
lr"T
l1"T
l2"T
lr_power"T
out"T�"
Ttype:
2	"
Tindicestype:
2	"
use_lockingbool( 
y
SparseReorder
input_indices	
input_values"T
input_shape	
output_indices	
output_values"T"	
Ttype
h
SparseReshape
input_indices	
input_shape	
	new_shape	
output_indices	
output_shape	
�
SparseSegmentSum	
data"T
indices"Tidx
segment_ids
output"T"
Ttype:
2		"
Tidxtype0:
2	
�
SparseToDense
sparse_indices"Tindices
output_shape"Tindices
sparse_values"T
default_value"T

dense"T"
validate_indicesbool("	
Ttype"
Tindicestype:
2	
0
Square
x"T
y"T"
Ttype:
	2	
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
G
StringToHashBucketFast	
input

output	"
num_bucketsint(0
5
Sub
x"T
y"T
z"T"
Ttype:
	2	
�
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
P
Unique
x"T
y"T
idx"out_idx"	
Ttype"
out_idxtype0:
2	
P
Unpack

value"T
output"T*num"
numint("	
Ttype"
axisint 
�
UnsortedSegmentSum	
data"T
segment_ids"Tindices
num_segments
output"T"
Ttype:
2	"
Tindicestype:
2	
s

VariableV2
ref"dtype�"
shapeshape"
dtypetype"
	containerstring "
shared_namestring �

Where	
input
	
index	
&
	ZerosLike
x"T
y"T"	
Ttype*	1.2.0-rc12v1.2.0-rc0-24-g94484aa��


global_step/Initializer/zerosConst*
dtype0	*
_output_shapes
: *
value	B	 R *
_class
loc:@global_step
�
global_step
VariableV2*
	container *
_class
loc:@global_step*
dtype0	*
_output_shapes
: *
shape: *
shared_name 
�
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
T0	*
_output_shapes
: *
validate_shape(*
use_locking(*
_class
loc:@global_step
j
global_step/readIdentityglobal_step*
T0	*
_output_shapes
: *
_class
loc:@global_step
�
"enqueue_input/random_shuffle_queueRandomShuffleQueueV2*
	container *
seed2 *
shared_name *
min_after_dequeue�*
_output_shapes
: *

seed * 
component_types
2		*
capacity�*
shapes
: : : : : : : : : 
^
enqueue_input/PlaceholderPlaceholder*
dtype0	*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_1Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_2Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_3Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_4Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_5Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_6Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_7Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_8Placeholder*
dtype0*
_output_shapes
:*
shape:
�
.enqueue_input/random_shuffle_queue_EnqueueManyQueueEnqueueManyV2"enqueue_input/random_shuffle_queueenqueue_input/Placeholderenqueue_input/Placeholder_1enqueue_input/Placeholder_2enqueue_input/Placeholder_3enqueue_input/Placeholder_4enqueue_input/Placeholder_5enqueue_input/Placeholder_6enqueue_input/Placeholder_7enqueue_input/Placeholder_8*
Tcomponents
2		*

timeout_ms���������
{
(enqueue_input/random_shuffle_queue_CloseQueueCloseV2"enqueue_input/random_shuffle_queue*
cancel_pending_enqueues( 
}
*enqueue_input/random_shuffle_queue_Close_1QueueCloseV2"enqueue_input/random_shuffle_queue*
cancel_pending_enqueues(
r
'enqueue_input/random_shuffle_queue_SizeQueueSizeV2"enqueue_input/random_shuffle_queue*
_output_shapes
: 
V
enqueue_input/sub/yConst*
dtype0*
_output_shapes
: *
value
B :�
w
enqueue_input/subSub'enqueue_input/random_shuffle_queue_Sizeenqueue_input/sub/y*
T0*
_output_shapes
: 
Y
enqueue_input/Maximum/xConst*
dtype0*
_output_shapes
: *
value	B : 
m
enqueue_input/MaximumMaximumenqueue_input/Maximum/xenqueue_input/sub*
T0*
_output_shapes
: 
a
enqueue_input/CastCastenqueue_input/Maximum*

SrcT0*
_output_shapes
: *

DstT0
X
enqueue_input/mul/yConst*
dtype0*
_output_shapes
: *
valueB
 *>î:
b
enqueue_input/mulMulenqueue_input/Castenqueue_input/mul/y*
T0*
_output_shapes
: 
�
Xenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full/tagsConst*
dtype0*
_output_shapes
: *d
value[BY BSenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full
�
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullScalarSummaryXenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full/tagsenqueue_input/mul*
T0*
_output_shapes
: 
d
"random_shuffle_queue_DequeueMany/nConst*
dtype0*
_output_shapes
: *
value	B :@
�
 random_shuffle_queue_DequeueManyQueueDequeueManyV2"enqueue_input/random_shuffle_queue"random_shuffle_queue_DequeueMany/n*J
_output_shapes8
6:@:@:@:@:@:@:@:@:@*

timeout_ms���������* 
component_types
2		
n
#linear/linear/height/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/height/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:6#linear/linear/height/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
-linear/height/weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *.
_class$
" loc:@linear/height/weight/part_0
�
linear/height/weight/part_0
VariableV2*
	container *.
_class$
" loc:@linear/height/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
"linear/height/weight/part_0/AssignAssignlinear/height/weight/part_0-linear/height/weight/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
�
 linear/height/weight/part_0/readIdentitylinear/height/weight/part_0*
T0*
_output_shapes

:*.
_class$
" loc:@linear/height/weight/part_0
k
linear/height/weightIdentity linear/height/weight/part_0/read*
T0*
_output_shapes

:
�
linear/linear/height/matmulMatMullinear/linear/height/ExpandDimslinear/height/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
l
linear/linear/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/ReshapeReshapelinear/linear/height/matmullinear/linear/Reshape/shape*
T0*
_output_shapes

:@*
Tshape0
r
'linear/linear/horsepower/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
#linear/linear/horsepower/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:3'linear/linear/horsepower/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
1linear/horsepower/weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
linear/horsepower/weight/part_0
VariableV2*
	container *2
_class(
&$loc:@linear/horsepower/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
&linear/horsepower/weight/part_0/AssignAssignlinear/horsepower/weight/part_01linear/horsepower/weight/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
$linear/horsepower/weight/part_0/readIdentitylinear/horsepower/weight/part_0*
T0*
_output_shapes

:*2
_class(
&$loc:@linear/horsepower/weight/part_0
s
linear/horsepower/weightIdentity$linear/horsepower/weight/part_0/read*
T0*
_output_shapes

:
�
linear/linear/horsepower/matmulMatMul#linear/linear/horsepower/ExpandDimslinear/horsepower/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
n
linear/linear/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_1Reshapelinear/linear/horsepower/matmullinear/linear/Reshape_1/shape*
T0*
_output_shapes

:@*
Tshape0
n
#linear/linear/length/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/length/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:5#linear/linear/length/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
-linear/length/weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *.
_class$
" loc:@linear/length/weight/part_0
�
linear/length/weight/part_0
VariableV2*
	container *.
_class$
" loc:@linear/length/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
"linear/length/weight/part_0/AssignAssignlinear/length/weight/part_0-linear/length/weight/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
�
 linear/length/weight/part_0/readIdentitylinear/length/weight/part_0*
T0*
_output_shapes

:*.
_class$
" loc:@linear/length/weight/part_0
k
linear/length/weightIdentity linear/length/weight/part_0/read*
T0*
_output_shapes

:
�
linear/linear/length/matmulMatMullinear/linear/length/ExpandDimslinear/length/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
n
linear/linear/Reshape_2/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_2Reshapelinear/linear/length/matmullinear/linear/Reshape_2/shape*
T0*
_output_shapes

:@*
Tshape0
m
"linear/linear/width/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/width/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:7"linear/linear/width/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
,linear/width/weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *-
_class#
!loc:@linear/width/weight/part_0
�
linear/width/weight/part_0
VariableV2*
	container *-
_class#
!loc:@linear/width/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
!linear/width/weight/part_0/AssignAssignlinear/width/weight/part_0,linear/width/weight/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
linear/width/weight/part_0/readIdentitylinear/width/weight/part_0*
T0*
_output_shapes

:*-
_class#
!loc:@linear/width/weight/part_0
i
linear/width/weightIdentitylinear/width/weight/part_0/read*
T0*
_output_shapes

:
�
linear/linear/width/matmulMatMullinear/linear/width/ExpandDimslinear/width/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
n
linear/linear/Reshape_3/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_3Reshapelinear/linear/width/matmullinear/linear/Reshape_3/shape*
T0*
_output_shapes

:@*
Tshape0
h
linear/linear/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:4linear/linear/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
x
'linear/linear/DenseToSparseTensor/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
&linear/linear/DenseToSparseTensor/CastCast'linear/linear/DenseToSparseTensor/Shape*

SrcT0*
_output_shapes
:*

DstT0	
k
*linear/linear/DenseToSparseTensor/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
*linear/linear/DenseToSparseTensor/NotEqualNotEquallinear/linear/expand_dims*linear/linear/DenseToSparseTensor/Cast_1/x*
T0*
_output_shapes

:@
�
'linear/linear/DenseToSparseTensor/WhereWhere*linear/linear/DenseToSparseTensor/NotEqual*'
_output_shapes
:���������
�
/linear/linear/DenseToSparseTensor/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
)linear/linear/DenseToSparseTensor/ReshapeReshapelinear/linear/expand_dims/linear/linear/DenseToSparseTensor/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
5linear/linear/DenseToSparseTensor/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
7linear/linear/DenseToSparseTensor/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
7linear/linear/DenseToSparseTensor/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
/linear/linear/DenseToSparseTensor/strided_sliceStridedSlice'linear/linear/DenseToSparseTensor/Where5linear/linear/DenseToSparseTensor/strided_slice/stack7linear/linear/DenseToSparseTensor/strided_slice/stack_17linear/linear/DenseToSparseTensor/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
7linear/linear/DenseToSparseTensor/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
9linear/linear/DenseToSparseTensor/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
1linear/linear/DenseToSparseTensor/strided_slice_1StridedSlice'linear/linear/DenseToSparseTensor/Where7linear/linear/DenseToSparseTensor/strided_slice_1/stack9linear/linear/DenseToSparseTensor/strided_slice_1/stack_19linear/linear/DenseToSparseTensor/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
)linear/linear/DenseToSparseTensor/unstackUnpack&linear/linear/DenseToSparseTensor/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
'linear/linear/DenseToSparseTensor/stackPack+linear/linear/DenseToSparseTensor/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
%linear/linear/DenseToSparseTensor/MulMul1linear/linear/DenseToSparseTensor/strided_slice_1'linear/linear/DenseToSparseTensor/stack*
T0	*'
_output_shapes
:���������
�
7linear/linear/DenseToSparseTensor/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
%linear/linear/DenseToSparseTensor/SumSum%linear/linear/DenseToSparseTensor/Mul7linear/linear/DenseToSparseTensor/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
%linear/linear/DenseToSparseTensor/AddAdd/linear/linear/DenseToSparseTensor/strided_slice%linear/linear/DenseToSparseTensor/Sum*
T0	*#
_output_shapes
:���������
�
(linear/linear/DenseToSparseTensor/GatherGather)linear/linear/DenseToSparseTensor/Reshape%linear/linear/DenseToSparseTensor/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
�
linear/linear/lookupStringToHashBucketFast(linear/linear/DenseToSparseTensor/Gather*
num_buckets2*#
_output_shapes
:���������
�
,linear/make/weights/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:2*
valueB2*    *-
_class#
!loc:@linear/make/weights/part_0
�
linear/make/weights/part_0
VariableV2*
	container *-
_class#
!loc:@linear/make/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
!linear/make/weights/part_0/AssignAssignlinear/make/weights/part_0,linear/make/weights/part_0/Initializer/zeros*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
linear/make/weights/part_0/readIdentitylinear/make/weights/part_0*
T0*
_output_shapes

:2*-
_class#
!loc:@linear/make/weights/part_0
u
+linear/linear/make/make_weights/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 
t
*linear/linear/make/make_weights/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
%linear/linear/make/make_weights/SliceSlice&linear/linear/DenseToSparseTensor/Cast+linear/linear/make/make_weights/Slice/begin*linear/linear/make/make_weights/Slice/size*
T0	*
_output_shapes
:*
Index0
o
%linear/linear/make/make_weights/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
$linear/linear/make/make_weights/ProdProd%linear/linear/make/make_weights/Slice%linear/linear/make/make_weights/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
p
.linear/linear/make/make_weights/Gather/indicesConst*
dtype0*
_output_shapes
: *
value	B :
�
&linear/linear/make/make_weights/GatherGather&linear/linear/DenseToSparseTensor/Cast.linear/linear/make/make_weights/Gather/indices*
_output_shapes
: *
validate_indices(*
Tparams0	*
Tindices0
�
&linear/linear/make/make_weights/Cast/xPack$linear/linear/make/make_weights/Prod&linear/linear/make/make_weights/Gather*
T0	*
_output_shapes
:*
N*

axis 
�
-linear/linear/make/make_weights/SparseReshapeSparseReshape'linear/linear/DenseToSparseTensor/Where&linear/linear/DenseToSparseTensor/Cast&linear/linear/make/make_weights/Cast/x*-
_output_shapes
:���������:
�
6linear/linear/make/make_weights/SparseReshape/IdentityIdentitylinear/linear/lookup*
T0	*#
_output_shapes
:���������
p
.linear/linear/make/make_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
,linear/linear/make/make_weights/GreaterEqualGreaterEqual6linear/linear/make/make_weights/SparseReshape/Identity.linear/linear/make/make_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
%linear/linear/make/make_weights/WhereWhere,linear/linear/make/make_weights/GreaterEqual*'
_output_shapes
:���������
�
-linear/linear/make/make_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
'linear/linear/make/make_weights/ReshapeReshape%linear/linear/make/make_weights/Where-linear/linear/make/make_weights/Reshape/shape*
T0	*#
_output_shapes
:���������*
Tshape0
�
(linear/linear/make/make_weights/Gather_1Gather-linear/linear/make/make_weights/SparseReshape'linear/linear/make/make_weights/Reshape*'
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
(linear/linear/make/make_weights/Gather_2Gather6linear/linear/make/make_weights/SparseReshape/Identity'linear/linear/make/make_weights/Reshape*#
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
(linear/linear/make/make_weights/IdentityIdentity/linear/linear/make/make_weights/SparseReshape:1*
T0	*
_output_shapes
:
{
9linear/linear/make/make_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
Glinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/strided_sliceStridedSlice(linear/linear/make/make_weights/IdentityGlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stackIlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stack_1Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
8linear/linear/make/make_weights/SparseFillEmptyRows/CastCastAlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice*

SrcT0	*
_output_shapes
: *

DstT0
�
?linear/linear/make/make_weights/SparseFillEmptyRows/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
?linear/linear/make/make_weights/SparseFillEmptyRows/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
9linear/linear/make/make_weights/SparseFillEmptyRows/rangeRange?linear/linear/make/make_weights/SparseFillEmptyRows/range/start8linear/linear/make/make_weights/SparseFillEmptyRows/Cast?linear/linear/make/make_weights/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:���������
�
:linear/linear/make/make_weights/SparseFillEmptyRows/Cast_1Cast9linear/linear/make/make_weights/SparseFillEmptyRows/range*

SrcT0*#
_output_shapes
:���������*

DstT0	
�
Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
Clinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1StridedSlice(linear/linear/make/make_weights/Gather_1Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stackKlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stack_1Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
<linear/linear/make/make_weights/SparseFillEmptyRows/ListDiffListDiff:linear/linear/make/make_weights/SparseFillEmptyRows/Cast_1Clinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Clinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2StridedSlice(linear/linear/make/make_weights/IdentityIlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stackKlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stack_1Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Blinear/linear/make/make_weights/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
>linear/linear/make/make_weights/SparseFillEmptyRows/ExpandDims
ExpandDimsClinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2Blinear/linear/make/make_weights/SparseFillEmptyRows/ExpandDims/dim*
T0	*
_output_shapes
:*

Tdim0
�
Olinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
_output_shapes
: *
value	B
 Z
�
Olinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
_output_shapes
: *
value	B
 Z 
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDenseSparseToDense<linear/linear/make/make_weights/SparseFillEmptyRows/ListDiff>linear/linear/make/make_weights/SparseFillEmptyRows/ExpandDimsOlinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesOlinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/default_value*
T0
*#
_output_shapes
:���������*
validate_indices(*
Tindices0	
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
;linear/linear/make/make_weights/SparseFillEmptyRows/ReshapeReshape<linear/linear/make/make_weights/SparseFillEmptyRows/ListDiffAlinear/linear/make/make_weights/SparseFillEmptyRows/Reshape/shape*
T0	*'
_output_shapes
:���������*
Tshape0
�
>linear/linear/make/make_weights/SparseFillEmptyRows/zeros_like	ZerosLike;linear/linear/make/make_weights/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:���������
�
?linear/linear/make/make_weights/SparseFillEmptyRows/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
�
:linear/linear/make/make_weights/SparseFillEmptyRows/concatConcatV2;linear/linear/make/make_weights/SparseFillEmptyRows/Reshape>linear/linear/make/make_weights/SparseFillEmptyRows/zeros_like?linear/linear/make/make_weights/SparseFillEmptyRows/concat/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
9linear/linear/make/make_weights/SparseFillEmptyRows/ShapeShape<linear/linear/make/make_weights/SparseFillEmptyRows/ListDiff*
T0	*
out_type0*
_output_shapes
:
�
8linear/linear/make/make_weights/SparseFillEmptyRows/FillFill9linear/linear/make/make_weights/SparseFillEmptyRows/Shape9linear/linear/make/make_weights/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:���������
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
<linear/linear/make/make_weights/SparseFillEmptyRows/concat_1ConcatV2(linear/linear/make/make_weights/Gather_1:linear/linear/make/make_weights/SparseFillEmptyRows/concatAlinear/linear/make/make_weights/SparseFillEmptyRows/concat_1/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
<linear/linear/make/make_weights/SparseFillEmptyRows/concat_2ConcatV2(linear/linear/make/make_weights/Gather_28linear/linear/make/make_weights/SparseFillEmptyRows/FillAlinear/linear/make/make_weights/SparseFillEmptyRows/concat_2/axis*

Tidx0*
T0	*#
_output_shapes
:���������*
N
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/SparseReorderSparseReorder<linear/linear/make/make_weights/SparseFillEmptyRows/concat_1<linear/linear/make/make_weights/SparseFillEmptyRows/concat_2(linear/linear/make/make_weights/Identity*
T0	*6
_output_shapes$
":���������:���������
�
<linear/linear/make/make_weights/SparseFillEmptyRows/IdentityIdentity(linear/linear/make/make_weights/Identity*
T0	*
_output_shapes
:
�
Klinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
Mlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
Mlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
Elinear/linear/make/make_weights/embedding_lookup_sparse/strided_sliceStridedSliceAlinear/linear/make/make_weights/SparseFillEmptyRows/SparseReorderKlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stackMlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stack_1Mlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
<linear/linear/make/make_weights/embedding_lookup_sparse/CastCastElinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:���������*

DstT0
�
>linear/linear/make/make_weights/embedding_lookup_sparse/UniqueUniqueClinear/linear/make/make_weights/SparseFillEmptyRows/SparseReorder:1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
Hlinear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookupGatherlinear/make/weights/part_0/read>linear/linear/make/make_weights/embedding_lookup_sparse/Unique*'
_output_shapes
:���������*
validate_indices(*
Tparams0*-
_class#
!loc:@linear/make/weights/part_0*
Tindices0	
�
7linear/linear/make/make_weights/embedding_lookup_sparseSparseSegmentSumHlinear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup@linear/linear/make/make_weights/embedding_lookup_sparse/Unique:1<linear/linear/make/make_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:���������
�
/linear/linear/make/make_weights/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
)linear/linear/make/make_weights/Reshape_1ReshapeAlinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/linear/linear/make/make_weights/Reshape_1/shape*
T0
*'
_output_shapes
:���������*
Tshape0
�
%linear/linear/make/make_weights/ShapeShape7linear/linear/make/make_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
}
3linear/linear/make/make_weights/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:

5linear/linear/make/make_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:

5linear/linear/make/make_weights/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
-linear/linear/make/make_weights/strided_sliceStridedSlice%linear/linear/make/make_weights/Shape3linear/linear/make/make_weights/strided_slice/stack5linear/linear/make/make_weights/strided_slice/stack_15linear/linear/make/make_weights/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
i
'linear/linear/make/make_weights/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
�
%linear/linear/make/make_weights/stackPack'linear/linear/make/make_weights/stack/0-linear/linear/make/make_weights/strided_slice*
T0*
_output_shapes
:*
N*

axis 
�
$linear/linear/make/make_weights/TileTile)linear/linear/make/make_weights/Reshape_1%linear/linear/make/make_weights/stack*
T0
*0
_output_shapes
:������������������*

Tmultiples0
�
*linear/linear/make/make_weights/zeros_like	ZerosLike7linear/linear/make/make_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
linear/linear/make/make_weightsSelect$linear/linear/make/make_weights/Tile*linear/linear/make/make_weights/zeros_like7linear/linear/make/make_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
&linear/linear/make/make_weights/Cast_1Cast&linear/linear/DenseToSparseTensor/Cast*

SrcT0	*
_output_shapes
:*

DstT0
w
-linear/linear/make/make_weights/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 
v
,linear/linear/make/make_weights/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
'linear/linear/make/make_weights/Slice_1Slice&linear/linear/make/make_weights/Cast_1-linear/linear/make/make_weights/Slice_1/begin,linear/linear/make/make_weights/Slice_1/size*
T0*
_output_shapes
:*
Index0
�
'linear/linear/make/make_weights/Shape_1Shapelinear/linear/make/make_weights*
T0*
out_type0*
_output_shapes
:
w
-linear/linear/make/make_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:

,linear/linear/make/make_weights/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
'linear/linear/make/make_weights/Slice_2Slice'linear/linear/make/make_weights/Shape_1-linear/linear/make/make_weights/Slice_2/begin,linear/linear/make/make_weights/Slice_2/size*
T0*
_output_shapes
:*
Index0
m
+linear/linear/make/make_weights/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
&linear/linear/make/make_weights/concatConcatV2'linear/linear/make/make_weights/Slice_1'linear/linear/make/make_weights/Slice_2+linear/linear/make/make_weights/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
)linear/linear/make/make_weights/Reshape_2Reshapelinear/linear/make/make_weights&linear/linear/make/make_weights/concat*
T0*'
_output_shapes
:���������*
Tshape0
n
linear/linear/Reshape_4/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_4Reshape)linear/linear/make/make_weights/Reshape_2linear/linear/Reshape_4/shape*
T0*'
_output_shapes
:���������*
Tshape0
j
linear/linear/expand_dims_1/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/expand_dims_1
ExpandDims"random_shuffle_queue_DequeueMany:2linear/linear/expand_dims_1/dim*
T0*
_output_shapes

:@*

Tdim0
z
)linear/linear/DenseToSparseTensor_1/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
(linear/linear/DenseToSparseTensor_1/CastCast)linear/linear/DenseToSparseTensor_1/Shape*

SrcT0*
_output_shapes
:*

DstT0	
m
,linear/linear/DenseToSparseTensor_1/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
,linear/linear/DenseToSparseTensor_1/NotEqualNotEquallinear/linear/expand_dims_1,linear/linear/DenseToSparseTensor_1/Cast_1/x*
T0*
_output_shapes

:@
�
)linear/linear/DenseToSparseTensor_1/WhereWhere,linear/linear/DenseToSparseTensor_1/NotEqual*'
_output_shapes
:���������
�
1linear/linear/DenseToSparseTensor_1/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
+linear/linear/DenseToSparseTensor_1/ReshapeReshapelinear/linear/expand_dims_11linear/linear/DenseToSparseTensor_1/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
7linear/linear/DenseToSparseTensor_1/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor_1/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor_1/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
1linear/linear/DenseToSparseTensor_1/strided_sliceStridedSlice)linear/linear/DenseToSparseTensor_1/Where7linear/linear/DenseToSparseTensor_1/strided_slice/stack9linear/linear/DenseToSparseTensor_1/strided_slice/stack_19linear/linear/DenseToSparseTensor_1/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
9linear/linear/DenseToSparseTensor_1/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
;linear/linear/DenseToSparseTensor_1/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
;linear/linear/DenseToSparseTensor_1/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
3linear/linear/DenseToSparseTensor_1/strided_slice_1StridedSlice)linear/linear/DenseToSparseTensor_1/Where9linear/linear/DenseToSparseTensor_1/strided_slice_1/stack;linear/linear/DenseToSparseTensor_1/strided_slice_1/stack_1;linear/linear/DenseToSparseTensor_1/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
+linear/linear/DenseToSparseTensor_1/unstackUnpack(linear/linear/DenseToSparseTensor_1/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
)linear/linear/DenseToSparseTensor_1/stackPack-linear/linear/DenseToSparseTensor_1/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
'linear/linear/DenseToSparseTensor_1/MulMul3linear/linear/DenseToSparseTensor_1/strided_slice_1)linear/linear/DenseToSparseTensor_1/stack*
T0	*'
_output_shapes
:���������
�
9linear/linear/DenseToSparseTensor_1/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
'linear/linear/DenseToSparseTensor_1/SumSum'linear/linear/DenseToSparseTensor_1/Mul9linear/linear/DenseToSparseTensor_1/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
'linear/linear/DenseToSparseTensor_1/AddAdd1linear/linear/DenseToSparseTensor_1/strided_slice'linear/linear/DenseToSparseTensor_1/Sum*
T0	*#
_output_shapes
:���������
�
*linear/linear/DenseToSparseTensor_1/GatherGather+linear/linear/DenseToSparseTensor_1/Reshape'linear/linear/DenseToSparseTensor_1/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
�
linear/linear/lookup_1/ConstConst*
dtype0*
_output_shapes
:*?
value6B4BeightBfiveBfourBsixBthreeBtwelveBtwo
]
linear/linear/lookup_1/SizeConst*
dtype0*
_output_shapes
: *
value	B :
d
"linear/linear/lookup_1/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
d
"linear/linear/lookup_1/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
linear/linear/lookup_1/rangeRange"linear/linear/lookup_1/range/startlinear/linear/lookup_1/Size"linear/linear/lookup_1/range/delta*

Tidx0*
_output_shapes
:
x
linear/linear/lookup_1/ToInt64Castlinear/linear/lookup_1/range*

SrcT0*
_output_shapes
:*

DstT0	
�
!linear/linear/lookup_1/hash_table	HashTable*
	container *
	key_dtype0*
use_node_name_sharing( *
_output_shapes
:*
shared_name *
value_dtype0	
r
'linear/linear/lookup_1/hash_table/ConstConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
,linear/linear/lookup_1/hash_table/table_initInitializeTable!linear/linear/lookup_1/hash_tablelinear/linear/lookup_1/Constlinear/linear/lookup_1/ToInt64*

Tval0	*

Tkey0*4
_class*
(&loc:@linear/linear/lookup_1/hash_table
�
linear/linear/hash_table_LookupLookupTableFind!linear/linear/lookup_1/hash_table*linear/linear/DenseToSparseTensor_1/Gather'linear/linear/lookup_1/hash_table/Const*#
_output_shapes
:���������*

Tout0	*	
Tin0*4
_class*
(&loc:@linear/linear/lookup_1/hash_table
�
8linear/num-of-cylinders/weights/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
&linear/num-of-cylinders/weights/part_0
VariableV2*
	container *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
-linear/num-of-cylinders/weights/part_0/AssignAssign&linear/num-of-cylinders/weights/part_08linear/num-of-cylinders/weights/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
+linear/num-of-cylinders/weights/part_0/readIdentity&linear/num-of-cylinders/weights/part_0*
T0*
_output_shapes

:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Clinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 
�
Blinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/SliceSlice(linear/linear/DenseToSparseTensor_1/CastClinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice/beginBlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice/size*
T0	*
_output_shapes
:*
Index0
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
<linear/linear/num-of-cylinders/num-of-cylinders_weights/ProdProd=linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice=linear/linear/num-of-cylinders/num-of-cylinders_weights/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
�
Flinear/linear/num-of-cylinders/num-of-cylinders_weights/Gather/indicesConst*
dtype0*
_output_shapes
: *
value	B :
�
>linear/linear/num-of-cylinders/num-of-cylinders_weights/GatherGather(linear/linear/DenseToSparseTensor_1/CastFlinear/linear/num-of-cylinders/num-of-cylinders_weights/Gather/indices*
_output_shapes
: *
validate_indices(*
Tparams0	*
Tindices0
�
>linear/linear/num-of-cylinders/num-of-cylinders_weights/Cast/xPack<linear/linear/num-of-cylinders/num-of-cylinders_weights/Prod>linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather*
T0	*
_output_shapes
:*
N*

axis 
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshapeSparseReshape)linear/linear/DenseToSparseTensor_1/Where(linear/linear/DenseToSparseTensor_1/Cast>linear/linear/num-of-cylinders/num-of-cylinders_weights/Cast/x*-
_output_shapes
:���������:
�
Nlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape/IdentityIdentitylinear/linear/hash_table_Lookup*
T0	*#
_output_shapes
:���������
�
Flinear/linear/num-of-cylinders/num-of-cylinders_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
Dlinear/linear/num-of-cylinders/num-of-cylinders_weights/GreaterEqualGreaterEqualNlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape/IdentityFlinear/linear/num-of-cylinders/num-of-cylinders_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/WhereWhereDlinear/linear/num-of-cylinders/num-of-cylinders_weights/GreaterEqual*'
_output_shapes
:���������
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/ReshapeReshape=linear/linear/num-of-cylinders/num-of-cylinders_weights/WhereElinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape/shape*
T0	*#
_output_shapes
:���������*
Tshape0
�
@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_1GatherElinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape?linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape*'
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_2GatherNlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape/Identity?linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape*#
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
@linear/linear/num-of-cylinders/num-of-cylinders_weights/IdentityIdentityGlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape:1*
T0	*
_output_shapes
:
�
Qlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
_linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_sliceStridedSlice@linear/linear/num-of-cylinders/num-of-cylinders_weights/Identity_linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stackalinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stack_1alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Plinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/CastCastYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice*

SrcT0	*
_output_shapes
: *

DstT0
�
Wlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
Wlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
Qlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/rangeRangeWlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range/startPlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/CastWlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:���������
�
Rlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Cast_1CastQlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range*

SrcT0*#
_output_shapes
:���������*

DstT0	
�
alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1StridedSlice@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_1alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stackclinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stack_1clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ListDiffListDiffRlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Cast_1[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2StridedSlice@linear/linear/num-of-cylinders/num-of-cylinders_weights/Identityalinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stackclinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stack_1clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Zlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Vlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ExpandDims
ExpandDims[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2Zlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ExpandDims/dim*
T0	*
_output_shapes
:*

Tdim0
�
glinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
_output_shapes
: *
value	B
 Z
�
glinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
_output_shapes
: *
value	B
 Z 
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDenseSparseToDenseTlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ListDiffVlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ExpandDimsglinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesglinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDense/default_value*
T0
*#
_output_shapes
:���������*
validate_indices(*
Tindices0	
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
Slinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ReshapeReshapeTlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ListDiffYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Reshape/shape*
T0	*'
_output_shapes
:���������*
Tshape0
�
Vlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/zeros_like	ZerosLikeSlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:���������
�
Wlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
�
Rlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concatConcatV2Slinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ReshapeVlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/zeros_likeWlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Qlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ShapeShapeTlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ListDiff*
T0	*
out_type0*
_output_shapes
:
�
Plinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/FillFillQlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ShapeQlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:���������
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_1ConcatV2@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_1Rlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concatYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_1/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_2ConcatV2@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_2Plinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/FillYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_2/axis*

Tidx0*
T0	*#
_output_shapes
:���������*
N
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseReorderSparseReorderTlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_1Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_2@linear/linear/num-of-cylinders/num-of-cylinders_weights/Identity*
T0	*6
_output_shapes$
":���������:���������
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/IdentityIdentity@linear/linear/num-of-cylinders/num-of-cylinders_weights/Identity*
T0	*
_output_shapes
:
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
elinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
elinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
]linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_sliceStridedSliceYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseReorderclinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stackelinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stack_1elinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/CastCast]linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:���������*

DstT0
�
Vlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/UniqueUnique[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseReorder:1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
`linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookupGather+linear/num-of-cylinders/weights/part_0/readVlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique*'
_output_shapes
:���������*
validate_indices(*
Tparams0*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
Tindices0	
�
Olinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparseSparseSegmentSum`linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookupXlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique:1Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:���������
�
Glinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
Alinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_1ReshapeYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDenseGlinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_1/shape*
T0
*'
_output_shapes
:���������*
Tshape0
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/ShapeShapeOlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
�
Klinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
Mlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Mlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_sliceStridedSlice=linear/linear/num-of-cylinders/num-of-cylinders_weights/ShapeKlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stackMlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stack_1Mlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/stackPack?linear/linear/num-of-cylinders/num-of-cylinders_weights/stack/0Elinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice*
T0*
_output_shapes
:*
N*

axis 
�
<linear/linear/num-of-cylinders/num-of-cylinders_weights/TileTileAlinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_1=linear/linear/num-of-cylinders/num-of-cylinders_weights/stack*
T0
*0
_output_shapes
:������������������*

Tmultiples0
�
Blinear/linear/num-of-cylinders/num-of-cylinders_weights/zeros_like	ZerosLikeOlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
7linear/linear/num-of-cylinders/num-of-cylinders_weightsSelect<linear/linear/num-of-cylinders/num-of-cylinders_weights/TileBlinear/linear/num-of-cylinders/num-of-cylinders_weights/zeros_likeOlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
>linear/linear/num-of-cylinders/num-of-cylinders_weights/Cast_1Cast(linear/linear/DenseToSparseTensor_1/Cast*

SrcT0	*
_output_shapes
:*

DstT0
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 
�
Dlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1Slice>linear/linear/num-of-cylinders/num-of-cylinders_weights/Cast_1Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1/beginDlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1/size*
T0*
_output_shapes
:*
Index0
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/Shape_1Shape7linear/linear/num-of-cylinders/num-of-cylinders_weights*
T0*
out_type0*
_output_shapes
:
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
�
Dlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2Slice?linear/linear/num-of-cylinders/num-of-cylinders_weights/Shape_1Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2/beginDlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2/size*
T0*
_output_shapes
:*
Index0
�
Clinear/linear/num-of-cylinders/num-of-cylinders_weights/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
>linear/linear/num-of-cylinders/num-of-cylinders_weights/concatConcatV2?linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1?linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2Clinear/linear/num-of-cylinders/num-of-cylinders_weights/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
Alinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2Reshape7linear/linear/num-of-cylinders/num-of-cylinders_weights>linear/linear/num-of-cylinders/num-of-cylinders_weights/concat*
T0*'
_output_shapes
:���������*
Tshape0
n
linear/linear/Reshape_5/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_5ReshapeAlinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2linear/linear/Reshape_5/shape*
T0*'
_output_shapes
:���������*
Tshape0
j
linear/linear/expand_dims_2/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/expand_dims_2
ExpandDims"random_shuffle_queue_DequeueMany:1linear/linear/expand_dims_2/dim*
T0*
_output_shapes

:@*

Tdim0
z
)linear/linear/DenseToSparseTensor_2/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
(linear/linear/DenseToSparseTensor_2/CastCast)linear/linear/DenseToSparseTensor_2/Shape*

SrcT0*
_output_shapes
:*

DstT0	
m
,linear/linear/DenseToSparseTensor_2/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
,linear/linear/DenseToSparseTensor_2/NotEqualNotEquallinear/linear/expand_dims_2,linear/linear/DenseToSparseTensor_2/Cast_1/x*
T0*
_output_shapes

:@
�
)linear/linear/DenseToSparseTensor_2/WhereWhere,linear/linear/DenseToSparseTensor_2/NotEqual*'
_output_shapes
:���������
�
1linear/linear/DenseToSparseTensor_2/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
+linear/linear/DenseToSparseTensor_2/ReshapeReshapelinear/linear/expand_dims_21linear/linear/DenseToSparseTensor_2/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
7linear/linear/DenseToSparseTensor_2/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor_2/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor_2/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
1linear/linear/DenseToSparseTensor_2/strided_sliceStridedSlice)linear/linear/DenseToSparseTensor_2/Where7linear/linear/DenseToSparseTensor_2/strided_slice/stack9linear/linear/DenseToSparseTensor_2/strided_slice/stack_19linear/linear/DenseToSparseTensor_2/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
9linear/linear/DenseToSparseTensor_2/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
;linear/linear/DenseToSparseTensor_2/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
;linear/linear/DenseToSparseTensor_2/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
3linear/linear/DenseToSparseTensor_2/strided_slice_1StridedSlice)linear/linear/DenseToSparseTensor_2/Where9linear/linear/DenseToSparseTensor_2/strided_slice_1/stack;linear/linear/DenseToSparseTensor_2/strided_slice_1/stack_1;linear/linear/DenseToSparseTensor_2/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
+linear/linear/DenseToSparseTensor_2/unstackUnpack(linear/linear/DenseToSparseTensor_2/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
)linear/linear/DenseToSparseTensor_2/stackPack-linear/linear/DenseToSparseTensor_2/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
'linear/linear/DenseToSparseTensor_2/MulMul3linear/linear/DenseToSparseTensor_2/strided_slice_1)linear/linear/DenseToSparseTensor_2/stack*
T0	*'
_output_shapes
:���������
�
9linear/linear/DenseToSparseTensor_2/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
'linear/linear/DenseToSparseTensor_2/SumSum'linear/linear/DenseToSparseTensor_2/Mul9linear/linear/DenseToSparseTensor_2/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
'linear/linear/DenseToSparseTensor_2/AddAdd1linear/linear/DenseToSparseTensor_2/strided_slice'linear/linear/DenseToSparseTensor_2/Sum*
T0	*#
_output_shapes
:���������
�
*linear/linear/DenseToSparseTensor_2/GatherGather+linear/linear/DenseToSparseTensor_2/Reshape'linear/linear/DenseToSparseTensor_2/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
n
linear/linear/lookup_2/ConstConst*
dtype0*
_output_shapes
:*
valueBBtwoBfour
]
linear/linear/lookup_2/SizeConst*
dtype0*
_output_shapes
: *
value	B :
d
"linear/linear/lookup_2/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
d
"linear/linear/lookup_2/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
linear/linear/lookup_2/rangeRange"linear/linear/lookup_2/range/startlinear/linear/lookup_2/Size"linear/linear/lookup_2/range/delta*

Tidx0*
_output_shapes
:
x
linear/linear/lookup_2/ToInt64Castlinear/linear/lookup_2/range*

SrcT0*
_output_shapes
:*

DstT0	
�
!linear/linear/lookup_2/hash_table	HashTable*
	container *
	key_dtype0*
use_node_name_sharing( *
_output_shapes
:*
shared_name *
value_dtype0	
r
'linear/linear/lookup_2/hash_table/ConstConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
,linear/linear/lookup_2/hash_table/table_initInitializeTable!linear/linear/lookup_2/hash_tablelinear/linear/lookup_2/Constlinear/linear/lookup_2/ToInt64*

Tval0	*

Tkey0*4
_class*
(&loc:@linear/linear/lookup_2/hash_table
�
!linear/linear/hash_table_Lookup_1LookupTableFind!linear/linear/lookup_2/hash_table*linear/linear/DenseToSparseTensor_2/Gather'linear/linear/lookup_2/hash_table/Const*#
_output_shapes
:���������*

Tout0	*	
Tin0*4
_class*
(&loc:@linear/linear/lookup_2/hash_table
�
4linear/num-of-doors/weights/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
"linear/num-of-doors/weights/part_0
VariableV2*
	container *5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
)linear/num-of-doors/weights/part_0/AssignAssign"linear/num-of-doors/weights/part_04linear/num-of-doors/weights/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
'linear/num-of-doors/weights/part_0/readIdentity"linear/num-of-doors/weights/part_0*
T0*
_output_shapes

:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
;linear/linear/num-of-doors/num-of-doors_weights/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 
�
:linear/linear/num-of-doors/num-of-doors_weights/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
5linear/linear/num-of-doors/num-of-doors_weights/SliceSlice(linear/linear/DenseToSparseTensor_2/Cast;linear/linear/num-of-doors/num-of-doors_weights/Slice/begin:linear/linear/num-of-doors/num-of-doors_weights/Slice/size*
T0	*
_output_shapes
:*
Index0

5linear/linear/num-of-doors/num-of-doors_weights/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
4linear/linear/num-of-doors/num-of-doors_weights/ProdProd5linear/linear/num-of-doors/num-of-doors_weights/Slice5linear/linear/num-of-doors/num-of-doors_weights/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
�
>linear/linear/num-of-doors/num-of-doors_weights/Gather/indicesConst*
dtype0*
_output_shapes
: *
value	B :
�
6linear/linear/num-of-doors/num-of-doors_weights/GatherGather(linear/linear/DenseToSparseTensor_2/Cast>linear/linear/num-of-doors/num-of-doors_weights/Gather/indices*
_output_shapes
: *
validate_indices(*
Tparams0	*
Tindices0
�
6linear/linear/num-of-doors/num-of-doors_weights/Cast/xPack4linear/linear/num-of-doors/num-of-doors_weights/Prod6linear/linear/num-of-doors/num-of-doors_weights/Gather*
T0	*
_output_shapes
:*
N*

axis 
�
=linear/linear/num-of-doors/num-of-doors_weights/SparseReshapeSparseReshape)linear/linear/DenseToSparseTensor_2/Where(linear/linear/DenseToSparseTensor_2/Cast6linear/linear/num-of-doors/num-of-doors_weights/Cast/x*-
_output_shapes
:���������:
�
Flinear/linear/num-of-doors/num-of-doors_weights/SparseReshape/IdentityIdentity!linear/linear/hash_table_Lookup_1*
T0	*#
_output_shapes
:���������
�
>linear/linear/num-of-doors/num-of-doors_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
<linear/linear/num-of-doors/num-of-doors_weights/GreaterEqualGreaterEqualFlinear/linear/num-of-doors/num-of-doors_weights/SparseReshape/Identity>linear/linear/num-of-doors/num-of-doors_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
5linear/linear/num-of-doors/num-of-doors_weights/WhereWhere<linear/linear/num-of-doors/num-of-doors_weights/GreaterEqual*'
_output_shapes
:���������
�
=linear/linear/num-of-doors/num-of-doors_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
7linear/linear/num-of-doors/num-of-doors_weights/ReshapeReshape5linear/linear/num-of-doors/num-of-doors_weights/Where=linear/linear/num-of-doors/num-of-doors_weights/Reshape/shape*
T0	*#
_output_shapes
:���������*
Tshape0
�
8linear/linear/num-of-doors/num-of-doors_weights/Gather_1Gather=linear/linear/num-of-doors/num-of-doors_weights/SparseReshape7linear/linear/num-of-doors/num-of-doors_weights/Reshape*'
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
8linear/linear/num-of-doors/num-of-doors_weights/Gather_2GatherFlinear/linear/num-of-doors/num-of-doors_weights/SparseReshape/Identity7linear/linear/num-of-doors/num-of-doors_weights/Reshape*#
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
8linear/linear/num-of-doors/num-of-doors_weights/IdentityIdentity?linear/linear/num-of-doors/num-of-doors_weights/SparseReshape:1*
T0	*
_output_shapes
:
�
Ilinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
Wlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_sliceStridedSlice8linear/linear/num-of-doors/num-of-doors_weights/IdentityWlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stackYlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stack_1Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Hlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/CastCastQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice*

SrcT0	*
_output_shapes
: *

DstT0
�
Olinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
Olinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
Ilinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/rangeRangeOlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range/startHlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/CastOlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:���������
�
Jlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Cast_1CastIlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range*

SrcT0*#
_output_shapes
:���������*

DstT0	
�
Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
Slinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1StridedSlice8linear/linear/num-of-doors/num-of-doors_weights/Gather_1Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack_1[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ListDiffListDiffJlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Cast_1Slinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Slinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2StridedSlice8linear/linear/num-of-doors/num-of-doors_weights/IdentityYlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack_1[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Rlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Nlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ExpandDims
ExpandDimsSlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2Rlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ExpandDims/dim*
T0	*
_output_shapes
:*

Tdim0
�
_linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
_output_shapes
: *
value	B
 Z
�
_linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
_output_shapes
: *
value	B
 Z 
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDenseSparseToDenseLlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ListDiffNlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ExpandDims_linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense/sparse_values_linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense/default_value*
T0
*#
_output_shapes
:���������*
validate_indices(*
Tindices0	
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
Klinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ReshapeReshapeLlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ListDiffQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Reshape/shape*
T0	*'
_output_shapes
:���������*
Tshape0
�
Nlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/zeros_like	ZerosLikeKlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:���������
�
Olinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
�
Jlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concatConcatV2Klinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ReshapeNlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/zeros_likeOlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Ilinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ShapeShapeLlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ListDiff*
T0	*
out_type0*
_output_shapes
:
�
Hlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/FillFillIlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ShapeIlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:���������
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_1ConcatV28linear/linear/num-of-doors/num-of-doors_weights/Gather_1Jlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concatQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_1/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_2ConcatV28linear/linear/num-of-doors/num-of-doors_weights/Gather_2Hlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/FillQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_2/axis*

Tidx0*
T0	*#
_output_shapes
:���������*
N
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseReorderSparseReorderLlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_1Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_28linear/linear/num-of-doors/num-of-doors_weights/Identity*
T0	*6
_output_shapes$
":���������:���������
�
Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/IdentityIdentity8linear/linear/num-of-doors/num-of-doors_weights/Identity*
T0	*
_output_shapes
:
�
[linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
]linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
]linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
Ulinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_sliceStridedSliceQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseReorder[linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack]linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack_1]linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
Llinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/CastCastUlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:���������*

DstT0
�
Nlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/UniqueUniqueSlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseReorder:1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
Xlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookupGather'linear/num-of-doors/weights/part_0/readNlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique*'
_output_shapes
:���������*
validate_indices(*
Tparams0*5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
Tindices0	
�
Glinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparseSparseSegmentSumXlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookupPlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique:1Llinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:���������
�
?linear/linear/num-of-doors/num-of-doors_weights/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
9linear/linear/num-of-doors/num-of-doors_weights/Reshape_1ReshapeQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense?linear/linear/num-of-doors/num-of-doors_weights/Reshape_1/shape*
T0
*'
_output_shapes
:���������*
Tshape0
�
5linear/linear/num-of-doors/num-of-doors_weights/ShapeShapeGlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
�
Clinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
Elinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Elinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
=linear/linear/num-of-doors/num-of-doors_weights/strided_sliceStridedSlice5linear/linear/num-of-doors/num-of-doors_weights/ShapeClinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stackElinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stack_1Elinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
y
7linear/linear/num-of-doors/num-of-doors_weights/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
�
5linear/linear/num-of-doors/num-of-doors_weights/stackPack7linear/linear/num-of-doors/num-of-doors_weights/stack/0=linear/linear/num-of-doors/num-of-doors_weights/strided_slice*
T0*
_output_shapes
:*
N*

axis 
�
4linear/linear/num-of-doors/num-of-doors_weights/TileTile9linear/linear/num-of-doors/num-of-doors_weights/Reshape_15linear/linear/num-of-doors/num-of-doors_weights/stack*
T0
*0
_output_shapes
:������������������*

Tmultiples0
�
:linear/linear/num-of-doors/num-of-doors_weights/zeros_like	ZerosLikeGlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
/linear/linear/num-of-doors/num-of-doors_weightsSelect4linear/linear/num-of-doors/num-of-doors_weights/Tile:linear/linear/num-of-doors/num-of-doors_weights/zeros_likeGlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
6linear/linear/num-of-doors/num-of-doors_weights/Cast_1Cast(linear/linear/DenseToSparseTensor_2/Cast*

SrcT0	*
_output_shapes
:*

DstT0
�
=linear/linear/num-of-doors/num-of-doors_weights/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 
�
<linear/linear/num-of-doors/num-of-doors_weights/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
7linear/linear/num-of-doors/num-of-doors_weights/Slice_1Slice6linear/linear/num-of-doors/num-of-doors_weights/Cast_1=linear/linear/num-of-doors/num-of-doors_weights/Slice_1/begin<linear/linear/num-of-doors/num-of-doors_weights/Slice_1/size*
T0*
_output_shapes
:*
Index0
�
7linear/linear/num-of-doors/num-of-doors_weights/Shape_1Shape/linear/linear/num-of-doors/num-of-doors_weights*
T0*
out_type0*
_output_shapes
:
�
=linear/linear/num-of-doors/num-of-doors_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
�
<linear/linear/num-of-doors/num-of-doors_weights/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
7linear/linear/num-of-doors/num-of-doors_weights/Slice_2Slice7linear/linear/num-of-doors/num-of-doors_weights/Shape_1=linear/linear/num-of-doors/num-of-doors_weights/Slice_2/begin<linear/linear/num-of-doors/num-of-doors_weights/Slice_2/size*
T0*
_output_shapes
:*
Index0
}
;linear/linear/num-of-doors/num-of-doors_weights/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
6linear/linear/num-of-doors/num-of-doors_weights/concatConcatV27linear/linear/num-of-doors/num-of-doors_weights/Slice_17linear/linear/num-of-doors/num-of-doors_weights/Slice_2;linear/linear/num-of-doors/num-of-doors_weights/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
9linear/linear/num-of-doors/num-of-doors_weights/Reshape_2Reshape/linear/linear/num-of-doors/num-of-doors_weights6linear/linear/num-of-doors/num-of-doors_weights/concat*
T0*'
_output_shapes
:���������*
Tshape0
n
linear/linear/Reshape_6/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_6Reshape9linear/linear/num-of-doors/num-of-doors_weights/Reshape_2linear/linear/Reshape_6/shape*
T0*'
_output_shapes
:���������*
Tshape0
�
linear/linear/AddNAddNlinear/linear/Reshapelinear/linear/Reshape_1linear/linear/Reshape_2linear/linear/Reshape_3linear/linear/Reshape_4linear/linear/Reshape_5linear/linear/Reshape_6*
T0*
_output_shapes

:@*
N
�
+linear/bias_weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *,
_class"
 loc:@linear/bias_weight/part_0
�
linear/bias_weight/part_0
VariableV2*
	container *,
_class"
 loc:@linear/bias_weight/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
 linear/bias_weight/part_0/AssignAssignlinear/bias_weight/part_0+linear/bias_weight/part_0/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
�
linear/bias_weight/part_0/readIdentitylinear/bias_weight/part_0*
T0*
_output_shapes
:*,
_class"
 loc:@linear/bias_weight/part_0
c
linear/bias_weightIdentitylinear/bias_weight/part_0/read*
T0*
_output_shapes
:
�
linear/linear/BiasAddBiasAddlinear/linear/AddNlinear/bias_weight*
T0*
_output_shapes

:@*
data_formatNHWC
�
)linear/regression_head/predictions/scoresSqueezelinear/linear/BiasAdd*
T0*
_output_shapes
:@*
squeeze_dims

�
+linear/regression_head/predictions/IdentityIdentity)linear/regression_head/predictions/scores*
T0*
_output_shapes
:@
�
7linear/regression_head/mean_squared_loss/ExpandDims/dimConst*
dtype0*
_output_shapes
:*
valueB:
�
3linear/regression_head/mean_squared_loss/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:87linear/regression_head/mean_squared_loss/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
,linear/regression_head/mean_squared_loss/subSublinear/linear/BiasAdd3linear/regression_head/mean_squared_loss/ExpandDims*
T0*
_output_shapes

:@
�
(linear/regression_head/mean_squared_lossSquare,linear/regression_head/mean_squared_loss/sub*
T0*
_output_shapes

:@
�
3linear/regression_head/mean_squared_loss/loss/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
-linear/regression_head/mean_squared_loss/lossMean(linear/regression_head/mean_squared_loss3linear/regression_head/mean_squared_loss/loss/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
n
)linear/regression_head/ScalarSummary/tagsConst*
dtype0*
_output_shapes
: *
valueB
 Bloss
�
$linear/regression_head/ScalarSummaryScalarSummary)linear/regression_head/ScalarSummary/tags-linear/regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: 
m
linear/regression_head/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
t
*linear/regression_head/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
v
,linear/regression_head/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
v
,linear/regression_head/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
$linear/regression_head/strided_sliceStridedSlicelinear/regression_head/Shape*linear/regression_head/strided_slice/stack,linear/regression_head/strided_slice/stack_1,linear/regression_head/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
r
/linear/regression_head/train_op/gradients/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
t
/linear/regression_head/train_op/gradients/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
.linear/regression_head/train_op/gradients/FillFill/linear/regression_head/train_op/gradients/Shape/linear/regression_head/train_op/gradients/Const*
T0*
_output_shapes
: 
�
jlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"      
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/ReshapeReshape.linear/regression_head/train_op/gradients/Filljlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Reshape/shape*
T0*
_output_shapes

:*
Tshape0
�
klinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Tile/multiplesConst*
dtype0*
_output_shapes
:*
valueB"@      
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/TileTiledlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Reshapeklinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Tile/multiples*
T0*
_output_shapes

:@*

Tmultiples0
�
blinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Shape_1Const*
dtype0*
_output_shapes
: *
valueB 
�
blinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/ProdProdblinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Shapeblinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
clinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Prod_1Proddlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Shape_1dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Const_1*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
flinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Maximum/yConst*
dtype0*
_output_shapes
: *
value	B :
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/MaximumMaximumclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Prod_1flinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Maximum/y*
T0*
_output_shapes
: 
�
elinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/floordivFloorDivalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Proddlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Maximum*
T0*
_output_shapes
: 
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/CastCastelinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/truedivRealDivalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Tilealinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Cast*
T0*
_output_shapes

:@
�
]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul/xConste^linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/truediv*
dtype0*
_output_shapes
: *
valueB
 *   @
�
[linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mulMul]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul/x,linear/regression_head/mean_squared_loss/sub*
T0*
_output_shapes

:@
�
]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul_1Muldlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/truediv[linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul*
T0*
_output_shapes

:@
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
clinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB"@      
�
qlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgsBroadcastGradientArgsalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
_linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/SumSum]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul_1qlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgs*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
�
clinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeReshape_linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Sumalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Sum_1Sum]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul_1slinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
�
_linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/NegNegalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Sum_1*
T0*
_output_shapes
:
�
elinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Reshape_1Reshape_linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Negclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shape_1*
T0*
_output_shapes

:@*
Tshape0
�
Plinear/regression_head/train_op/gradients/linear/linear/BiasAdd_grad/BiasAddGradBiasAddGradclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Reshape*
T0*
_output_shapes
:*
data_formatNHWC
�
Jlinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeJlinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_4_grad/ShapeShape)linear/linear/make/make_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_4_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_4_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_5_grad/ShapeShapeAlinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_5_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_5_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_6_grad/ShapeShape9linear/linear/num-of-doors/num-of-doors_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_6_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_6_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Qlinear/regression_head/train_op/gradients/linear/linear/height/matmul_grad/MatMulMatMulLlinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/Reshapelinear/height/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Slinear/regression_head/train_op/gradients/linear/linear/height/matmul_grad/MatMul_1MatMullinear/linear/height/ExpandDimsLlinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/Reshape*
T0*
_output_shapes

:*
transpose_a(*
transpose_b( 
�
Ulinear/regression_head/train_op/gradients/linear/linear/horsepower/matmul_grad/MatMulMatMulNlinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/Reshapelinear/horsepower/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Wlinear/regression_head/train_op/gradients/linear/linear/horsepower/matmul_grad/MatMul_1MatMul#linear/linear/horsepower/ExpandDimsNlinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/Reshape*
T0*
_output_shapes

:*
transpose_a(*
transpose_b( 
�
Qlinear/regression_head/train_op/gradients/linear/linear/length/matmul_grad/MatMulMatMulNlinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/Reshapelinear/length/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Slinear/regression_head/train_op/gradients/linear/linear/length/matmul_grad/MatMul_1MatMullinear/linear/length/ExpandDimsNlinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/Reshape*
T0*
_output_shapes

:*
transpose_a(*
transpose_b( 
�
Plinear/regression_head/train_op/gradients/linear/linear/width/matmul_grad/MatMulMatMulNlinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/Reshapelinear/width/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Rlinear/regression_head/train_op/gradients/linear/linear/width/matmul_grad/MatMul_1MatMullinear/linear/width/ExpandDimsNlinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/Reshape*
T0*
_output_shapes

:*
transpose_a(*
transpose_b( 
�
^linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/ShapeShapelinear/linear/make/make_weights*
T0*
out_type0*
_output_shapes
:
�
`linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/ReshapeReshapeNlinear/regression_head/train_op/gradients/linear/linear/Reshape_4_grad/Reshape^linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
vlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/ShapeShape7linear/linear/num-of-cylinders/num-of-cylinders_weights*
T0*
out_type0*
_output_shapes
:
�
xlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/ReshapeReshapeNlinear/regression_head/train_op/gradients/linear/linear/Reshape_5_grad/Reshapevlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
nlinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/ShapeShape/linear/linear/num-of-doors/num-of-doors_weights*
T0*
out_type0*
_output_shapes
:
�
plinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/ReshapeReshapeNlinear/regression_head/train_op/gradients/linear/linear/Reshape_6_grad/Reshapenlinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Ylinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/zeros_like	ZerosLike*linear/linear/make/make_weights/zeros_like*
T0*'
_output_shapes
:���������
�
Ulinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/SelectSelect$linear/linear/make/make_weights/Tile`linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/ReshapeYlinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/zeros_like*
T0*
_output_shapes

:@
�
Wlinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/Select_1Select$linear/linear/make/make_weights/TileYlinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/zeros_like`linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/Reshape*
T0*
_output_shapes

:@
�
qlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/zeros_like	ZerosLikeBlinear/linear/num-of-cylinders/num-of-cylinders_weights/zeros_like*
T0*'
_output_shapes
:���������
�
mlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/SelectSelect<linear/linear/num-of-cylinders/num-of-cylinders_weights/Tilexlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/Reshapeqlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/zeros_like*
T0*
_output_shapes

:@
�
olinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/Select_1Select<linear/linear/num-of-cylinders/num-of-cylinders_weights/Tileqlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/zeros_likexlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/Reshape*
T0*
_output_shapes

:@
�
ilinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/zeros_like	ZerosLike:linear/linear/num-of-doors/num-of-doors_weights/zeros_like*
T0*'
_output_shapes
:���������
�
elinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/SelectSelect4linear/linear/num-of-doors/num-of-doors_weights/Tileplinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/Reshapeilinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/zeros_like*
T0*
_output_shapes

:@
�
glinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/Select_1Select4linear/linear/num-of-doors/num-of-doors_weights/Tileilinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/zeros_likeplinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/Reshape*
T0*
_output_shapes

:@
�
llinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/ShapeShapeHlinear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup*
T0*
out_type0*
_output_shapes
:
�
zlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
tlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_sliceStridedSlicellinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/Shapezlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack_1|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
�
mlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/GatherGatherWlinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/Select_1<linear/linear/make/make_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0
�
ylinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/UnsortedSegmentSumUnsortedSegmentSummlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/Gather@linear/linear/make/make_weights/embedding_lookup_sparse/Unique:1tlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice*
T0*'
_output_shapes
:���������*
Tindices0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/ShapeShape`linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup*
T0*
out_type0*
_output_shapes
:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_sliceStridedSlice�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/GatherGatherolinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/Select_1Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/UnsortedSegmentSumUnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/GatherXlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique:1�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice*
T0*'
_output_shapes
:���������*
Tindices0
�
|linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/ShapeShapeXlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup*
T0*
out_type0*
_output_shapes
:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_sliceStridedSlice|linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
�
}linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/GatherGatherglinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/Select_1Llinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/UnsortedSegmentSumUnsortedSegmentSum}linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/GatherPlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique:1�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice*
T0*'
_output_shapes
:���������*
Tindices0
�
}linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"2      *-
_class#
!loc:@linear/make/weights/part_0
�
|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/SizeSize>linear/linear/make/make_weights/embedding_lookup_sparse/Unique*
T0	*
out_type0*
_output_shapes
: 
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims
ExpandDims|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/Size�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_sliceStridedSlice}linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
:*

begin_mask *
Index0
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
~linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/concatConcatV2�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeReshapeylinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/UnsortedSegmentSum~linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/concat*
T0*0
_output_shapes
:������������������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1Reshape>linear/linear/make/make_weights/embedding_lookup_sparse/Unique�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims*
T0	*#
_output_shapes
:���������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"      *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/SizeSizeVlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique*
T0	*
out_type0*
_output_shapes
: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims
ExpandDims�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Size�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_sliceStridedSlice�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
:*

begin_mask *
Index0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/concatConcatV2�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeReshape�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/UnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/concat*
T0*0
_output_shapes
:������������������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1ReshapeVlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims*
T0	*#
_output_shapes
:���������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"      *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/SizeSizeNlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique*
T0	*
out_type0*
_output_shapes
: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims
ExpandDims�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/Size�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_sliceStridedSlice�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
:*

begin_mask *
Index0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/concatConcatV2�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeReshape�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/UnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/concat*
T0*0
_output_shapes
:������������������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1ReshapeNlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims*
T0	*#
_output_shapes
:���������*
Tshape0
�
%linear/regression_head/train_op/ConstConst*
dtype0*
_output_shapes

:*
valueB*���=*.
_class$
" loc:@linear/height/weight/part_0
�
7linear/regression_head/linear/height/weight/part_0/Ftrl
VariableV2*
	container *.
_class$
" loc:@linear/height/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
>linear/regression_head/linear/height/weight/part_0/Ftrl/AssignAssign7linear/regression_head/linear/height/weight/part_0/Ftrl%linear/regression_head/train_op/Const*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
�
<linear/regression_head/linear/height/weight/part_0/Ftrl/readIdentity7linear/regression_head/linear/height/weight/part_0/Ftrl*
T0*
_output_shapes

:*.
_class$
" loc:@linear/height/weight/part_0
�
Klinear/regression_head/linear/height/weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *.
_class$
" loc:@linear/height/weight/part_0
�
9linear/regression_head/linear/height/weight/part_0/Ftrl_1
VariableV2*
	container *.
_class$
" loc:@linear/height/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
@linear/regression_head/linear/height/weight/part_0/Ftrl_1/AssignAssign9linear/regression_head/linear/height/weight/part_0/Ftrl_1Klinear/regression_head/linear/height/weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
�
>linear/regression_head/linear/height/weight/part_0/Ftrl_1/readIdentity9linear/regression_head/linear/height/weight/part_0/Ftrl_1*
T0*
_output_shapes

:*.
_class$
" loc:@linear/height/weight/part_0
�
'linear/regression_head/train_op/Const_1Const*
dtype0*
_output_shapes

:*
valueB*���=*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
;linear/regression_head/linear/horsepower/weight/part_0/Ftrl
VariableV2*
	container *2
_class(
&$loc:@linear/horsepower/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Blinear/regression_head/linear/horsepower/weight/part_0/Ftrl/AssignAssign;linear/regression_head/linear/horsepower/weight/part_0/Ftrl'linear/regression_head/train_op/Const_1*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
@linear/regression_head/linear/horsepower/weight/part_0/Ftrl/readIdentity;linear/regression_head/linear/horsepower/weight/part_0/Ftrl*
T0*
_output_shapes

:*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
Olinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1
VariableV2*
	container *2
_class(
&$loc:@linear/horsepower/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Dlinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/AssignAssign=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1Olinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
Blinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/readIdentity=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1*
T0*
_output_shapes

:*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
'linear/regression_head/train_op/Const_2Const*
dtype0*
_output_shapes

:*
valueB*���=*.
_class$
" loc:@linear/length/weight/part_0
�
7linear/regression_head/linear/length/weight/part_0/Ftrl
VariableV2*
	container *.
_class$
" loc:@linear/length/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
>linear/regression_head/linear/length/weight/part_0/Ftrl/AssignAssign7linear/regression_head/linear/length/weight/part_0/Ftrl'linear/regression_head/train_op/Const_2*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
�
<linear/regression_head/linear/length/weight/part_0/Ftrl/readIdentity7linear/regression_head/linear/length/weight/part_0/Ftrl*
T0*
_output_shapes

:*.
_class$
" loc:@linear/length/weight/part_0
�
Klinear/regression_head/linear/length/weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *.
_class$
" loc:@linear/length/weight/part_0
�
9linear/regression_head/linear/length/weight/part_0/Ftrl_1
VariableV2*
	container *.
_class$
" loc:@linear/length/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
@linear/regression_head/linear/length/weight/part_0/Ftrl_1/AssignAssign9linear/regression_head/linear/length/weight/part_0/Ftrl_1Klinear/regression_head/linear/length/weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
�
>linear/regression_head/linear/length/weight/part_0/Ftrl_1/readIdentity9linear/regression_head/linear/length/weight/part_0/Ftrl_1*
T0*
_output_shapes

:*.
_class$
" loc:@linear/length/weight/part_0
�
'linear/regression_head/train_op/Const_3Const*
dtype0*
_output_shapes

:*
valueB*���=*-
_class#
!loc:@linear/width/weight/part_0
�
6linear/regression_head/linear/width/weight/part_0/Ftrl
VariableV2*
	container *-
_class#
!loc:@linear/width/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
=linear/regression_head/linear/width/weight/part_0/Ftrl/AssignAssign6linear/regression_head/linear/width/weight/part_0/Ftrl'linear/regression_head/train_op/Const_3*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
;linear/regression_head/linear/width/weight/part_0/Ftrl/readIdentity6linear/regression_head/linear/width/weight/part_0/Ftrl*
T0*
_output_shapes

:*-
_class#
!loc:@linear/width/weight/part_0
�
Jlinear/regression_head/linear/width/weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *-
_class#
!loc:@linear/width/weight/part_0
�
8linear/regression_head/linear/width/weight/part_0/Ftrl_1
VariableV2*
	container *-
_class#
!loc:@linear/width/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
?linear/regression_head/linear/width/weight/part_0/Ftrl_1/AssignAssign8linear/regression_head/linear/width/weight/part_0/Ftrl_1Jlinear/regression_head/linear/width/weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
=linear/regression_head/linear/width/weight/part_0/Ftrl_1/readIdentity8linear/regression_head/linear/width/weight/part_0/Ftrl_1*
T0*
_output_shapes

:*-
_class#
!loc:@linear/width/weight/part_0
�
'linear/regression_head/train_op/Const_4Const*
dtype0*
_output_shapes

:2*
valueB2*���=*-
_class#
!loc:@linear/make/weights/part_0
�
6linear/regression_head/linear/make/weights/part_0/Ftrl
VariableV2*
	container *-
_class#
!loc:@linear/make/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
=linear/regression_head/linear/make/weights/part_0/Ftrl/AssignAssign6linear/regression_head/linear/make/weights/part_0/Ftrl'linear/regression_head/train_op/Const_4*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
;linear/regression_head/linear/make/weights/part_0/Ftrl/readIdentity6linear/regression_head/linear/make/weights/part_0/Ftrl*
T0*
_output_shapes

:2*-
_class#
!loc:@linear/make/weights/part_0
�
Jlinear/regression_head/linear/make/weights/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:2*
valueB2*    *-
_class#
!loc:@linear/make/weights/part_0
�
8linear/regression_head/linear/make/weights/part_0/Ftrl_1
VariableV2*
	container *-
_class#
!loc:@linear/make/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
?linear/regression_head/linear/make/weights/part_0/Ftrl_1/AssignAssign8linear/regression_head/linear/make/weights/part_0/Ftrl_1Jlinear/regression_head/linear/make/weights/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
=linear/regression_head/linear/make/weights/part_0/Ftrl_1/readIdentity8linear/regression_head/linear/make/weights/part_0/Ftrl_1*
T0*
_output_shapes

:2*-
_class#
!loc:@linear/make/weights/part_0
�
'linear/regression_head/train_op/Const_5Const*
dtype0*
_output_shapes

:*
valueB*���=*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Blinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl
VariableV2*
	container *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Ilinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl/AssignAssignBlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl'linear/regression_head/train_op/Const_5*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Glinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl/readIdentityBlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl*
T0*
_output_shapes

:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Vlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Dlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1
VariableV2*
	container *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Klinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/AssignAssignDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1Vlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Ilinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/readIdentityDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1*
T0*
_output_shapes

:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
'linear/regression_head/train_op/Const_6Const*
dtype0*
_output_shapes

:*
valueB*���=*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl
VariableV2*
	container *5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Elinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl/AssignAssign>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl'linear/regression_head/train_op/Const_6*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Clinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl/readIdentity>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl*
T0*
_output_shapes

:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Rlinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1
VariableV2*
	container *5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Glinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/AssignAssign@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1Rlinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Elinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/readIdentity@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1*
T0*
_output_shapes

:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
'linear/regression_head/train_op/Const_7Const*
dtype0*
_output_shapes
:*
valueB*���=*,
_class"
 loc:@linear/bias_weight/part_0
�
5linear/regression_head/linear/bias_weight/part_0/Ftrl
VariableV2*
	container *,
_class"
 loc:@linear/bias_weight/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
<linear/regression_head/linear/bias_weight/part_0/Ftrl/AssignAssign5linear/regression_head/linear/bias_weight/part_0/Ftrl'linear/regression_head/train_op/Const_7*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
�
:linear/regression_head/linear/bias_weight/part_0/Ftrl/readIdentity5linear/regression_head/linear/bias_weight/part_0/Ftrl*
T0*
_output_shapes
:*,
_class"
 loc:@linear/bias_weight/part_0
�
Ilinear/regression_head/linear/bias_weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *,
_class"
 loc:@linear/bias_weight/part_0
�
7linear/regression_head/linear/bias_weight/part_0/Ftrl_1
VariableV2*
	container *,
_class"
 loc:@linear/bias_weight/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
>linear/regression_head/linear/bias_weight/part_0/Ftrl_1/AssignAssign7linear/regression_head/linear/bias_weight/part_0/Ftrl_1Ilinear/regression_head/linear/bias_weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
�
<linear/regression_head/linear/bias_weight/part_0/Ftrl_1/readIdentity7linear/regression_head/linear/bias_weight/part_0/Ftrl_1*
T0*
_output_shapes
:*,
_class"
 loc:@linear/bias_weight/part_0
w
2linear/regression_head/train_op/Ftrl/learning_rateConst*
dtype0*
_output_shapes
: *
valueB
 *��L>
�
?linear/regression_head/train_op/Ftrl/l1_regularization_strengthConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
?linear/regression_head/train_op/Ftrl/l2_regularization_strengthConst*
dtype0*
_output_shapes
: *
valueB
 *    
}
8linear/regression_head/train_op/Ftrl/learning_rate_powerConst*
dtype0*
_output_shapes
: *
valueB
 *   �
�
Qlinear/regression_head/train_op/Ftrl/update_linear/height/weight/part_0/ApplyFtrl	ApplyFtrllinear/height/weight/part_07linear/regression_head/linear/height/weight/part_0/Ftrl9linear/regression_head/linear/height/weight/part_0/Ftrl_1Slinear/regression_head/train_op/gradients/linear/linear/height/matmul_grad/MatMul_12linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *.
_class$
" loc:@linear/height/weight/part_0
�
Ulinear/regression_head/train_op/Ftrl/update_linear/horsepower/weight/part_0/ApplyFtrl	ApplyFtrllinear/horsepower/weight/part_0;linear/regression_head/linear/horsepower/weight/part_0/Ftrl=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1Wlinear/regression_head/train_op/gradients/linear/linear/horsepower/matmul_grad/MatMul_12linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
Qlinear/regression_head/train_op/Ftrl/update_linear/length/weight/part_0/ApplyFtrl	ApplyFtrllinear/length/weight/part_07linear/regression_head/linear/length/weight/part_0/Ftrl9linear/regression_head/linear/length/weight/part_0/Ftrl_1Slinear/regression_head/train_op/gradients/linear/linear/length/matmul_grad/MatMul_12linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *.
_class$
" loc:@linear/length/weight/part_0
�
Plinear/regression_head/train_op/Ftrl/update_linear/width/weight/part_0/ApplyFtrl	ApplyFtrllinear/width/weight/part_06linear/regression_head/linear/width/weight/part_0/Ftrl8linear/regression_head/linear/width/weight/part_0/Ftrl_1Rlinear/regression_head/train_op/gradients/linear/linear/width/matmul_grad/MatMul_12linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *-
_class#
!loc:@linear/width/weight/part_0
�
Mlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/UniqueUnique�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0*-
_class#
!loc:@linear/make/weights/part_0
�
Llinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/ShapeShapeMlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/Unique*
T0	*
out_type0*
_output_shapes
:*-
_class#
!loc:@linear/make/weights/part_0
�
Zlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: *-
_class#
!loc:@linear/make/weights/part_0
�
\linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:*-
_class#
!loc:@linear/make/weights/part_0
�
\linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:*-
_class#
!loc:@linear/make/weights/part_0
�
Tlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_sliceStridedSliceLlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/ShapeZlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack\linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack_1\linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *-
_class#
!loc:@linear/make/weights/part_0*

begin_mask *
Index0
�
Ylinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/UnsortedSegmentSumUnsortedSegmentSumlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeOlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/Unique:1Tlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice*
T0*0
_output_shapes
:������������������*-
_class#
!loc:@linear/make/weights/part_0*
Tindices0
�
Vlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/SparseApplyFtrlSparseApplyFtrllinear/make/weights/part_06linear/regression_head/linear/make/weights/part_0/Ftrl8linear/regression_head/linear/make/weights/part_0/Ftrl_1Ylinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/UnsortedSegmentSumMlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/Unique2linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:2*
use_locking( *
Tindices0	*-
_class#
!loc:@linear/make/weights/part_0
�
Ylinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/UniqueUnique�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Xlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/ShapeShapeYlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/Unique*
T0	*
out_type0*
_output_shapes
:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
flinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
hlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
hlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
`linear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_sliceStridedSliceXlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/Shapeflinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stackhlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stack_1hlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*

begin_mask *
Index0
�
elinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/UnsortedSegmentSumUnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape[linear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/Unique:1`linear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice*
T0*0
_output_shapes
:������������������*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
Tindices0
�
blinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/SparseApplyFtrlSparseApplyFtrl&linear/num-of-cylinders/weights/part_0Blinear/regression_head/linear/num-of-cylinders/weights/part_0/FtrlDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1elinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/UnsortedSegmentSumYlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/Unique2linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *
Tindices0	*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Ulinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/UniqueUnique�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Tlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/ShapeShapeUlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/Unique*
T0	*
out_type0*
_output_shapes
:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
blinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
dlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
dlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
\linear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_sliceStridedSliceTlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/Shapeblinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stackdlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stack_1dlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0*

begin_mask *
Index0
�
alinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/UnsortedSegmentSumUnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeWlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/Unique:1\linear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice*
T0*0
_output_shapes
:������������������*5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
Tindices0
�
^linear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/SparseApplyFtrlSparseApplyFtrl"linear/num-of-doors/weights/part_0>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1alinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/UnsortedSegmentSumUlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/Unique2linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *
Tindices0	*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Olinear/regression_head/train_op/Ftrl/update_linear/bias_weight/part_0/ApplyFtrl	ApplyFtrllinear/bias_weight/part_05linear/regression_head/linear/bias_weight/part_0/Ftrl7linear/regression_head/linear/bias_weight/part_0/Ftrl_1Plinear/regression_head/train_op/gradients/linear/linear/BiasAdd_grad/BiasAddGrad2linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes
:*
use_locking( *,
_class"
 loc:@linear/bias_weight/part_0
�
+linear/regression_head/train_op/Ftrl/updateNoOpR^linear/regression_head/train_op/Ftrl/update_linear/height/weight/part_0/ApplyFtrlV^linear/regression_head/train_op/Ftrl/update_linear/horsepower/weight/part_0/ApplyFtrlR^linear/regression_head/train_op/Ftrl/update_linear/length/weight/part_0/ApplyFtrlQ^linear/regression_head/train_op/Ftrl/update_linear/width/weight/part_0/ApplyFtrlW^linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/SparseApplyFtrlc^linear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/SparseApplyFtrl_^linear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/SparseApplyFtrlP^linear/regression_head/train_op/Ftrl/update_linear/bias_weight/part_0/ApplyFtrl
�
*linear/regression_head/train_op/Ftrl/valueConst,^linear/regression_head/train_op/Ftrl/update*
dtype0	*
_output_shapes
: *
value	B	 R*
_class
loc:@global_step
�
$linear/regression_head/train_op/Ftrl	AssignAddglobal_step*linear/regression_head/train_op/Ftrl/value*
T0	*
_output_shapes
: *
use_locking( *
_class
loc:@global_step
n
)linear/regression_head/metrics/mean/zerosConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
)linear/regression_head/metrics/mean/total
VariableV2*
dtype0*
	container *
_output_shapes
: *
shape: *
shared_name 
�
0linear/regression_head/metrics/mean/total/AssignAssign)linear/regression_head/metrics/mean/total)linear/regression_head/metrics/mean/zeros*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*<
_class2
0.loc:@linear/regression_head/metrics/mean/total
�
.linear/regression_head/metrics/mean/total/readIdentity)linear/regression_head/metrics/mean/total*
T0*
_output_shapes
: *<
_class2
0.loc:@linear/regression_head/metrics/mean/total
p
+linear/regression_head/metrics/mean/zeros_1Const*
dtype0*
_output_shapes
: *
valueB
 *    
�
)linear/regression_head/metrics/mean/count
VariableV2*
dtype0*
	container *
_output_shapes
: *
shape: *
shared_name 
�
0linear/regression_head/metrics/mean/count/AssignAssign)linear/regression_head/metrics/mean/count+linear/regression_head/metrics/mean/zeros_1*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*<
_class2
0.loc:@linear/regression_head/metrics/mean/count
�
.linear/regression_head/metrics/mean/count/readIdentity)linear/regression_head/metrics/mean/count*
T0*
_output_shapes
: *<
_class2
0.loc:@linear/regression_head/metrics/mean/count
j
(linear/regression_head/metrics/mean/SizeConst*
dtype0*
_output_shapes
: *
value	B :
�
-linear/regression_head/metrics/mean/ToFloat_1Cast(linear/regression_head/metrics/mean/Size*

SrcT0*
_output_shapes
: *

DstT0
l
)linear/regression_head/metrics/mean/ConstConst*
dtype0*
_output_shapes
: *
valueB 
�
'linear/regression_head/metrics/mean/SumSum-linear/regression_head/mean_squared_loss/loss)linear/regression_head/metrics/mean/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
-linear/regression_head/metrics/mean/AssignAdd	AssignAdd)linear/regression_head/metrics/mean/total'linear/regression_head/metrics/mean/Sum*
T0*
_output_shapes
: *
use_locking( *<
_class2
0.loc:@linear/regression_head/metrics/mean/total
�
/linear/regression_head/metrics/mean/AssignAdd_1	AssignAdd)linear/regression_head/metrics/mean/count-linear/regression_head/metrics/mean/ToFloat_1.^linear/regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: *
use_locking( *<
_class2
0.loc:@linear/regression_head/metrics/mean/count
r
-linear/regression_head/metrics/mean/Greater/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
+linear/regression_head/metrics/mean/GreaterGreater.linear/regression_head/metrics/mean/count/read-linear/regression_head/metrics/mean/Greater/y*
T0*
_output_shapes
: 
�
+linear/regression_head/metrics/mean/truedivRealDiv.linear/regression_head/metrics/mean/total/read.linear/regression_head/metrics/mean/count/read*
T0*
_output_shapes
: 
p
+linear/regression_head/metrics/mean/value/eConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
)linear/regression_head/metrics/mean/valueSelect+linear/regression_head/metrics/mean/Greater+linear/regression_head/metrics/mean/truediv+linear/regression_head/metrics/mean/value/e*
T0*
_output_shapes
: 
t
/linear/regression_head/metrics/mean/Greater_1/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
-linear/regression_head/metrics/mean/Greater_1Greater/linear/regression_head/metrics/mean/AssignAdd_1/linear/regression_head/metrics/mean/Greater_1/y*
T0*
_output_shapes
: 
�
-linear/regression_head/metrics/mean/truediv_1RealDiv-linear/regression_head/metrics/mean/AssignAdd/linear/regression_head/metrics/mean/AssignAdd_1*
T0*
_output_shapes
: 
t
/linear/regression_head/metrics/mean/update_op/eConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
-linear/regression_head/metrics/mean/update_opSelect-linear/regression_head/metrics/mean/Greater_1-linear/regression_head/metrics/mean/truediv_1/linear/regression_head/metrics/mean/update_op/e*
T0*
_output_shapes
: ""o
local_variables\
Z
+linear/regression_head/metrics/mean/total:0
+linear/regression_head/metrics/mean/count:0"�
queue_runners��
�
"enqueue_input/random_shuffle_queue.enqueue_input/random_shuffle_queue_EnqueueMany(enqueue_input/random_shuffle_queue_Close"*enqueue_input/random_shuffle_queue_Close_1*"=
losses3
1
/linear/regression_head/mean_squared_loss/loss:0"�	
trainable_variables�	�	
�
linear/height/weight/part_0:0"linear/height/weight/part_0/Assign"linear/height/weight/part_0/read:0""
linear/height/weight  "
�
!linear/horsepower/weight/part_0:0&linear/horsepower/weight/part_0/Assign&linear/horsepower/weight/part_0/read:0"&
linear/horsepower/weight  "
�
linear/length/weight/part_0:0"linear/length/weight/part_0/Assign"linear/length/weight/part_0/read:0""
linear/length/weight  "
�
linear/width/weight/part_0:0!linear/width/weight/part_0/Assign!linear/width/weight/part_0/read:0"!
linear/width/weight  "
�
linear/make/weights/part_0:0!linear/make/weights/part_0/Assign!linear/make/weights/part_0/read:0"!
linear/make/weights2  "2
�
(linear/num-of-cylinders/weights/part_0:0-linear/num-of-cylinders/weights/part_0/Assign-linear/num-of-cylinders/weights/part_0/read:0"-
linear/num-of-cylinders/weights  "
�
$linear/num-of-doors/weights/part_0:0)linear/num-of-doors/weights/part_0/Assign)linear/num-of-doors/weights/part_0/read:0")
linear/num-of-doors/weights  "
�
linear/bias_weight/part_0:0 linear/bias_weight/part_0/Assign linear/bias_weight/part_0/read:0"
linear/bias_weight "" 
global_step

global_step:0"

savers "s
table_initializer^
\
,linear/linear/lookup_1/hash_table/table_init
,linear/linear/lookup_2/hash_table/table_init"�
linear�
�
linear/height/weight/part_0:0
!linear/horsepower/weight/part_0:0
linear/length/weight/part_0:0
linear/width/weight/part_0:0
linear/make/weights/part_0:0
(linear/num-of-cylinders/weights/part_0:0
$linear/num-of-doors/weights/part_0:0
linear/bias_weight/part_0:0"�
model_variables�
�
linear/height/weight/part_0:0
!linear/horsepower/weight/part_0:0
linear/length/weight/part_0:0
linear/width/weight/part_0:0
linear/make/weights/part_0:0
(linear/num-of-cylinders/weights/part_0:0
$linear/num-of-doors/weights/part_0:0
linear/bias_weight/part_0:0"�+
	variables�+�+
7
global_step:0global_step/Assignglobal_step/read:0
�
linear/height/weight/part_0:0"linear/height/weight/part_0/Assign"linear/height/weight/part_0/read:0""
linear/height/weight  "
�
!linear/horsepower/weight/part_0:0&linear/horsepower/weight/part_0/Assign&linear/horsepower/weight/part_0/read:0"&
linear/horsepower/weight  "
�
linear/length/weight/part_0:0"linear/length/weight/part_0/Assign"linear/length/weight/part_0/read:0""
linear/length/weight  "
�
linear/width/weight/part_0:0!linear/width/weight/part_0/Assign!linear/width/weight/part_0/read:0"!
linear/width/weight  "
�
linear/make/weights/part_0:0!linear/make/weights/part_0/Assign!linear/make/weights/part_0/read:0"!
linear/make/weights2  "2
�
(linear/num-of-cylinders/weights/part_0:0-linear/num-of-cylinders/weights/part_0/Assign-linear/num-of-cylinders/weights/part_0/read:0"-
linear/num-of-cylinders/weights  "
�
$linear/num-of-doors/weights/part_0:0)linear/num-of-doors/weights/part_0/Assign)linear/num-of-doors/weights/part_0/read:0")
linear/num-of-doors/weights  "
�
linear/bias_weight/part_0:0 linear/bias_weight/part_0/Assign linear/bias_weight/part_0/read:0"
linear/bias_weight "
�
9linear/regression_head/linear/height/weight/part_0/Ftrl:0>linear/regression_head/linear/height/weight/part_0/Ftrl/Assign>linear/regression_head/linear/height/weight/part_0/Ftrl/read:0">
0linear/height/weight/r/height/weight/part_0/Ftrl  "
�
;linear/regression_head/linear/height/weight/part_0/Ftrl_1:0@linear/regression_head/linear/height/weight/part_0/Ftrl_1/Assign@linear/regression_head/linear/height/weight/part_0/Ftrl_1/read:0"@
2linear/height/weight/r/height/weight/part_0/Ftrl_1  "
�
=linear/regression_head/linear/horsepower/weight/part_0/Ftrl:0Blinear/regression_head/linear/horsepower/weight/part_0/Ftrl/AssignBlinear/regression_head/linear/horsepower/weight/part_0/Ftrl/read:0"B
4linear/horsepower/weight/rsepower/weight/part_0/Ftrl  "
�
?linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1:0Dlinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/AssignDlinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/read:0"D
6linear/horsepower/weight/rsepower/weight/part_0/Ftrl_1  "
�
9linear/regression_head/linear/length/weight/part_0/Ftrl:0>linear/regression_head/linear/length/weight/part_0/Ftrl/Assign>linear/regression_head/linear/length/weight/part_0/Ftrl/read:0">
0linear/length/weight/r/length/weight/part_0/Ftrl  "
�
;linear/regression_head/linear/length/weight/part_0/Ftrl_1:0@linear/regression_head/linear/length/weight/part_0/Ftrl_1/Assign@linear/regression_head/linear/length/weight/part_0/Ftrl_1/read:0"@
2linear/length/weight/r/length/weight/part_0/Ftrl_1  "
�
8linear/regression_head/linear/width/weight/part_0/Ftrl:0=linear/regression_head/linear/width/weight/part_0/Ftrl/Assign=linear/regression_head/linear/width/weight/part_0/Ftrl/read:0"=
/linear/width/weight/ar/width/weight/part_0/Ftrl  "
�
:linear/regression_head/linear/width/weight/part_0/Ftrl_1:0?linear/regression_head/linear/width/weight/part_0/Ftrl_1/Assign?linear/regression_head/linear/width/weight/part_0/Ftrl_1/read:0"?
1linear/width/weight/ar/width/weight/part_0/Ftrl_1  "
�
8linear/regression_head/linear/make/weights/part_0/Ftrl:0=linear/regression_head/linear/make/weights/part_0/Ftrl/Assign=linear/regression_head/linear/make/weights/part_0/Ftrl/read:0"=
/linear/make/weights/ar/make/weights/part_0/Ftrl2  "2
�
:linear/regression_head/linear/make/weights/part_0/Ftrl_1:0?linear/regression_head/linear/make/weights/part_0/Ftrl_1/Assign?linear/regression_head/linear/make/weights/part_0/Ftrl_1/read:0"?
1linear/make/weights/ar/make/weights/part_0/Ftrl_12  "2
�
Dlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl:0Ilinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl/AssignIlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl/read:0"I
;linear/num-of-cylinders/weights/linders/weights/part_0/Ftrl  "
�
Flinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1:0Klinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/AssignKlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/read:0"K
=linear/num-of-cylinders/weights/linders/weights/part_0/Ftrl_1  "
�
@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl:0Elinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl/AssignElinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl/read:0"E
7linear/num-of-doors/weights/f-doors/weights/part_0/Ftrl  "
�
Blinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1:0Glinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/AssignGlinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/read:0"G
9linear/num-of-doors/weights/f-doors/weights/part_0/Ftrl_1  "
�
7linear/regression_head/linear/bias_weight/part_0/Ftrl:0<linear/regression_head/linear/bias_weight/part_0/Ftrl/Assign<linear/regression_head/linear/bias_weight/part_0/Ftrl/read:0"9
.linear/bias_weight/ear/bias_weight/part_0/Ftrl "
�
9linear/regression_head/linear/bias_weight/part_0/Ftrl_1:0>linear/regression_head/linear/bias_weight/part_0/Ftrl_1/Assign>linear/regression_head/linear/bias_weight/part_0/Ftrl_1/read:0";
0linear/bias_weight/ear/bias_weight/part_0/Ftrl_1 ""�
	summaries�

Uenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full:0
&linear/regression_head/ScalarSummary:0"4
train_op(
&
$linear/regression_head/train_op/Ftrl1��]�Y     �O	B	�e�P�A"��

global_step/Initializer/zerosConst*
dtype0	*
_output_shapes
: *
value	B	 R *
_class
loc:@global_step
�
global_step
VariableV2*
	container *
_class
loc:@global_step*
dtype0	*
_output_shapes
: *
shape: *
shared_name 
�
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
T0	*
_output_shapes
: *
validate_shape(*
use_locking(*
_class
loc:@global_step
j
global_step/readIdentityglobal_step*
T0	*
_output_shapes
: *
_class
loc:@global_step
�
"enqueue_input/random_shuffle_queueRandomShuffleQueueV2*
	container *
seed2 * 
component_types
2		*
min_after_dequeue�*
_output_shapes
: *

seed *
shapes
: : : : : : : : : *
capacity�*
shared_name 
^
enqueue_input/PlaceholderPlaceholder*
dtype0	*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_1Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_2Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_3Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_4Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_5Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_6Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_7Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_8Placeholder*
dtype0*
_output_shapes
:*
shape:
�
.enqueue_input/random_shuffle_queue_EnqueueManyQueueEnqueueManyV2"enqueue_input/random_shuffle_queueenqueue_input/Placeholderenqueue_input/Placeholder_1enqueue_input/Placeholder_2enqueue_input/Placeholder_3enqueue_input/Placeholder_4enqueue_input/Placeholder_5enqueue_input/Placeholder_6enqueue_input/Placeholder_7enqueue_input/Placeholder_8*
Tcomponents
2		*

timeout_ms���������
{
(enqueue_input/random_shuffle_queue_CloseQueueCloseV2"enqueue_input/random_shuffle_queue*
cancel_pending_enqueues( 
}
*enqueue_input/random_shuffle_queue_Close_1QueueCloseV2"enqueue_input/random_shuffle_queue*
cancel_pending_enqueues(
r
'enqueue_input/random_shuffle_queue_SizeQueueSizeV2"enqueue_input/random_shuffle_queue*
_output_shapes
: 
V
enqueue_input/sub/yConst*
dtype0*
_output_shapes
: *
value
B :�
w
enqueue_input/subSub'enqueue_input/random_shuffle_queue_Sizeenqueue_input/sub/y*
T0*
_output_shapes
: 
Y
enqueue_input/Maximum/xConst*
dtype0*
_output_shapes
: *
value	B : 
m
enqueue_input/MaximumMaximumenqueue_input/Maximum/xenqueue_input/sub*
T0*
_output_shapes
: 
a
enqueue_input/CastCastenqueue_input/Maximum*

SrcT0*
_output_shapes
: *

DstT0
X
enqueue_input/mul/yConst*
dtype0*
_output_shapes
: *
valueB
 *>î:
b
enqueue_input/mulMulenqueue_input/Castenqueue_input/mul/y*
T0*
_output_shapes
: 
�
Xenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full/tagsConst*
dtype0*
_output_shapes
: *d
value[BY BSenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full
�
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullScalarSummaryXenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full/tagsenqueue_input/mul*
T0*
_output_shapes
: 
d
"random_shuffle_queue_DequeueMany/nConst*
dtype0*
_output_shapes
: *
value	B :@
�
 random_shuffle_queue_DequeueManyQueueDequeueManyV2"enqueue_input/random_shuffle_queue"random_shuffle_queue_DequeueMany/n*J
_output_shapes8
6:@:@:@:@:@:@:@:@:@*

timeout_ms���������* 
component_types
2		
n
#linear/linear/height/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/height/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:6#linear/linear/height/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
-linear/height/weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *.
_class$
" loc:@linear/height/weight/part_0
�
linear/height/weight/part_0
VariableV2*
	container *.
_class$
" loc:@linear/height/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
"linear/height/weight/part_0/AssignAssignlinear/height/weight/part_0-linear/height/weight/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
�
 linear/height/weight/part_0/readIdentitylinear/height/weight/part_0*
T0*
_output_shapes

:*.
_class$
" loc:@linear/height/weight/part_0
k
linear/height/weightIdentity linear/height/weight/part_0/read*
T0*
_output_shapes

:
�
linear/linear/height/matmulMatMullinear/linear/height/ExpandDimslinear/height/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
l
linear/linear/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/ReshapeReshapelinear/linear/height/matmullinear/linear/Reshape/shape*
T0*
_output_shapes

:@*
Tshape0
r
'linear/linear/horsepower/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
#linear/linear/horsepower/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:3'linear/linear/horsepower/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
1linear/horsepower/weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
linear/horsepower/weight/part_0
VariableV2*
	container *2
_class(
&$loc:@linear/horsepower/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
&linear/horsepower/weight/part_0/AssignAssignlinear/horsepower/weight/part_01linear/horsepower/weight/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
$linear/horsepower/weight/part_0/readIdentitylinear/horsepower/weight/part_0*
T0*
_output_shapes

:*2
_class(
&$loc:@linear/horsepower/weight/part_0
s
linear/horsepower/weightIdentity$linear/horsepower/weight/part_0/read*
T0*
_output_shapes

:
�
linear/linear/horsepower/matmulMatMul#linear/linear/horsepower/ExpandDimslinear/horsepower/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
n
linear/linear/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_1Reshapelinear/linear/horsepower/matmullinear/linear/Reshape_1/shape*
T0*
_output_shapes

:@*
Tshape0
n
#linear/linear/length/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/length/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:5#linear/linear/length/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
-linear/length/weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *.
_class$
" loc:@linear/length/weight/part_0
�
linear/length/weight/part_0
VariableV2*
	container *.
_class$
" loc:@linear/length/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
"linear/length/weight/part_0/AssignAssignlinear/length/weight/part_0-linear/length/weight/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
�
 linear/length/weight/part_0/readIdentitylinear/length/weight/part_0*
T0*
_output_shapes

:*.
_class$
" loc:@linear/length/weight/part_0
k
linear/length/weightIdentity linear/length/weight/part_0/read*
T0*
_output_shapes

:
�
linear/linear/length/matmulMatMullinear/linear/length/ExpandDimslinear/length/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
n
linear/linear/Reshape_2/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_2Reshapelinear/linear/length/matmullinear/linear/Reshape_2/shape*
T0*
_output_shapes

:@*
Tshape0
m
"linear/linear/width/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/width/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:7"linear/linear/width/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
,linear/width/weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *-
_class#
!loc:@linear/width/weight/part_0
�
linear/width/weight/part_0
VariableV2*
	container *-
_class#
!loc:@linear/width/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
!linear/width/weight/part_0/AssignAssignlinear/width/weight/part_0,linear/width/weight/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
linear/width/weight/part_0/readIdentitylinear/width/weight/part_0*
T0*
_output_shapes

:*-
_class#
!loc:@linear/width/weight/part_0
i
linear/width/weightIdentitylinear/width/weight/part_0/read*
T0*
_output_shapes

:
�
linear/linear/width/matmulMatMullinear/linear/width/ExpandDimslinear/width/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
n
linear/linear/Reshape_3/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_3Reshapelinear/linear/width/matmullinear/linear/Reshape_3/shape*
T0*
_output_shapes

:@*
Tshape0
h
linear/linear/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:4linear/linear/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
x
'linear/linear/DenseToSparseTensor/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
&linear/linear/DenseToSparseTensor/CastCast'linear/linear/DenseToSparseTensor/Shape*

SrcT0*
_output_shapes
:*

DstT0	
k
*linear/linear/DenseToSparseTensor/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
*linear/linear/DenseToSparseTensor/NotEqualNotEquallinear/linear/expand_dims*linear/linear/DenseToSparseTensor/Cast_1/x*
T0*
_output_shapes

:@
�
'linear/linear/DenseToSparseTensor/WhereWhere*linear/linear/DenseToSparseTensor/NotEqual*'
_output_shapes
:���������
�
/linear/linear/DenseToSparseTensor/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
)linear/linear/DenseToSparseTensor/ReshapeReshapelinear/linear/expand_dims/linear/linear/DenseToSparseTensor/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
5linear/linear/DenseToSparseTensor/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
7linear/linear/DenseToSparseTensor/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
7linear/linear/DenseToSparseTensor/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
/linear/linear/DenseToSparseTensor/strided_sliceStridedSlice'linear/linear/DenseToSparseTensor/Where5linear/linear/DenseToSparseTensor/strided_slice/stack7linear/linear/DenseToSparseTensor/strided_slice/stack_17linear/linear/DenseToSparseTensor/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
7linear/linear/DenseToSparseTensor/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
9linear/linear/DenseToSparseTensor/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
1linear/linear/DenseToSparseTensor/strided_slice_1StridedSlice'linear/linear/DenseToSparseTensor/Where7linear/linear/DenseToSparseTensor/strided_slice_1/stack9linear/linear/DenseToSparseTensor/strided_slice_1/stack_19linear/linear/DenseToSparseTensor/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
)linear/linear/DenseToSparseTensor/unstackUnpack&linear/linear/DenseToSparseTensor/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
'linear/linear/DenseToSparseTensor/stackPack+linear/linear/DenseToSparseTensor/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
%linear/linear/DenseToSparseTensor/MulMul1linear/linear/DenseToSparseTensor/strided_slice_1'linear/linear/DenseToSparseTensor/stack*
T0	*'
_output_shapes
:���������
�
7linear/linear/DenseToSparseTensor/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
%linear/linear/DenseToSparseTensor/SumSum%linear/linear/DenseToSparseTensor/Mul7linear/linear/DenseToSparseTensor/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
%linear/linear/DenseToSparseTensor/AddAdd/linear/linear/DenseToSparseTensor/strided_slice%linear/linear/DenseToSparseTensor/Sum*
T0	*#
_output_shapes
:���������
�
(linear/linear/DenseToSparseTensor/GatherGather)linear/linear/DenseToSparseTensor/Reshape%linear/linear/DenseToSparseTensor/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
�
linear/linear/lookupStringToHashBucketFast(linear/linear/DenseToSparseTensor/Gather*
num_buckets2*#
_output_shapes
:���������
�
,linear/make/weights/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:2*
valueB2*    *-
_class#
!loc:@linear/make/weights/part_0
�
linear/make/weights/part_0
VariableV2*
	container *-
_class#
!loc:@linear/make/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
!linear/make/weights/part_0/AssignAssignlinear/make/weights/part_0,linear/make/weights/part_0/Initializer/zeros*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
linear/make/weights/part_0/readIdentitylinear/make/weights/part_0*
T0*
_output_shapes

:2*-
_class#
!loc:@linear/make/weights/part_0
u
+linear/linear/make/make_weights/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 
t
*linear/linear/make/make_weights/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
%linear/linear/make/make_weights/SliceSlice&linear/linear/DenseToSparseTensor/Cast+linear/linear/make/make_weights/Slice/begin*linear/linear/make/make_weights/Slice/size*
T0	*
_output_shapes
:*
Index0
o
%linear/linear/make/make_weights/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
$linear/linear/make/make_weights/ProdProd%linear/linear/make/make_weights/Slice%linear/linear/make/make_weights/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
p
.linear/linear/make/make_weights/Gather/indicesConst*
dtype0*
_output_shapes
: *
value	B :
�
&linear/linear/make/make_weights/GatherGather&linear/linear/DenseToSparseTensor/Cast.linear/linear/make/make_weights/Gather/indices*
_output_shapes
: *
validate_indices(*
Tparams0	*
Tindices0
�
&linear/linear/make/make_weights/Cast/xPack$linear/linear/make/make_weights/Prod&linear/linear/make/make_weights/Gather*
T0	*
_output_shapes
:*
N*

axis 
�
-linear/linear/make/make_weights/SparseReshapeSparseReshape'linear/linear/DenseToSparseTensor/Where&linear/linear/DenseToSparseTensor/Cast&linear/linear/make/make_weights/Cast/x*-
_output_shapes
:���������:
�
6linear/linear/make/make_weights/SparseReshape/IdentityIdentitylinear/linear/lookup*
T0	*#
_output_shapes
:���������
p
.linear/linear/make/make_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
,linear/linear/make/make_weights/GreaterEqualGreaterEqual6linear/linear/make/make_weights/SparseReshape/Identity.linear/linear/make/make_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
%linear/linear/make/make_weights/WhereWhere,linear/linear/make/make_weights/GreaterEqual*'
_output_shapes
:���������
�
-linear/linear/make/make_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
'linear/linear/make/make_weights/ReshapeReshape%linear/linear/make/make_weights/Where-linear/linear/make/make_weights/Reshape/shape*
T0	*#
_output_shapes
:���������*
Tshape0
�
(linear/linear/make/make_weights/Gather_1Gather-linear/linear/make/make_weights/SparseReshape'linear/linear/make/make_weights/Reshape*'
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
(linear/linear/make/make_weights/Gather_2Gather6linear/linear/make/make_weights/SparseReshape/Identity'linear/linear/make/make_weights/Reshape*#
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
(linear/linear/make/make_weights/IdentityIdentity/linear/linear/make/make_weights/SparseReshape:1*
T0	*
_output_shapes
:
{
9linear/linear/make/make_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
Glinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/strided_sliceStridedSlice(linear/linear/make/make_weights/IdentityGlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stackIlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stack_1Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
8linear/linear/make/make_weights/SparseFillEmptyRows/CastCastAlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice*

SrcT0	*
_output_shapes
: *

DstT0
�
?linear/linear/make/make_weights/SparseFillEmptyRows/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
?linear/linear/make/make_weights/SparseFillEmptyRows/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
9linear/linear/make/make_weights/SparseFillEmptyRows/rangeRange?linear/linear/make/make_weights/SparseFillEmptyRows/range/start8linear/linear/make/make_weights/SparseFillEmptyRows/Cast?linear/linear/make/make_weights/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:���������
�
:linear/linear/make/make_weights/SparseFillEmptyRows/Cast_1Cast9linear/linear/make/make_weights/SparseFillEmptyRows/range*

SrcT0*#
_output_shapes
:���������*

DstT0	
�
Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
Clinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1StridedSlice(linear/linear/make/make_weights/Gather_1Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stackKlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stack_1Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
<linear/linear/make/make_weights/SparseFillEmptyRows/ListDiffListDiff:linear/linear/make/make_weights/SparseFillEmptyRows/Cast_1Clinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Clinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2StridedSlice(linear/linear/make/make_weights/IdentityIlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stackKlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stack_1Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Blinear/linear/make/make_weights/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
>linear/linear/make/make_weights/SparseFillEmptyRows/ExpandDims
ExpandDimsClinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2Blinear/linear/make/make_weights/SparseFillEmptyRows/ExpandDims/dim*
T0	*
_output_shapes
:*

Tdim0
�
Olinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
_output_shapes
: *
value	B
 Z
�
Olinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
_output_shapes
: *
value	B
 Z 
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDenseSparseToDense<linear/linear/make/make_weights/SparseFillEmptyRows/ListDiff>linear/linear/make/make_weights/SparseFillEmptyRows/ExpandDimsOlinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesOlinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/default_value*
T0
*#
_output_shapes
:���������*
validate_indices(*
Tindices0	
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
;linear/linear/make/make_weights/SparseFillEmptyRows/ReshapeReshape<linear/linear/make/make_weights/SparseFillEmptyRows/ListDiffAlinear/linear/make/make_weights/SparseFillEmptyRows/Reshape/shape*
T0	*'
_output_shapes
:���������*
Tshape0
�
>linear/linear/make/make_weights/SparseFillEmptyRows/zeros_like	ZerosLike;linear/linear/make/make_weights/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:���������
�
?linear/linear/make/make_weights/SparseFillEmptyRows/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
�
:linear/linear/make/make_weights/SparseFillEmptyRows/concatConcatV2;linear/linear/make/make_weights/SparseFillEmptyRows/Reshape>linear/linear/make/make_weights/SparseFillEmptyRows/zeros_like?linear/linear/make/make_weights/SparseFillEmptyRows/concat/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
9linear/linear/make/make_weights/SparseFillEmptyRows/ShapeShape<linear/linear/make/make_weights/SparseFillEmptyRows/ListDiff*
T0	*
out_type0*
_output_shapes
:
�
8linear/linear/make/make_weights/SparseFillEmptyRows/FillFill9linear/linear/make/make_weights/SparseFillEmptyRows/Shape9linear/linear/make/make_weights/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:���������
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
<linear/linear/make/make_weights/SparseFillEmptyRows/concat_1ConcatV2(linear/linear/make/make_weights/Gather_1:linear/linear/make/make_weights/SparseFillEmptyRows/concatAlinear/linear/make/make_weights/SparseFillEmptyRows/concat_1/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
<linear/linear/make/make_weights/SparseFillEmptyRows/concat_2ConcatV2(linear/linear/make/make_weights/Gather_28linear/linear/make/make_weights/SparseFillEmptyRows/FillAlinear/linear/make/make_weights/SparseFillEmptyRows/concat_2/axis*

Tidx0*
T0	*#
_output_shapes
:���������*
N
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/SparseReorderSparseReorder<linear/linear/make/make_weights/SparseFillEmptyRows/concat_1<linear/linear/make/make_weights/SparseFillEmptyRows/concat_2(linear/linear/make/make_weights/Identity*
T0	*6
_output_shapes$
":���������:���������
�
<linear/linear/make/make_weights/SparseFillEmptyRows/IdentityIdentity(linear/linear/make/make_weights/Identity*
T0	*
_output_shapes
:
�
Klinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
Mlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
Mlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
Elinear/linear/make/make_weights/embedding_lookup_sparse/strided_sliceStridedSliceAlinear/linear/make/make_weights/SparseFillEmptyRows/SparseReorderKlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stackMlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stack_1Mlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
<linear/linear/make/make_weights/embedding_lookup_sparse/CastCastElinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:���������*

DstT0
�
>linear/linear/make/make_weights/embedding_lookup_sparse/UniqueUniqueClinear/linear/make/make_weights/SparseFillEmptyRows/SparseReorder:1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
Hlinear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookupGatherlinear/make/weights/part_0/read>linear/linear/make/make_weights/embedding_lookup_sparse/Unique*'
_output_shapes
:���������*
validate_indices(*
Tparams0*-
_class#
!loc:@linear/make/weights/part_0*
Tindices0	
�
7linear/linear/make/make_weights/embedding_lookup_sparseSparseSegmentSumHlinear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup@linear/linear/make/make_weights/embedding_lookup_sparse/Unique:1<linear/linear/make/make_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:���������
�
/linear/linear/make/make_weights/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
)linear/linear/make/make_weights/Reshape_1ReshapeAlinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/linear/linear/make/make_weights/Reshape_1/shape*
T0
*'
_output_shapes
:���������*
Tshape0
�
%linear/linear/make/make_weights/ShapeShape7linear/linear/make/make_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
}
3linear/linear/make/make_weights/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:

5linear/linear/make/make_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:

5linear/linear/make/make_weights/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
-linear/linear/make/make_weights/strided_sliceStridedSlice%linear/linear/make/make_weights/Shape3linear/linear/make/make_weights/strided_slice/stack5linear/linear/make/make_weights/strided_slice/stack_15linear/linear/make/make_weights/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
i
'linear/linear/make/make_weights/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
�
%linear/linear/make/make_weights/stackPack'linear/linear/make/make_weights/stack/0-linear/linear/make/make_weights/strided_slice*
T0*
_output_shapes
:*
N*

axis 
�
$linear/linear/make/make_weights/TileTile)linear/linear/make/make_weights/Reshape_1%linear/linear/make/make_weights/stack*
T0
*0
_output_shapes
:������������������*

Tmultiples0
�
*linear/linear/make/make_weights/zeros_like	ZerosLike7linear/linear/make/make_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
linear/linear/make/make_weightsSelect$linear/linear/make/make_weights/Tile*linear/linear/make/make_weights/zeros_like7linear/linear/make/make_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
&linear/linear/make/make_weights/Cast_1Cast&linear/linear/DenseToSparseTensor/Cast*

SrcT0	*
_output_shapes
:*

DstT0
w
-linear/linear/make/make_weights/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 
v
,linear/linear/make/make_weights/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
'linear/linear/make/make_weights/Slice_1Slice&linear/linear/make/make_weights/Cast_1-linear/linear/make/make_weights/Slice_1/begin,linear/linear/make/make_weights/Slice_1/size*
T0*
_output_shapes
:*
Index0
�
'linear/linear/make/make_weights/Shape_1Shapelinear/linear/make/make_weights*
T0*
out_type0*
_output_shapes
:
w
-linear/linear/make/make_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:

,linear/linear/make/make_weights/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
'linear/linear/make/make_weights/Slice_2Slice'linear/linear/make/make_weights/Shape_1-linear/linear/make/make_weights/Slice_2/begin,linear/linear/make/make_weights/Slice_2/size*
T0*
_output_shapes
:*
Index0
m
+linear/linear/make/make_weights/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
&linear/linear/make/make_weights/concatConcatV2'linear/linear/make/make_weights/Slice_1'linear/linear/make/make_weights/Slice_2+linear/linear/make/make_weights/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
)linear/linear/make/make_weights/Reshape_2Reshapelinear/linear/make/make_weights&linear/linear/make/make_weights/concat*
T0*'
_output_shapes
:���������*
Tshape0
n
linear/linear/Reshape_4/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_4Reshape)linear/linear/make/make_weights/Reshape_2linear/linear/Reshape_4/shape*
T0*'
_output_shapes
:���������*
Tshape0
j
linear/linear/expand_dims_1/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/expand_dims_1
ExpandDims"random_shuffle_queue_DequeueMany:2linear/linear/expand_dims_1/dim*
T0*
_output_shapes

:@*

Tdim0
z
)linear/linear/DenseToSparseTensor_1/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
(linear/linear/DenseToSparseTensor_1/CastCast)linear/linear/DenseToSparseTensor_1/Shape*

SrcT0*
_output_shapes
:*

DstT0	
m
,linear/linear/DenseToSparseTensor_1/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
,linear/linear/DenseToSparseTensor_1/NotEqualNotEquallinear/linear/expand_dims_1,linear/linear/DenseToSparseTensor_1/Cast_1/x*
T0*
_output_shapes

:@
�
)linear/linear/DenseToSparseTensor_1/WhereWhere,linear/linear/DenseToSparseTensor_1/NotEqual*'
_output_shapes
:���������
�
1linear/linear/DenseToSparseTensor_1/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
+linear/linear/DenseToSparseTensor_1/ReshapeReshapelinear/linear/expand_dims_11linear/linear/DenseToSparseTensor_1/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
7linear/linear/DenseToSparseTensor_1/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor_1/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor_1/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
1linear/linear/DenseToSparseTensor_1/strided_sliceStridedSlice)linear/linear/DenseToSparseTensor_1/Where7linear/linear/DenseToSparseTensor_1/strided_slice/stack9linear/linear/DenseToSparseTensor_1/strided_slice/stack_19linear/linear/DenseToSparseTensor_1/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
9linear/linear/DenseToSparseTensor_1/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
;linear/linear/DenseToSparseTensor_1/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
;linear/linear/DenseToSparseTensor_1/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
3linear/linear/DenseToSparseTensor_1/strided_slice_1StridedSlice)linear/linear/DenseToSparseTensor_1/Where9linear/linear/DenseToSparseTensor_1/strided_slice_1/stack;linear/linear/DenseToSparseTensor_1/strided_slice_1/stack_1;linear/linear/DenseToSparseTensor_1/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
+linear/linear/DenseToSparseTensor_1/unstackUnpack(linear/linear/DenseToSparseTensor_1/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
)linear/linear/DenseToSparseTensor_1/stackPack-linear/linear/DenseToSparseTensor_1/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
'linear/linear/DenseToSparseTensor_1/MulMul3linear/linear/DenseToSparseTensor_1/strided_slice_1)linear/linear/DenseToSparseTensor_1/stack*
T0	*'
_output_shapes
:���������
�
9linear/linear/DenseToSparseTensor_1/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
'linear/linear/DenseToSparseTensor_1/SumSum'linear/linear/DenseToSparseTensor_1/Mul9linear/linear/DenseToSparseTensor_1/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
'linear/linear/DenseToSparseTensor_1/AddAdd1linear/linear/DenseToSparseTensor_1/strided_slice'linear/linear/DenseToSparseTensor_1/Sum*
T0	*#
_output_shapes
:���������
�
*linear/linear/DenseToSparseTensor_1/GatherGather+linear/linear/DenseToSparseTensor_1/Reshape'linear/linear/DenseToSparseTensor_1/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
�
linear/linear/lookup_1/ConstConst*
dtype0*
_output_shapes
:*?
value6B4BeightBfiveBfourBsixBthreeBtwelveBtwo
]
linear/linear/lookup_1/SizeConst*
dtype0*
_output_shapes
: *
value	B :
d
"linear/linear/lookup_1/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
d
"linear/linear/lookup_1/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
linear/linear/lookup_1/rangeRange"linear/linear/lookup_1/range/startlinear/linear/lookup_1/Size"linear/linear/lookup_1/range/delta*

Tidx0*
_output_shapes
:
x
linear/linear/lookup_1/ToInt64Castlinear/linear/lookup_1/range*

SrcT0*
_output_shapes
:*

DstT0	
�
!linear/linear/lookup_1/hash_table	HashTable*
	container *
	key_dtype0*
use_node_name_sharing( *
_output_shapes
:*
value_dtype0	*
shared_name 
r
'linear/linear/lookup_1/hash_table/ConstConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
,linear/linear/lookup_1/hash_table/table_initInitializeTable!linear/linear/lookup_1/hash_tablelinear/linear/lookup_1/Constlinear/linear/lookup_1/ToInt64*

Tval0	*

Tkey0*4
_class*
(&loc:@linear/linear/lookup_1/hash_table
�
linear/linear/hash_table_LookupLookupTableFind!linear/linear/lookup_1/hash_table*linear/linear/DenseToSparseTensor_1/Gather'linear/linear/lookup_1/hash_table/Const*#
_output_shapes
:���������*

Tout0	*	
Tin0*4
_class*
(&loc:@linear/linear/lookup_1/hash_table
�
8linear/num-of-cylinders/weights/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
&linear/num-of-cylinders/weights/part_0
VariableV2*
	container *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
-linear/num-of-cylinders/weights/part_0/AssignAssign&linear/num-of-cylinders/weights/part_08linear/num-of-cylinders/weights/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
+linear/num-of-cylinders/weights/part_0/readIdentity&linear/num-of-cylinders/weights/part_0*
T0*
_output_shapes

:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Clinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 
�
Blinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/SliceSlice(linear/linear/DenseToSparseTensor_1/CastClinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice/beginBlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice/size*
T0	*
_output_shapes
:*
Index0
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
<linear/linear/num-of-cylinders/num-of-cylinders_weights/ProdProd=linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice=linear/linear/num-of-cylinders/num-of-cylinders_weights/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
�
Flinear/linear/num-of-cylinders/num-of-cylinders_weights/Gather/indicesConst*
dtype0*
_output_shapes
: *
value	B :
�
>linear/linear/num-of-cylinders/num-of-cylinders_weights/GatherGather(linear/linear/DenseToSparseTensor_1/CastFlinear/linear/num-of-cylinders/num-of-cylinders_weights/Gather/indices*
_output_shapes
: *
validate_indices(*
Tparams0	*
Tindices0
�
>linear/linear/num-of-cylinders/num-of-cylinders_weights/Cast/xPack<linear/linear/num-of-cylinders/num-of-cylinders_weights/Prod>linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather*
T0	*
_output_shapes
:*
N*

axis 
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshapeSparseReshape)linear/linear/DenseToSparseTensor_1/Where(linear/linear/DenseToSparseTensor_1/Cast>linear/linear/num-of-cylinders/num-of-cylinders_weights/Cast/x*-
_output_shapes
:���������:
�
Nlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape/IdentityIdentitylinear/linear/hash_table_Lookup*
T0	*#
_output_shapes
:���������
�
Flinear/linear/num-of-cylinders/num-of-cylinders_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
Dlinear/linear/num-of-cylinders/num-of-cylinders_weights/GreaterEqualGreaterEqualNlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape/IdentityFlinear/linear/num-of-cylinders/num-of-cylinders_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/WhereWhereDlinear/linear/num-of-cylinders/num-of-cylinders_weights/GreaterEqual*'
_output_shapes
:���������
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/ReshapeReshape=linear/linear/num-of-cylinders/num-of-cylinders_weights/WhereElinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape/shape*
T0	*#
_output_shapes
:���������*
Tshape0
�
@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_1GatherElinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape?linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape*'
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_2GatherNlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape/Identity?linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape*#
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
@linear/linear/num-of-cylinders/num-of-cylinders_weights/IdentityIdentityGlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape:1*
T0	*
_output_shapes
:
�
Qlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
_linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_sliceStridedSlice@linear/linear/num-of-cylinders/num-of-cylinders_weights/Identity_linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stackalinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stack_1alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Plinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/CastCastYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice*

SrcT0	*
_output_shapes
: *

DstT0
�
Wlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
Wlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
Qlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/rangeRangeWlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range/startPlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/CastWlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:���������
�
Rlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Cast_1CastQlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range*

SrcT0*#
_output_shapes
:���������*

DstT0	
�
alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1StridedSlice@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_1alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stackclinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stack_1clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ListDiffListDiffRlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Cast_1[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2StridedSlice@linear/linear/num-of-cylinders/num-of-cylinders_weights/Identityalinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stackclinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stack_1clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Zlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Vlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ExpandDims
ExpandDims[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2Zlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ExpandDims/dim*
T0	*
_output_shapes
:*

Tdim0
�
glinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
_output_shapes
: *
value	B
 Z
�
glinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
_output_shapes
: *
value	B
 Z 
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDenseSparseToDenseTlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ListDiffVlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ExpandDimsglinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesglinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDense/default_value*
T0
*#
_output_shapes
:���������*
validate_indices(*
Tindices0	
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
Slinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ReshapeReshapeTlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ListDiffYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Reshape/shape*
T0	*'
_output_shapes
:���������*
Tshape0
�
Vlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/zeros_like	ZerosLikeSlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:���������
�
Wlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
�
Rlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concatConcatV2Slinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ReshapeVlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/zeros_likeWlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Qlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ShapeShapeTlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ListDiff*
T0	*
out_type0*
_output_shapes
:
�
Plinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/FillFillQlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ShapeQlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:���������
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_1ConcatV2@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_1Rlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concatYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_1/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_2ConcatV2@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_2Plinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/FillYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_2/axis*

Tidx0*
T0	*#
_output_shapes
:���������*
N
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseReorderSparseReorderTlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_1Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_2@linear/linear/num-of-cylinders/num-of-cylinders_weights/Identity*
T0	*6
_output_shapes$
":���������:���������
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/IdentityIdentity@linear/linear/num-of-cylinders/num-of-cylinders_weights/Identity*
T0	*
_output_shapes
:
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
elinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
elinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
]linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_sliceStridedSliceYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseReorderclinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stackelinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stack_1elinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/CastCast]linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:���������*

DstT0
�
Vlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/UniqueUnique[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseReorder:1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
`linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookupGather+linear/num-of-cylinders/weights/part_0/readVlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique*'
_output_shapes
:���������*
validate_indices(*
Tparams0*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
Tindices0	
�
Olinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparseSparseSegmentSum`linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookupXlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique:1Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:���������
�
Glinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
Alinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_1ReshapeYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDenseGlinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_1/shape*
T0
*'
_output_shapes
:���������*
Tshape0
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/ShapeShapeOlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
�
Klinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
Mlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Mlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_sliceStridedSlice=linear/linear/num-of-cylinders/num-of-cylinders_weights/ShapeKlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stackMlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stack_1Mlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/stackPack?linear/linear/num-of-cylinders/num-of-cylinders_weights/stack/0Elinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice*
T0*
_output_shapes
:*
N*

axis 
�
<linear/linear/num-of-cylinders/num-of-cylinders_weights/TileTileAlinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_1=linear/linear/num-of-cylinders/num-of-cylinders_weights/stack*
T0
*0
_output_shapes
:������������������*

Tmultiples0
�
Blinear/linear/num-of-cylinders/num-of-cylinders_weights/zeros_like	ZerosLikeOlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
7linear/linear/num-of-cylinders/num-of-cylinders_weightsSelect<linear/linear/num-of-cylinders/num-of-cylinders_weights/TileBlinear/linear/num-of-cylinders/num-of-cylinders_weights/zeros_likeOlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
>linear/linear/num-of-cylinders/num-of-cylinders_weights/Cast_1Cast(linear/linear/DenseToSparseTensor_1/Cast*

SrcT0	*
_output_shapes
:*

DstT0
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 
�
Dlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1Slice>linear/linear/num-of-cylinders/num-of-cylinders_weights/Cast_1Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1/beginDlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1/size*
T0*
_output_shapes
:*
Index0
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/Shape_1Shape7linear/linear/num-of-cylinders/num-of-cylinders_weights*
T0*
out_type0*
_output_shapes
:
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
�
Dlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2Slice?linear/linear/num-of-cylinders/num-of-cylinders_weights/Shape_1Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2/beginDlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2/size*
T0*
_output_shapes
:*
Index0
�
Clinear/linear/num-of-cylinders/num-of-cylinders_weights/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
>linear/linear/num-of-cylinders/num-of-cylinders_weights/concatConcatV2?linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1?linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2Clinear/linear/num-of-cylinders/num-of-cylinders_weights/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
Alinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2Reshape7linear/linear/num-of-cylinders/num-of-cylinders_weights>linear/linear/num-of-cylinders/num-of-cylinders_weights/concat*
T0*'
_output_shapes
:���������*
Tshape0
n
linear/linear/Reshape_5/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_5ReshapeAlinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2linear/linear/Reshape_5/shape*
T0*'
_output_shapes
:���������*
Tshape0
j
linear/linear/expand_dims_2/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/expand_dims_2
ExpandDims"random_shuffle_queue_DequeueMany:1linear/linear/expand_dims_2/dim*
T0*
_output_shapes

:@*

Tdim0
z
)linear/linear/DenseToSparseTensor_2/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
(linear/linear/DenseToSparseTensor_2/CastCast)linear/linear/DenseToSparseTensor_2/Shape*

SrcT0*
_output_shapes
:*

DstT0	
m
,linear/linear/DenseToSparseTensor_2/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
,linear/linear/DenseToSparseTensor_2/NotEqualNotEquallinear/linear/expand_dims_2,linear/linear/DenseToSparseTensor_2/Cast_1/x*
T0*
_output_shapes

:@
�
)linear/linear/DenseToSparseTensor_2/WhereWhere,linear/linear/DenseToSparseTensor_2/NotEqual*'
_output_shapes
:���������
�
1linear/linear/DenseToSparseTensor_2/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
+linear/linear/DenseToSparseTensor_2/ReshapeReshapelinear/linear/expand_dims_21linear/linear/DenseToSparseTensor_2/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
7linear/linear/DenseToSparseTensor_2/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor_2/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor_2/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
1linear/linear/DenseToSparseTensor_2/strided_sliceStridedSlice)linear/linear/DenseToSparseTensor_2/Where7linear/linear/DenseToSparseTensor_2/strided_slice/stack9linear/linear/DenseToSparseTensor_2/strided_slice/stack_19linear/linear/DenseToSparseTensor_2/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
9linear/linear/DenseToSparseTensor_2/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
;linear/linear/DenseToSparseTensor_2/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
;linear/linear/DenseToSparseTensor_2/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
3linear/linear/DenseToSparseTensor_2/strided_slice_1StridedSlice)linear/linear/DenseToSparseTensor_2/Where9linear/linear/DenseToSparseTensor_2/strided_slice_1/stack;linear/linear/DenseToSparseTensor_2/strided_slice_1/stack_1;linear/linear/DenseToSparseTensor_2/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
+linear/linear/DenseToSparseTensor_2/unstackUnpack(linear/linear/DenseToSparseTensor_2/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
)linear/linear/DenseToSparseTensor_2/stackPack-linear/linear/DenseToSparseTensor_2/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
'linear/linear/DenseToSparseTensor_2/MulMul3linear/linear/DenseToSparseTensor_2/strided_slice_1)linear/linear/DenseToSparseTensor_2/stack*
T0	*'
_output_shapes
:���������
�
9linear/linear/DenseToSparseTensor_2/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
'linear/linear/DenseToSparseTensor_2/SumSum'linear/linear/DenseToSparseTensor_2/Mul9linear/linear/DenseToSparseTensor_2/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
'linear/linear/DenseToSparseTensor_2/AddAdd1linear/linear/DenseToSparseTensor_2/strided_slice'linear/linear/DenseToSparseTensor_2/Sum*
T0	*#
_output_shapes
:���������
�
*linear/linear/DenseToSparseTensor_2/GatherGather+linear/linear/DenseToSparseTensor_2/Reshape'linear/linear/DenseToSparseTensor_2/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
n
linear/linear/lookup_2/ConstConst*
dtype0*
_output_shapes
:*
valueBBtwoBfour
]
linear/linear/lookup_2/SizeConst*
dtype0*
_output_shapes
: *
value	B :
d
"linear/linear/lookup_2/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
d
"linear/linear/lookup_2/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
linear/linear/lookup_2/rangeRange"linear/linear/lookup_2/range/startlinear/linear/lookup_2/Size"linear/linear/lookup_2/range/delta*

Tidx0*
_output_shapes
:
x
linear/linear/lookup_2/ToInt64Castlinear/linear/lookup_2/range*

SrcT0*
_output_shapes
:*

DstT0	
�
!linear/linear/lookup_2/hash_table	HashTable*
	container *
	key_dtype0*
use_node_name_sharing( *
_output_shapes
:*
value_dtype0	*
shared_name 
r
'linear/linear/lookup_2/hash_table/ConstConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
,linear/linear/lookup_2/hash_table/table_initInitializeTable!linear/linear/lookup_2/hash_tablelinear/linear/lookup_2/Constlinear/linear/lookup_2/ToInt64*

Tval0	*

Tkey0*4
_class*
(&loc:@linear/linear/lookup_2/hash_table
�
!linear/linear/hash_table_Lookup_1LookupTableFind!linear/linear/lookup_2/hash_table*linear/linear/DenseToSparseTensor_2/Gather'linear/linear/lookup_2/hash_table/Const*#
_output_shapes
:���������*

Tout0	*	
Tin0*4
_class*
(&loc:@linear/linear/lookup_2/hash_table
�
4linear/num-of-doors/weights/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
"linear/num-of-doors/weights/part_0
VariableV2*
	container *5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
)linear/num-of-doors/weights/part_0/AssignAssign"linear/num-of-doors/weights/part_04linear/num-of-doors/weights/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
'linear/num-of-doors/weights/part_0/readIdentity"linear/num-of-doors/weights/part_0*
T0*
_output_shapes

:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
;linear/linear/num-of-doors/num-of-doors_weights/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 
�
:linear/linear/num-of-doors/num-of-doors_weights/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
5linear/linear/num-of-doors/num-of-doors_weights/SliceSlice(linear/linear/DenseToSparseTensor_2/Cast;linear/linear/num-of-doors/num-of-doors_weights/Slice/begin:linear/linear/num-of-doors/num-of-doors_weights/Slice/size*
T0	*
_output_shapes
:*
Index0

5linear/linear/num-of-doors/num-of-doors_weights/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
4linear/linear/num-of-doors/num-of-doors_weights/ProdProd5linear/linear/num-of-doors/num-of-doors_weights/Slice5linear/linear/num-of-doors/num-of-doors_weights/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
�
>linear/linear/num-of-doors/num-of-doors_weights/Gather/indicesConst*
dtype0*
_output_shapes
: *
value	B :
�
6linear/linear/num-of-doors/num-of-doors_weights/GatherGather(linear/linear/DenseToSparseTensor_2/Cast>linear/linear/num-of-doors/num-of-doors_weights/Gather/indices*
_output_shapes
: *
validate_indices(*
Tparams0	*
Tindices0
�
6linear/linear/num-of-doors/num-of-doors_weights/Cast/xPack4linear/linear/num-of-doors/num-of-doors_weights/Prod6linear/linear/num-of-doors/num-of-doors_weights/Gather*
T0	*
_output_shapes
:*
N*

axis 
�
=linear/linear/num-of-doors/num-of-doors_weights/SparseReshapeSparseReshape)linear/linear/DenseToSparseTensor_2/Where(linear/linear/DenseToSparseTensor_2/Cast6linear/linear/num-of-doors/num-of-doors_weights/Cast/x*-
_output_shapes
:���������:
�
Flinear/linear/num-of-doors/num-of-doors_weights/SparseReshape/IdentityIdentity!linear/linear/hash_table_Lookup_1*
T0	*#
_output_shapes
:���������
�
>linear/linear/num-of-doors/num-of-doors_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
<linear/linear/num-of-doors/num-of-doors_weights/GreaterEqualGreaterEqualFlinear/linear/num-of-doors/num-of-doors_weights/SparseReshape/Identity>linear/linear/num-of-doors/num-of-doors_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
5linear/linear/num-of-doors/num-of-doors_weights/WhereWhere<linear/linear/num-of-doors/num-of-doors_weights/GreaterEqual*'
_output_shapes
:���������
�
=linear/linear/num-of-doors/num-of-doors_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
7linear/linear/num-of-doors/num-of-doors_weights/ReshapeReshape5linear/linear/num-of-doors/num-of-doors_weights/Where=linear/linear/num-of-doors/num-of-doors_weights/Reshape/shape*
T0	*#
_output_shapes
:���������*
Tshape0
�
8linear/linear/num-of-doors/num-of-doors_weights/Gather_1Gather=linear/linear/num-of-doors/num-of-doors_weights/SparseReshape7linear/linear/num-of-doors/num-of-doors_weights/Reshape*'
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
8linear/linear/num-of-doors/num-of-doors_weights/Gather_2GatherFlinear/linear/num-of-doors/num-of-doors_weights/SparseReshape/Identity7linear/linear/num-of-doors/num-of-doors_weights/Reshape*#
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
8linear/linear/num-of-doors/num-of-doors_weights/IdentityIdentity?linear/linear/num-of-doors/num-of-doors_weights/SparseReshape:1*
T0	*
_output_shapes
:
�
Ilinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
Wlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_sliceStridedSlice8linear/linear/num-of-doors/num-of-doors_weights/IdentityWlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stackYlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stack_1Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Hlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/CastCastQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice*

SrcT0	*
_output_shapes
: *

DstT0
�
Olinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
Olinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
Ilinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/rangeRangeOlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range/startHlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/CastOlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:���������
�
Jlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Cast_1CastIlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range*

SrcT0*#
_output_shapes
:���������*

DstT0	
�
Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
Slinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1StridedSlice8linear/linear/num-of-doors/num-of-doors_weights/Gather_1Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack_1[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ListDiffListDiffJlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Cast_1Slinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Slinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2StridedSlice8linear/linear/num-of-doors/num-of-doors_weights/IdentityYlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack_1[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Rlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Nlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ExpandDims
ExpandDimsSlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2Rlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ExpandDims/dim*
T0	*
_output_shapes
:*

Tdim0
�
_linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
_output_shapes
: *
value	B
 Z
�
_linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
_output_shapes
: *
value	B
 Z 
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDenseSparseToDenseLlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ListDiffNlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ExpandDims_linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense/sparse_values_linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense/default_value*
T0
*#
_output_shapes
:���������*
validate_indices(*
Tindices0	
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
Klinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ReshapeReshapeLlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ListDiffQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Reshape/shape*
T0	*'
_output_shapes
:���������*
Tshape0
�
Nlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/zeros_like	ZerosLikeKlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:���������
�
Olinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
�
Jlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concatConcatV2Klinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ReshapeNlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/zeros_likeOlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Ilinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ShapeShapeLlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ListDiff*
T0	*
out_type0*
_output_shapes
:
�
Hlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/FillFillIlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ShapeIlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:���������
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_1ConcatV28linear/linear/num-of-doors/num-of-doors_weights/Gather_1Jlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concatQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_1/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_2ConcatV28linear/linear/num-of-doors/num-of-doors_weights/Gather_2Hlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/FillQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_2/axis*

Tidx0*
T0	*#
_output_shapes
:���������*
N
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseReorderSparseReorderLlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_1Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_28linear/linear/num-of-doors/num-of-doors_weights/Identity*
T0	*6
_output_shapes$
":���������:���������
�
Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/IdentityIdentity8linear/linear/num-of-doors/num-of-doors_weights/Identity*
T0	*
_output_shapes
:
�
[linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
]linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
]linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
Ulinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_sliceStridedSliceQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseReorder[linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack]linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack_1]linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
Llinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/CastCastUlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:���������*

DstT0
�
Nlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/UniqueUniqueSlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseReorder:1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
Xlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookupGather'linear/num-of-doors/weights/part_0/readNlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique*'
_output_shapes
:���������*
validate_indices(*
Tparams0*5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
Tindices0	
�
Glinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparseSparseSegmentSumXlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookupPlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique:1Llinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:���������
�
?linear/linear/num-of-doors/num-of-doors_weights/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
9linear/linear/num-of-doors/num-of-doors_weights/Reshape_1ReshapeQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense?linear/linear/num-of-doors/num-of-doors_weights/Reshape_1/shape*
T0
*'
_output_shapes
:���������*
Tshape0
�
5linear/linear/num-of-doors/num-of-doors_weights/ShapeShapeGlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
�
Clinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
Elinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Elinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
=linear/linear/num-of-doors/num-of-doors_weights/strided_sliceStridedSlice5linear/linear/num-of-doors/num-of-doors_weights/ShapeClinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stackElinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stack_1Elinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
y
7linear/linear/num-of-doors/num-of-doors_weights/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
�
5linear/linear/num-of-doors/num-of-doors_weights/stackPack7linear/linear/num-of-doors/num-of-doors_weights/stack/0=linear/linear/num-of-doors/num-of-doors_weights/strided_slice*
T0*
_output_shapes
:*
N*

axis 
�
4linear/linear/num-of-doors/num-of-doors_weights/TileTile9linear/linear/num-of-doors/num-of-doors_weights/Reshape_15linear/linear/num-of-doors/num-of-doors_weights/stack*
T0
*0
_output_shapes
:������������������*

Tmultiples0
�
:linear/linear/num-of-doors/num-of-doors_weights/zeros_like	ZerosLikeGlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
/linear/linear/num-of-doors/num-of-doors_weightsSelect4linear/linear/num-of-doors/num-of-doors_weights/Tile:linear/linear/num-of-doors/num-of-doors_weights/zeros_likeGlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
6linear/linear/num-of-doors/num-of-doors_weights/Cast_1Cast(linear/linear/DenseToSparseTensor_2/Cast*

SrcT0	*
_output_shapes
:*

DstT0
�
=linear/linear/num-of-doors/num-of-doors_weights/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 
�
<linear/linear/num-of-doors/num-of-doors_weights/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
7linear/linear/num-of-doors/num-of-doors_weights/Slice_1Slice6linear/linear/num-of-doors/num-of-doors_weights/Cast_1=linear/linear/num-of-doors/num-of-doors_weights/Slice_1/begin<linear/linear/num-of-doors/num-of-doors_weights/Slice_1/size*
T0*
_output_shapes
:*
Index0
�
7linear/linear/num-of-doors/num-of-doors_weights/Shape_1Shape/linear/linear/num-of-doors/num-of-doors_weights*
T0*
out_type0*
_output_shapes
:
�
=linear/linear/num-of-doors/num-of-doors_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
�
<linear/linear/num-of-doors/num-of-doors_weights/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
7linear/linear/num-of-doors/num-of-doors_weights/Slice_2Slice7linear/linear/num-of-doors/num-of-doors_weights/Shape_1=linear/linear/num-of-doors/num-of-doors_weights/Slice_2/begin<linear/linear/num-of-doors/num-of-doors_weights/Slice_2/size*
T0*
_output_shapes
:*
Index0
}
;linear/linear/num-of-doors/num-of-doors_weights/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
6linear/linear/num-of-doors/num-of-doors_weights/concatConcatV27linear/linear/num-of-doors/num-of-doors_weights/Slice_17linear/linear/num-of-doors/num-of-doors_weights/Slice_2;linear/linear/num-of-doors/num-of-doors_weights/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
9linear/linear/num-of-doors/num-of-doors_weights/Reshape_2Reshape/linear/linear/num-of-doors/num-of-doors_weights6linear/linear/num-of-doors/num-of-doors_weights/concat*
T0*'
_output_shapes
:���������*
Tshape0
n
linear/linear/Reshape_6/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_6Reshape9linear/linear/num-of-doors/num-of-doors_weights/Reshape_2linear/linear/Reshape_6/shape*
T0*'
_output_shapes
:���������*
Tshape0
�
linear/linear/AddNAddNlinear/linear/Reshapelinear/linear/Reshape_1linear/linear/Reshape_2linear/linear/Reshape_3linear/linear/Reshape_4linear/linear/Reshape_5linear/linear/Reshape_6*
T0*
_output_shapes

:@*
N
�
+linear/bias_weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *,
_class"
 loc:@linear/bias_weight/part_0
�
linear/bias_weight/part_0
VariableV2*
	container *,
_class"
 loc:@linear/bias_weight/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
 linear/bias_weight/part_0/AssignAssignlinear/bias_weight/part_0+linear/bias_weight/part_0/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
�
linear/bias_weight/part_0/readIdentitylinear/bias_weight/part_0*
T0*
_output_shapes
:*,
_class"
 loc:@linear/bias_weight/part_0
c
linear/bias_weightIdentitylinear/bias_weight/part_0/read*
T0*
_output_shapes
:
�
linear/linear/BiasAddBiasAddlinear/linear/AddNlinear/bias_weight*
T0*
_output_shapes

:@*
data_formatNHWC
�
)linear/regression_head/predictions/scoresSqueezelinear/linear/BiasAdd*
T0*
_output_shapes
:@*
squeeze_dims

�
+linear/regression_head/predictions/IdentityIdentity)linear/regression_head/predictions/scores*
T0*
_output_shapes
:@
�
7linear/regression_head/mean_squared_loss/ExpandDims/dimConst*
dtype0*
_output_shapes
:*
valueB:
�
3linear/regression_head/mean_squared_loss/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:87linear/regression_head/mean_squared_loss/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
,linear/regression_head/mean_squared_loss/subSublinear/linear/BiasAdd3linear/regression_head/mean_squared_loss/ExpandDims*
T0*
_output_shapes

:@
�
(linear/regression_head/mean_squared_lossSquare,linear/regression_head/mean_squared_loss/sub*
T0*
_output_shapes

:@
�
3linear/regression_head/mean_squared_loss/loss/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
-linear/regression_head/mean_squared_loss/lossMean(linear/regression_head/mean_squared_loss3linear/regression_head/mean_squared_loss/loss/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
n
)linear/regression_head/ScalarSummary/tagsConst*
dtype0*
_output_shapes
: *
valueB
 Bloss
�
$linear/regression_head/ScalarSummaryScalarSummary)linear/regression_head/ScalarSummary/tags-linear/regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: 
m
linear/regression_head/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
t
*linear/regression_head/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
v
,linear/regression_head/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
v
,linear/regression_head/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
$linear/regression_head/strided_sliceStridedSlicelinear/regression_head/Shape*linear/regression_head/strided_slice/stack,linear/regression_head/strided_slice/stack_1,linear/regression_head/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
r
/linear/regression_head/train_op/gradients/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
t
/linear/regression_head/train_op/gradients/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
.linear/regression_head/train_op/gradients/FillFill/linear/regression_head/train_op/gradients/Shape/linear/regression_head/train_op/gradients/Const*
T0*
_output_shapes
: 
�
jlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"      
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/ReshapeReshape.linear/regression_head/train_op/gradients/Filljlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Reshape/shape*
T0*
_output_shapes

:*
Tshape0
�
klinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Tile/multiplesConst*
dtype0*
_output_shapes
:*
valueB"@      
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/TileTiledlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Reshapeklinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Tile/multiples*
T0*
_output_shapes

:@*

Tmultiples0
�
blinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Shape_1Const*
dtype0*
_output_shapes
: *
valueB 
�
blinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/ProdProdblinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Shapeblinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
clinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Prod_1Proddlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Shape_1dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Const_1*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
flinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Maximum/yConst*
dtype0*
_output_shapes
: *
value	B :
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/MaximumMaximumclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Prod_1flinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Maximum/y*
T0*
_output_shapes
: 
�
elinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/floordivFloorDivalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Proddlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Maximum*
T0*
_output_shapes
: 
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/CastCastelinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/truedivRealDivalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Tilealinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Cast*
T0*
_output_shapes

:@
�
]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul/xConste^linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/truediv*
dtype0*
_output_shapes
: *
valueB
 *   @
�
[linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mulMul]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul/x,linear/regression_head/mean_squared_loss/sub*
T0*
_output_shapes

:@
�
]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul_1Muldlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/truediv[linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul*
T0*
_output_shapes

:@
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
clinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB"@      
�
qlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgsBroadcastGradientArgsalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
_linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/SumSum]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul_1qlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgs*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
�
clinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeReshape_linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Sumalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Sum_1Sum]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul_1slinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
�
_linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/NegNegalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Sum_1*
T0*
_output_shapes
:
�
elinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Reshape_1Reshape_linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Negclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shape_1*
T0*
_output_shapes

:@*
Tshape0
�
Plinear/regression_head/train_op/gradients/linear/linear/BiasAdd_grad/BiasAddGradBiasAddGradclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Reshape*
T0*
_output_shapes
:*
data_formatNHWC
�
Jlinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeJlinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_4_grad/ShapeShape)linear/linear/make/make_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_4_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_4_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_5_grad/ShapeShapeAlinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_5_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_5_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_6_grad/ShapeShape9linear/linear/num-of-doors/num-of-doors_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_6_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_6_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Qlinear/regression_head/train_op/gradients/linear/linear/height/matmul_grad/MatMulMatMulLlinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/Reshapelinear/height/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Slinear/regression_head/train_op/gradients/linear/linear/height/matmul_grad/MatMul_1MatMullinear/linear/height/ExpandDimsLlinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/Reshape*
T0*
_output_shapes

:*
transpose_a(*
transpose_b( 
�
Ulinear/regression_head/train_op/gradients/linear/linear/horsepower/matmul_grad/MatMulMatMulNlinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/Reshapelinear/horsepower/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Wlinear/regression_head/train_op/gradients/linear/linear/horsepower/matmul_grad/MatMul_1MatMul#linear/linear/horsepower/ExpandDimsNlinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/Reshape*
T0*
_output_shapes

:*
transpose_a(*
transpose_b( 
�
Qlinear/regression_head/train_op/gradients/linear/linear/length/matmul_grad/MatMulMatMulNlinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/Reshapelinear/length/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Slinear/regression_head/train_op/gradients/linear/linear/length/matmul_grad/MatMul_1MatMullinear/linear/length/ExpandDimsNlinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/Reshape*
T0*
_output_shapes

:*
transpose_a(*
transpose_b( 
�
Plinear/regression_head/train_op/gradients/linear/linear/width/matmul_grad/MatMulMatMulNlinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/Reshapelinear/width/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Rlinear/regression_head/train_op/gradients/linear/linear/width/matmul_grad/MatMul_1MatMullinear/linear/width/ExpandDimsNlinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/Reshape*
T0*
_output_shapes

:*
transpose_a(*
transpose_b( 
�
^linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/ShapeShapelinear/linear/make/make_weights*
T0*
out_type0*
_output_shapes
:
�
`linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/ReshapeReshapeNlinear/regression_head/train_op/gradients/linear/linear/Reshape_4_grad/Reshape^linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
vlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/ShapeShape7linear/linear/num-of-cylinders/num-of-cylinders_weights*
T0*
out_type0*
_output_shapes
:
�
xlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/ReshapeReshapeNlinear/regression_head/train_op/gradients/linear/linear/Reshape_5_grad/Reshapevlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
nlinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/ShapeShape/linear/linear/num-of-doors/num-of-doors_weights*
T0*
out_type0*
_output_shapes
:
�
plinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/ReshapeReshapeNlinear/regression_head/train_op/gradients/linear/linear/Reshape_6_grad/Reshapenlinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Ylinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/zeros_like	ZerosLike*linear/linear/make/make_weights/zeros_like*
T0*'
_output_shapes
:���������
�
Ulinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/SelectSelect$linear/linear/make/make_weights/Tile`linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/ReshapeYlinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/zeros_like*
T0*
_output_shapes

:@
�
Wlinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/Select_1Select$linear/linear/make/make_weights/TileYlinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/zeros_like`linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/Reshape*
T0*
_output_shapes

:@
�
qlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/zeros_like	ZerosLikeBlinear/linear/num-of-cylinders/num-of-cylinders_weights/zeros_like*
T0*'
_output_shapes
:���������
�
mlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/SelectSelect<linear/linear/num-of-cylinders/num-of-cylinders_weights/Tilexlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/Reshapeqlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/zeros_like*
T0*
_output_shapes

:@
�
olinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/Select_1Select<linear/linear/num-of-cylinders/num-of-cylinders_weights/Tileqlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/zeros_likexlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/Reshape*
T0*
_output_shapes

:@
�
ilinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/zeros_like	ZerosLike:linear/linear/num-of-doors/num-of-doors_weights/zeros_like*
T0*'
_output_shapes
:���������
�
elinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/SelectSelect4linear/linear/num-of-doors/num-of-doors_weights/Tileplinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/Reshapeilinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/zeros_like*
T0*
_output_shapes

:@
�
glinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/Select_1Select4linear/linear/num-of-doors/num-of-doors_weights/Tileilinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/zeros_likeplinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/Reshape*
T0*
_output_shapes

:@
�
llinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/ShapeShapeHlinear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup*
T0*
out_type0*
_output_shapes
:
�
zlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
tlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_sliceStridedSlicellinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/Shapezlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack_1|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
�
mlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/GatherGatherWlinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/Select_1<linear/linear/make/make_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0
�
ylinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/UnsortedSegmentSumUnsortedSegmentSummlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/Gather@linear/linear/make/make_weights/embedding_lookup_sparse/Unique:1tlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice*
T0*'
_output_shapes
:���������*
Tindices0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/ShapeShape`linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup*
T0*
out_type0*
_output_shapes
:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_sliceStridedSlice�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/GatherGatherolinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/Select_1Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/UnsortedSegmentSumUnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/GatherXlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique:1�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice*
T0*'
_output_shapes
:���������*
Tindices0
�
|linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/ShapeShapeXlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup*
T0*
out_type0*
_output_shapes
:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_sliceStridedSlice|linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
�
}linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/GatherGatherglinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/Select_1Llinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/UnsortedSegmentSumUnsortedSegmentSum}linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/GatherPlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique:1�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice*
T0*'
_output_shapes
:���������*
Tindices0
�
}linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"2      *-
_class#
!loc:@linear/make/weights/part_0
�
|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/SizeSize>linear/linear/make/make_weights/embedding_lookup_sparse/Unique*
T0	*
out_type0*
_output_shapes
: 
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims
ExpandDims|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/Size�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_sliceStridedSlice}linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
:*

begin_mask *
Index0
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
~linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/concatConcatV2�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeReshapeylinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/UnsortedSegmentSum~linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/concat*
T0*0
_output_shapes
:������������������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1Reshape>linear/linear/make/make_weights/embedding_lookup_sparse/Unique�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims*
T0	*#
_output_shapes
:���������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"      *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/SizeSizeVlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique*
T0	*
out_type0*
_output_shapes
: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims
ExpandDims�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Size�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_sliceStridedSlice�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
:*

begin_mask *
Index0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/concatConcatV2�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeReshape�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/UnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/concat*
T0*0
_output_shapes
:������������������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1ReshapeVlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims*
T0	*#
_output_shapes
:���������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"      *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/SizeSizeNlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique*
T0	*
out_type0*
_output_shapes
: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims
ExpandDims�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/Size�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_sliceStridedSlice�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
:*

begin_mask *
Index0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/concatConcatV2�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeReshape�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/UnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/concat*
T0*0
_output_shapes
:������������������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1ReshapeNlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims*
T0	*#
_output_shapes
:���������*
Tshape0
�
%linear/regression_head/train_op/ConstConst*
dtype0*
_output_shapes

:*
valueB*���=*.
_class$
" loc:@linear/height/weight/part_0
�
7linear/regression_head/linear/height/weight/part_0/Ftrl
VariableV2*
	container *.
_class$
" loc:@linear/height/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
>linear/regression_head/linear/height/weight/part_0/Ftrl/AssignAssign7linear/regression_head/linear/height/weight/part_0/Ftrl%linear/regression_head/train_op/Const*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
�
<linear/regression_head/linear/height/weight/part_0/Ftrl/readIdentity7linear/regression_head/linear/height/weight/part_0/Ftrl*
T0*
_output_shapes

:*.
_class$
" loc:@linear/height/weight/part_0
�
Klinear/regression_head/linear/height/weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *.
_class$
" loc:@linear/height/weight/part_0
�
9linear/regression_head/linear/height/weight/part_0/Ftrl_1
VariableV2*
	container *.
_class$
" loc:@linear/height/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
@linear/regression_head/linear/height/weight/part_0/Ftrl_1/AssignAssign9linear/regression_head/linear/height/weight/part_0/Ftrl_1Klinear/regression_head/linear/height/weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
�
>linear/regression_head/linear/height/weight/part_0/Ftrl_1/readIdentity9linear/regression_head/linear/height/weight/part_0/Ftrl_1*
T0*
_output_shapes

:*.
_class$
" loc:@linear/height/weight/part_0
�
'linear/regression_head/train_op/Const_1Const*
dtype0*
_output_shapes

:*
valueB*���=*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
;linear/regression_head/linear/horsepower/weight/part_0/Ftrl
VariableV2*
	container *2
_class(
&$loc:@linear/horsepower/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Blinear/regression_head/linear/horsepower/weight/part_0/Ftrl/AssignAssign;linear/regression_head/linear/horsepower/weight/part_0/Ftrl'linear/regression_head/train_op/Const_1*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
@linear/regression_head/linear/horsepower/weight/part_0/Ftrl/readIdentity;linear/regression_head/linear/horsepower/weight/part_0/Ftrl*
T0*
_output_shapes

:*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
Olinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1
VariableV2*
	container *2
_class(
&$loc:@linear/horsepower/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Dlinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/AssignAssign=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1Olinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
Blinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/readIdentity=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1*
T0*
_output_shapes

:*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
'linear/regression_head/train_op/Const_2Const*
dtype0*
_output_shapes

:*
valueB*���=*.
_class$
" loc:@linear/length/weight/part_0
�
7linear/regression_head/linear/length/weight/part_0/Ftrl
VariableV2*
	container *.
_class$
" loc:@linear/length/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
>linear/regression_head/linear/length/weight/part_0/Ftrl/AssignAssign7linear/regression_head/linear/length/weight/part_0/Ftrl'linear/regression_head/train_op/Const_2*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
�
<linear/regression_head/linear/length/weight/part_0/Ftrl/readIdentity7linear/regression_head/linear/length/weight/part_0/Ftrl*
T0*
_output_shapes

:*.
_class$
" loc:@linear/length/weight/part_0
�
Klinear/regression_head/linear/length/weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *.
_class$
" loc:@linear/length/weight/part_0
�
9linear/regression_head/linear/length/weight/part_0/Ftrl_1
VariableV2*
	container *.
_class$
" loc:@linear/length/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
@linear/regression_head/linear/length/weight/part_0/Ftrl_1/AssignAssign9linear/regression_head/linear/length/weight/part_0/Ftrl_1Klinear/regression_head/linear/length/weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
�
>linear/regression_head/linear/length/weight/part_0/Ftrl_1/readIdentity9linear/regression_head/linear/length/weight/part_0/Ftrl_1*
T0*
_output_shapes

:*.
_class$
" loc:@linear/length/weight/part_0
�
'linear/regression_head/train_op/Const_3Const*
dtype0*
_output_shapes

:*
valueB*���=*-
_class#
!loc:@linear/width/weight/part_0
�
6linear/regression_head/linear/width/weight/part_0/Ftrl
VariableV2*
	container *-
_class#
!loc:@linear/width/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
=linear/regression_head/linear/width/weight/part_0/Ftrl/AssignAssign6linear/regression_head/linear/width/weight/part_0/Ftrl'linear/regression_head/train_op/Const_3*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
;linear/regression_head/linear/width/weight/part_0/Ftrl/readIdentity6linear/regression_head/linear/width/weight/part_0/Ftrl*
T0*
_output_shapes

:*-
_class#
!loc:@linear/width/weight/part_0
�
Jlinear/regression_head/linear/width/weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *-
_class#
!loc:@linear/width/weight/part_0
�
8linear/regression_head/linear/width/weight/part_0/Ftrl_1
VariableV2*
	container *-
_class#
!loc:@linear/width/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
?linear/regression_head/linear/width/weight/part_0/Ftrl_1/AssignAssign8linear/regression_head/linear/width/weight/part_0/Ftrl_1Jlinear/regression_head/linear/width/weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
=linear/regression_head/linear/width/weight/part_0/Ftrl_1/readIdentity8linear/regression_head/linear/width/weight/part_0/Ftrl_1*
T0*
_output_shapes

:*-
_class#
!loc:@linear/width/weight/part_0
�
'linear/regression_head/train_op/Const_4Const*
dtype0*
_output_shapes

:2*
valueB2*���=*-
_class#
!loc:@linear/make/weights/part_0
�
6linear/regression_head/linear/make/weights/part_0/Ftrl
VariableV2*
	container *-
_class#
!loc:@linear/make/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
=linear/regression_head/linear/make/weights/part_0/Ftrl/AssignAssign6linear/regression_head/linear/make/weights/part_0/Ftrl'linear/regression_head/train_op/Const_4*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
;linear/regression_head/linear/make/weights/part_0/Ftrl/readIdentity6linear/regression_head/linear/make/weights/part_0/Ftrl*
T0*
_output_shapes

:2*-
_class#
!loc:@linear/make/weights/part_0
�
Jlinear/regression_head/linear/make/weights/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:2*
valueB2*    *-
_class#
!loc:@linear/make/weights/part_0
�
8linear/regression_head/linear/make/weights/part_0/Ftrl_1
VariableV2*
	container *-
_class#
!loc:@linear/make/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
?linear/regression_head/linear/make/weights/part_0/Ftrl_1/AssignAssign8linear/regression_head/linear/make/weights/part_0/Ftrl_1Jlinear/regression_head/linear/make/weights/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
=linear/regression_head/linear/make/weights/part_0/Ftrl_1/readIdentity8linear/regression_head/linear/make/weights/part_0/Ftrl_1*
T0*
_output_shapes

:2*-
_class#
!loc:@linear/make/weights/part_0
�
'linear/regression_head/train_op/Const_5Const*
dtype0*
_output_shapes

:*
valueB*���=*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Blinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl
VariableV2*
	container *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Ilinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl/AssignAssignBlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl'linear/regression_head/train_op/Const_5*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Glinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl/readIdentityBlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl*
T0*
_output_shapes

:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Vlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Dlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1
VariableV2*
	container *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Klinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/AssignAssignDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1Vlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Ilinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/readIdentityDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1*
T0*
_output_shapes

:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
'linear/regression_head/train_op/Const_6Const*
dtype0*
_output_shapes

:*
valueB*���=*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl
VariableV2*
	container *5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Elinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl/AssignAssign>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl'linear/regression_head/train_op/Const_6*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Clinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl/readIdentity>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl*
T0*
_output_shapes

:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Rlinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1
VariableV2*
	container *5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Glinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/AssignAssign@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1Rlinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Elinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/readIdentity@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1*
T0*
_output_shapes

:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
'linear/regression_head/train_op/Const_7Const*
dtype0*
_output_shapes
:*
valueB*���=*,
_class"
 loc:@linear/bias_weight/part_0
�
5linear/regression_head/linear/bias_weight/part_0/Ftrl
VariableV2*
	container *,
_class"
 loc:@linear/bias_weight/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
<linear/regression_head/linear/bias_weight/part_0/Ftrl/AssignAssign5linear/regression_head/linear/bias_weight/part_0/Ftrl'linear/regression_head/train_op/Const_7*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
�
:linear/regression_head/linear/bias_weight/part_0/Ftrl/readIdentity5linear/regression_head/linear/bias_weight/part_0/Ftrl*
T0*
_output_shapes
:*,
_class"
 loc:@linear/bias_weight/part_0
�
Ilinear/regression_head/linear/bias_weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *,
_class"
 loc:@linear/bias_weight/part_0
�
7linear/regression_head/linear/bias_weight/part_0/Ftrl_1
VariableV2*
	container *,
_class"
 loc:@linear/bias_weight/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
>linear/regression_head/linear/bias_weight/part_0/Ftrl_1/AssignAssign7linear/regression_head/linear/bias_weight/part_0/Ftrl_1Ilinear/regression_head/linear/bias_weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
�
<linear/regression_head/linear/bias_weight/part_0/Ftrl_1/readIdentity7linear/regression_head/linear/bias_weight/part_0/Ftrl_1*
T0*
_output_shapes
:*,
_class"
 loc:@linear/bias_weight/part_0
w
2linear/regression_head/train_op/Ftrl/learning_rateConst*
dtype0*
_output_shapes
: *
valueB
 *��L>
�
?linear/regression_head/train_op/Ftrl/l1_regularization_strengthConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
?linear/regression_head/train_op/Ftrl/l2_regularization_strengthConst*
dtype0*
_output_shapes
: *
valueB
 *    
}
8linear/regression_head/train_op/Ftrl/learning_rate_powerConst*
dtype0*
_output_shapes
: *
valueB
 *   �
�
Qlinear/regression_head/train_op/Ftrl/update_linear/height/weight/part_0/ApplyFtrl	ApplyFtrllinear/height/weight/part_07linear/regression_head/linear/height/weight/part_0/Ftrl9linear/regression_head/linear/height/weight/part_0/Ftrl_1Slinear/regression_head/train_op/gradients/linear/linear/height/matmul_grad/MatMul_12linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *.
_class$
" loc:@linear/height/weight/part_0
�
Ulinear/regression_head/train_op/Ftrl/update_linear/horsepower/weight/part_0/ApplyFtrl	ApplyFtrllinear/horsepower/weight/part_0;linear/regression_head/linear/horsepower/weight/part_0/Ftrl=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1Wlinear/regression_head/train_op/gradients/linear/linear/horsepower/matmul_grad/MatMul_12linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
Qlinear/regression_head/train_op/Ftrl/update_linear/length/weight/part_0/ApplyFtrl	ApplyFtrllinear/length/weight/part_07linear/regression_head/linear/length/weight/part_0/Ftrl9linear/regression_head/linear/length/weight/part_0/Ftrl_1Slinear/regression_head/train_op/gradients/linear/linear/length/matmul_grad/MatMul_12linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *.
_class$
" loc:@linear/length/weight/part_0
�
Plinear/regression_head/train_op/Ftrl/update_linear/width/weight/part_0/ApplyFtrl	ApplyFtrllinear/width/weight/part_06linear/regression_head/linear/width/weight/part_0/Ftrl8linear/regression_head/linear/width/weight/part_0/Ftrl_1Rlinear/regression_head/train_op/gradients/linear/linear/width/matmul_grad/MatMul_12linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *-
_class#
!loc:@linear/width/weight/part_0
�
Mlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/UniqueUnique�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0*-
_class#
!loc:@linear/make/weights/part_0
�
Llinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/ShapeShapeMlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/Unique*
T0	*
out_type0*
_output_shapes
:*-
_class#
!loc:@linear/make/weights/part_0
�
Zlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: *-
_class#
!loc:@linear/make/weights/part_0
�
\linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:*-
_class#
!loc:@linear/make/weights/part_0
�
\linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:*-
_class#
!loc:@linear/make/weights/part_0
�
Tlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_sliceStridedSliceLlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/ShapeZlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack\linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack_1\linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *
Index0*

begin_mask *-
_class#
!loc:@linear/make/weights/part_0
�
Ylinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/UnsortedSegmentSumUnsortedSegmentSumlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeOlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/Unique:1Tlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice*
T0*0
_output_shapes
:������������������*-
_class#
!loc:@linear/make/weights/part_0*
Tindices0
�
Vlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/SparseApplyFtrlSparseApplyFtrllinear/make/weights/part_06linear/regression_head/linear/make/weights/part_0/Ftrl8linear/regression_head/linear/make/weights/part_0/Ftrl_1Ylinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/UnsortedSegmentSumMlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/Unique2linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:2*
use_locking( *
Tindices0	*-
_class#
!loc:@linear/make/weights/part_0
�
Ylinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/UniqueUnique�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Xlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/ShapeShapeYlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/Unique*
T0	*
out_type0*
_output_shapes
:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
flinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
hlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
hlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
`linear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_sliceStridedSliceXlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/Shapeflinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stackhlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stack_1hlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *
Index0*

begin_mask *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
elinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/UnsortedSegmentSumUnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape[linear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/Unique:1`linear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice*
T0*0
_output_shapes
:������������������*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
Tindices0
�
blinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/SparseApplyFtrlSparseApplyFtrl&linear/num-of-cylinders/weights/part_0Blinear/regression_head/linear/num-of-cylinders/weights/part_0/FtrlDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1elinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/UnsortedSegmentSumYlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/Unique2linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *
Tindices0	*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Ulinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/UniqueUnique�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Tlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/ShapeShapeUlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/Unique*
T0	*
out_type0*
_output_shapes
:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
blinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
dlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
dlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
\linear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_sliceStridedSliceTlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/Shapeblinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stackdlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stack_1dlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *
Index0*

begin_mask *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
alinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/UnsortedSegmentSumUnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeWlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/Unique:1\linear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice*
T0*0
_output_shapes
:������������������*5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
Tindices0
�
^linear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/SparseApplyFtrlSparseApplyFtrl"linear/num-of-doors/weights/part_0>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1alinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/UnsortedSegmentSumUlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/Unique2linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *
Tindices0	*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Olinear/regression_head/train_op/Ftrl/update_linear/bias_weight/part_0/ApplyFtrl	ApplyFtrllinear/bias_weight/part_05linear/regression_head/linear/bias_weight/part_0/Ftrl7linear/regression_head/linear/bias_weight/part_0/Ftrl_1Plinear/regression_head/train_op/gradients/linear/linear/BiasAdd_grad/BiasAddGrad2linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes
:*
use_locking( *,
_class"
 loc:@linear/bias_weight/part_0
�
+linear/regression_head/train_op/Ftrl/updateNoOpR^linear/regression_head/train_op/Ftrl/update_linear/height/weight/part_0/ApplyFtrlV^linear/regression_head/train_op/Ftrl/update_linear/horsepower/weight/part_0/ApplyFtrlR^linear/regression_head/train_op/Ftrl/update_linear/length/weight/part_0/ApplyFtrlQ^linear/regression_head/train_op/Ftrl/update_linear/width/weight/part_0/ApplyFtrlW^linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/SparseApplyFtrlc^linear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/SparseApplyFtrl_^linear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/SparseApplyFtrlP^linear/regression_head/train_op/Ftrl/update_linear/bias_weight/part_0/ApplyFtrl
�
*linear/regression_head/train_op/Ftrl/valueConst,^linear/regression_head/train_op/Ftrl/update*
dtype0	*
_output_shapes
: *
value	B	 R*
_class
loc:@global_step
�
$linear/regression_head/train_op/Ftrl	AssignAddglobal_step*linear/regression_head/train_op/Ftrl/value*
T0	*
_output_shapes
: *
use_locking( *
_class
loc:@global_step
n
)linear/regression_head/metrics/mean/zerosConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
)linear/regression_head/metrics/mean/total
VariableV2*
dtype0*
	container *
_output_shapes
: *
shape: *
shared_name 
�
0linear/regression_head/metrics/mean/total/AssignAssign)linear/regression_head/metrics/mean/total)linear/regression_head/metrics/mean/zeros*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*<
_class2
0.loc:@linear/regression_head/metrics/mean/total
�
.linear/regression_head/metrics/mean/total/readIdentity)linear/regression_head/metrics/mean/total*
T0*
_output_shapes
: *<
_class2
0.loc:@linear/regression_head/metrics/mean/total
p
+linear/regression_head/metrics/mean/zeros_1Const*
dtype0*
_output_shapes
: *
valueB
 *    
�
)linear/regression_head/metrics/mean/count
VariableV2*
dtype0*
	container *
_output_shapes
: *
shape: *
shared_name 
�
0linear/regression_head/metrics/mean/count/AssignAssign)linear/regression_head/metrics/mean/count+linear/regression_head/metrics/mean/zeros_1*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*<
_class2
0.loc:@linear/regression_head/metrics/mean/count
�
.linear/regression_head/metrics/mean/count/readIdentity)linear/regression_head/metrics/mean/count*
T0*
_output_shapes
: *<
_class2
0.loc:@linear/regression_head/metrics/mean/count
j
(linear/regression_head/metrics/mean/SizeConst*
dtype0*
_output_shapes
: *
value	B :
�
-linear/regression_head/metrics/mean/ToFloat_1Cast(linear/regression_head/metrics/mean/Size*

SrcT0*
_output_shapes
: *

DstT0
l
)linear/regression_head/metrics/mean/ConstConst*
dtype0*
_output_shapes
: *
valueB 
�
'linear/regression_head/metrics/mean/SumSum-linear/regression_head/mean_squared_loss/loss)linear/regression_head/metrics/mean/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
-linear/regression_head/metrics/mean/AssignAdd	AssignAdd)linear/regression_head/metrics/mean/total'linear/regression_head/metrics/mean/Sum*
T0*
_output_shapes
: *
use_locking( *<
_class2
0.loc:@linear/regression_head/metrics/mean/total
�
/linear/regression_head/metrics/mean/AssignAdd_1	AssignAdd)linear/regression_head/metrics/mean/count-linear/regression_head/metrics/mean/ToFloat_1.^linear/regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: *
use_locking( *<
_class2
0.loc:@linear/regression_head/metrics/mean/count
r
-linear/regression_head/metrics/mean/Greater/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
+linear/regression_head/metrics/mean/GreaterGreater.linear/regression_head/metrics/mean/count/read-linear/regression_head/metrics/mean/Greater/y*
T0*
_output_shapes
: 
�
+linear/regression_head/metrics/mean/truedivRealDiv.linear/regression_head/metrics/mean/total/read.linear/regression_head/metrics/mean/count/read*
T0*
_output_shapes
: 
p
+linear/regression_head/metrics/mean/value/eConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
)linear/regression_head/metrics/mean/valueSelect+linear/regression_head/metrics/mean/Greater+linear/regression_head/metrics/mean/truediv+linear/regression_head/metrics/mean/value/e*
T0*
_output_shapes
: 
t
/linear/regression_head/metrics/mean/Greater_1/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
-linear/regression_head/metrics/mean/Greater_1Greater/linear/regression_head/metrics/mean/AssignAdd_1/linear/regression_head/metrics/mean/Greater_1/y*
T0*
_output_shapes
: 
�
-linear/regression_head/metrics/mean/truediv_1RealDiv-linear/regression_head/metrics/mean/AssignAdd/linear/regression_head/metrics/mean/AssignAdd_1*
T0*
_output_shapes
: 
t
/linear/regression_head/metrics/mean/update_op/eConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
-linear/regression_head/metrics/mean/update_opSelect-linear/regression_head/metrics/mean/Greater_1-linear/regression_head/metrics/mean/truediv_1/linear/regression_head/metrics/mean/update_op/e*
T0*
_output_shapes
: 
�
initNoOp^global_step/Assign#^linear/height/weight/part_0/Assign'^linear/horsepower/weight/part_0/Assign#^linear/length/weight/part_0/Assign"^linear/width/weight/part_0/Assign"^linear/make/weights/part_0/Assign.^linear/num-of-cylinders/weights/part_0/Assign*^linear/num-of-doors/weights/part_0/Assign!^linear/bias_weight/part_0/Assign?^linear/regression_head/linear/height/weight/part_0/Ftrl/AssignA^linear/regression_head/linear/height/weight/part_0/Ftrl_1/AssignC^linear/regression_head/linear/horsepower/weight/part_0/Ftrl/AssignE^linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/Assign?^linear/regression_head/linear/length/weight/part_0/Ftrl/AssignA^linear/regression_head/linear/length/weight/part_0/Ftrl_1/Assign>^linear/regression_head/linear/width/weight/part_0/Ftrl/Assign@^linear/regression_head/linear/width/weight/part_0/Ftrl_1/Assign>^linear/regression_head/linear/make/weights/part_0/Ftrl/Assign@^linear/regression_head/linear/make/weights/part_0/Ftrl_1/AssignJ^linear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl/AssignL^linear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/AssignF^linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl/AssignH^linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/Assign=^linear/regression_head/linear/bias_weight/part_0/Ftrl/Assign?^linear/regression_head/linear/bias_weight/part_0/Ftrl_1/Assign

init_1NoOp
"

group_depsNoOp^init^init_1
�
4report_uninitialized_variables/IsVariableInitializedIsVariableInitializedglobal_step*
dtype0	*
_output_shapes
: *
_class
loc:@global_step
�
6report_uninitialized_variables/IsVariableInitialized_1IsVariableInitializedlinear/height/weight/part_0*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/height/weight/part_0
�
6report_uninitialized_variables/IsVariableInitialized_2IsVariableInitializedlinear/horsepower/weight/part_0*
dtype0*
_output_shapes
: *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
6report_uninitialized_variables/IsVariableInitialized_3IsVariableInitializedlinear/length/weight/part_0*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/length/weight/part_0
�
6report_uninitialized_variables/IsVariableInitialized_4IsVariableInitializedlinear/width/weight/part_0*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/width/weight/part_0
�
6report_uninitialized_variables/IsVariableInitialized_5IsVariableInitializedlinear/make/weights/part_0*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/make/weights/part_0
�
6report_uninitialized_variables/IsVariableInitialized_6IsVariableInitialized&linear/num-of-cylinders/weights/part_0*
dtype0*
_output_shapes
: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
6report_uninitialized_variables/IsVariableInitialized_7IsVariableInitialized"linear/num-of-doors/weights/part_0*
dtype0*
_output_shapes
: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
6report_uninitialized_variables/IsVariableInitialized_8IsVariableInitializedlinear/bias_weight/part_0*
dtype0*
_output_shapes
: *,
_class"
 loc:@linear/bias_weight/part_0
�
6report_uninitialized_variables/IsVariableInitialized_9IsVariableInitialized7linear/regression_head/linear/height/weight/part_0/Ftrl*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/height/weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_10IsVariableInitialized9linear/regression_head/linear/height/weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/height/weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_11IsVariableInitialized;linear/regression_head/linear/horsepower/weight/part_0/Ftrl*
dtype0*
_output_shapes
: *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_12IsVariableInitialized=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_13IsVariableInitialized7linear/regression_head/linear/length/weight/part_0/Ftrl*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/length/weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_14IsVariableInitialized9linear/regression_head/linear/length/weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/length/weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_15IsVariableInitialized6linear/regression_head/linear/width/weight/part_0/Ftrl*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/width/weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_16IsVariableInitialized8linear/regression_head/linear/width/weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/width/weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_17IsVariableInitialized6linear/regression_head/linear/make/weights/part_0/Ftrl*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/make/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_18IsVariableInitialized8linear/regression_head/linear/make/weights/part_0/Ftrl_1*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/make/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_19IsVariableInitializedBlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl*
dtype0*
_output_shapes
: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_20IsVariableInitializedDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1*
dtype0*
_output_shapes
: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_21IsVariableInitialized>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl*
dtype0*
_output_shapes
: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_22IsVariableInitialized@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1*
dtype0*
_output_shapes
: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_23IsVariableInitialized5linear/regression_head/linear/bias_weight/part_0/Ftrl*
dtype0*
_output_shapes
: *,
_class"
 loc:@linear/bias_weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_24IsVariableInitialized7linear/regression_head/linear/bias_weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *,
_class"
 loc:@linear/bias_weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_25IsVariableInitialized)linear/regression_head/metrics/mean/total*
dtype0*
_output_shapes
: *<
_class2
0.loc:@linear/regression_head/metrics/mean/total
�
7report_uninitialized_variables/IsVariableInitialized_26IsVariableInitialized)linear/regression_head/metrics/mean/count*
dtype0*
_output_shapes
: *<
_class2
0.loc:@linear/regression_head/metrics/mean/count
�
$report_uninitialized_variables/stackPack4report_uninitialized_variables/IsVariableInitialized6report_uninitialized_variables/IsVariableInitialized_16report_uninitialized_variables/IsVariableInitialized_26report_uninitialized_variables/IsVariableInitialized_36report_uninitialized_variables/IsVariableInitialized_46report_uninitialized_variables/IsVariableInitialized_56report_uninitialized_variables/IsVariableInitialized_66report_uninitialized_variables/IsVariableInitialized_76report_uninitialized_variables/IsVariableInitialized_86report_uninitialized_variables/IsVariableInitialized_97report_uninitialized_variables/IsVariableInitialized_107report_uninitialized_variables/IsVariableInitialized_117report_uninitialized_variables/IsVariableInitialized_127report_uninitialized_variables/IsVariableInitialized_137report_uninitialized_variables/IsVariableInitialized_147report_uninitialized_variables/IsVariableInitialized_157report_uninitialized_variables/IsVariableInitialized_167report_uninitialized_variables/IsVariableInitialized_177report_uninitialized_variables/IsVariableInitialized_187report_uninitialized_variables/IsVariableInitialized_197report_uninitialized_variables/IsVariableInitialized_207report_uninitialized_variables/IsVariableInitialized_217report_uninitialized_variables/IsVariableInitialized_227report_uninitialized_variables/IsVariableInitialized_237report_uninitialized_variables/IsVariableInitialized_247report_uninitialized_variables/IsVariableInitialized_257report_uninitialized_variables/IsVariableInitialized_26*
T0
*
_output_shapes
:*
N*

axis 
y
)report_uninitialized_variables/LogicalNot
LogicalNot$report_uninitialized_variables/stack*
_output_shapes
:
�
$report_uninitialized_variables/ConstConst*
dtype0*
_output_shapes
:*�

value�
B�
Bglobal_stepBlinear/height/weight/part_0Blinear/horsepower/weight/part_0Blinear/length/weight/part_0Blinear/width/weight/part_0Blinear/make/weights/part_0B&linear/num-of-cylinders/weights/part_0B"linear/num-of-doors/weights/part_0Blinear/bias_weight/part_0B7linear/regression_head/linear/height/weight/part_0/FtrlB9linear/regression_head/linear/height/weight/part_0/Ftrl_1B;linear/regression_head/linear/horsepower/weight/part_0/FtrlB=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1B7linear/regression_head/linear/length/weight/part_0/FtrlB9linear/regression_head/linear/length/weight/part_0/Ftrl_1B6linear/regression_head/linear/width/weight/part_0/FtrlB8linear/regression_head/linear/width/weight/part_0/Ftrl_1B6linear/regression_head/linear/make/weights/part_0/FtrlB8linear/regression_head/linear/make/weights/part_0/Ftrl_1BBlinear/regression_head/linear/num-of-cylinders/weights/part_0/FtrlBDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1B>linear/regression_head/linear/num-of-doors/weights/part_0/FtrlB@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1B5linear/regression_head/linear/bias_weight/part_0/FtrlB7linear/regression_head/linear/bias_weight/part_0/Ftrl_1B)linear/regression_head/metrics/mean/totalB)linear/regression_head/metrics/mean/count
{
1report_uninitialized_variables/boolean_mask/ShapeConst*
dtype0*
_output_shapes
:*
valueB:
�
?report_uninitialized_variables/boolean_mask/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Areport_uninitialized_variables/boolean_mask/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
9report_uninitialized_variables/boolean_mask/strided_sliceStridedSlice1report_uninitialized_variables/boolean_mask/Shape?report_uninitialized_variables/boolean_mask/strided_slice/stackAreport_uninitialized_variables/boolean_mask/strided_slice/stack_1Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
:*

begin_mask*
Index0
�
Breport_uninitialized_variables/boolean_mask/Prod/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB: 
�
0report_uninitialized_variables/boolean_mask/ProdProd9report_uninitialized_variables/boolean_mask/strided_sliceBreport_uninitialized_variables/boolean_mask/Prod/reduction_indices*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
}
3report_uninitialized_variables/boolean_mask/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
;report_uninitialized_variables/boolean_mask/strided_slice_1StridedSlice3report_uninitialized_variables/boolean_mask/Shape_1Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackCreport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
: *

begin_mask *
Index0
�
;report_uninitialized_variables/boolean_mask/concat/values_0Pack0report_uninitialized_variables/boolean_mask/Prod*
T0*
_output_shapes
:*
N*

axis 
y
7report_uninitialized_variables/boolean_mask/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
2report_uninitialized_variables/boolean_mask/concatConcatV2;report_uninitialized_variables/boolean_mask/concat/values_0;report_uninitialized_variables/boolean_mask/strided_slice_17report_uninitialized_variables/boolean_mask/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
3report_uninitialized_variables/boolean_mask/ReshapeReshape$report_uninitialized_variables/Const2report_uninitialized_variables/boolean_mask/concat*
T0*
_output_shapes
:*
Tshape0
�
;report_uninitialized_variables/boolean_mask/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
5report_uninitialized_variables/boolean_mask/Reshape_1Reshape)report_uninitialized_variables/LogicalNot;report_uninitialized_variables/boolean_mask/Reshape_1/shape*
T0
*
_output_shapes
:*
Tshape0
�
1report_uninitialized_variables/boolean_mask/WhereWhere5report_uninitialized_variables/boolean_mask/Reshape_1*'
_output_shapes
:���������
�
3report_uninitialized_variables/boolean_mask/SqueezeSqueeze1report_uninitialized_variables/boolean_mask/Where*
T0	*#
_output_shapes
:���������*
squeeze_dims

�
2report_uninitialized_variables/boolean_mask/GatherGather3report_uninitialized_variables/boolean_mask/Reshape3report_uninitialized_variables/boolean_mask/Squeeze*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
g
$report_uninitialized_resources/ConstConst*
dtype0*
_output_shapes
: *
valueB 
M
concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
concatConcatV22report_uninitialized_variables/boolean_mask/Gather$report_uninitialized_resources/Constconcat/axis*

Tidx0*
T0*#
_output_shapes
:���������*
N
�
6report_uninitialized_variables_1/IsVariableInitializedIsVariableInitializedglobal_step*
dtype0	*
_output_shapes
: *
_class
loc:@global_step
�
8report_uninitialized_variables_1/IsVariableInitialized_1IsVariableInitializedlinear/height/weight/part_0*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/height/weight/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_2IsVariableInitializedlinear/horsepower/weight/part_0*
dtype0*
_output_shapes
: *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_3IsVariableInitializedlinear/length/weight/part_0*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/length/weight/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_4IsVariableInitializedlinear/width/weight/part_0*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/width/weight/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_5IsVariableInitializedlinear/make/weights/part_0*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/make/weights/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_6IsVariableInitialized&linear/num-of-cylinders/weights/part_0*
dtype0*
_output_shapes
: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_7IsVariableInitialized"linear/num-of-doors/weights/part_0*
dtype0*
_output_shapes
: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_8IsVariableInitializedlinear/bias_weight/part_0*
dtype0*
_output_shapes
: *,
_class"
 loc:@linear/bias_weight/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_9IsVariableInitialized7linear/regression_head/linear/height/weight/part_0/Ftrl*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/height/weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_10IsVariableInitialized9linear/regression_head/linear/height/weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/height/weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_11IsVariableInitialized;linear/regression_head/linear/horsepower/weight/part_0/Ftrl*
dtype0*
_output_shapes
: *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_12IsVariableInitialized=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_13IsVariableInitialized7linear/regression_head/linear/length/weight/part_0/Ftrl*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/length/weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_14IsVariableInitialized9linear/regression_head/linear/length/weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/length/weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_15IsVariableInitialized6linear/regression_head/linear/width/weight/part_0/Ftrl*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/width/weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_16IsVariableInitialized8linear/regression_head/linear/width/weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/width/weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_17IsVariableInitialized6linear/regression_head/linear/make/weights/part_0/Ftrl*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/make/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_18IsVariableInitialized8linear/regression_head/linear/make/weights/part_0/Ftrl_1*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/make/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_19IsVariableInitializedBlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl*
dtype0*
_output_shapes
: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_20IsVariableInitializedDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1*
dtype0*
_output_shapes
: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_21IsVariableInitialized>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl*
dtype0*
_output_shapes
: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_22IsVariableInitialized@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1*
dtype0*
_output_shapes
: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_23IsVariableInitialized5linear/regression_head/linear/bias_weight/part_0/Ftrl*
dtype0*
_output_shapes
: *,
_class"
 loc:@linear/bias_weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_24IsVariableInitialized7linear/regression_head/linear/bias_weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *,
_class"
 loc:@linear/bias_weight/part_0
�
&report_uninitialized_variables_1/stackPack6report_uninitialized_variables_1/IsVariableInitialized8report_uninitialized_variables_1/IsVariableInitialized_18report_uninitialized_variables_1/IsVariableInitialized_28report_uninitialized_variables_1/IsVariableInitialized_38report_uninitialized_variables_1/IsVariableInitialized_48report_uninitialized_variables_1/IsVariableInitialized_58report_uninitialized_variables_1/IsVariableInitialized_68report_uninitialized_variables_1/IsVariableInitialized_78report_uninitialized_variables_1/IsVariableInitialized_88report_uninitialized_variables_1/IsVariableInitialized_99report_uninitialized_variables_1/IsVariableInitialized_109report_uninitialized_variables_1/IsVariableInitialized_119report_uninitialized_variables_1/IsVariableInitialized_129report_uninitialized_variables_1/IsVariableInitialized_139report_uninitialized_variables_1/IsVariableInitialized_149report_uninitialized_variables_1/IsVariableInitialized_159report_uninitialized_variables_1/IsVariableInitialized_169report_uninitialized_variables_1/IsVariableInitialized_179report_uninitialized_variables_1/IsVariableInitialized_189report_uninitialized_variables_1/IsVariableInitialized_199report_uninitialized_variables_1/IsVariableInitialized_209report_uninitialized_variables_1/IsVariableInitialized_219report_uninitialized_variables_1/IsVariableInitialized_229report_uninitialized_variables_1/IsVariableInitialized_239report_uninitialized_variables_1/IsVariableInitialized_24*
T0
*
_output_shapes
:*
N*

axis 
}
+report_uninitialized_variables_1/LogicalNot
LogicalNot&report_uninitialized_variables_1/stack*
_output_shapes
:
�

&report_uninitialized_variables_1/ConstConst*
dtype0*
_output_shapes
:*�	
value�	B�	Bglobal_stepBlinear/height/weight/part_0Blinear/horsepower/weight/part_0Blinear/length/weight/part_0Blinear/width/weight/part_0Blinear/make/weights/part_0B&linear/num-of-cylinders/weights/part_0B"linear/num-of-doors/weights/part_0Blinear/bias_weight/part_0B7linear/regression_head/linear/height/weight/part_0/FtrlB9linear/regression_head/linear/height/weight/part_0/Ftrl_1B;linear/regression_head/linear/horsepower/weight/part_0/FtrlB=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1B7linear/regression_head/linear/length/weight/part_0/FtrlB9linear/regression_head/linear/length/weight/part_0/Ftrl_1B6linear/regression_head/linear/width/weight/part_0/FtrlB8linear/regression_head/linear/width/weight/part_0/Ftrl_1B6linear/regression_head/linear/make/weights/part_0/FtrlB8linear/regression_head/linear/make/weights/part_0/Ftrl_1BBlinear/regression_head/linear/num-of-cylinders/weights/part_0/FtrlBDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1B>linear/regression_head/linear/num-of-doors/weights/part_0/FtrlB@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1B5linear/regression_head/linear/bias_weight/part_0/FtrlB7linear/regression_head/linear/bias_weight/part_0/Ftrl_1
}
3report_uninitialized_variables_1/boolean_mask/ShapeConst*
dtype0*
_output_shapes
:*
valueB:
�
Areport_uninitialized_variables_1/boolean_mask/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
;report_uninitialized_variables_1/boolean_mask/strided_sliceStridedSlice3report_uninitialized_variables_1/boolean_mask/ShapeAreport_uninitialized_variables_1/boolean_mask/strided_slice/stackCreport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
:*

begin_mask*
Index0
�
Dreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB: 
�
2report_uninitialized_variables_1/boolean_mask/ProdProd;report_uninitialized_variables_1/boolean_mask/strided_sliceDreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indices*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 

5report_uninitialized_variables_1/boolean_mask/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
=report_uninitialized_variables_1/boolean_mask/strided_slice_1StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_1Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
: *

begin_mask *
Index0
�
=report_uninitialized_variables_1/boolean_mask/concat/values_0Pack2report_uninitialized_variables_1/boolean_mask/Prod*
T0*
_output_shapes
:*
N*

axis 
{
9report_uninitialized_variables_1/boolean_mask/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
4report_uninitialized_variables_1/boolean_mask/concatConcatV2=report_uninitialized_variables_1/boolean_mask/concat/values_0=report_uninitialized_variables_1/boolean_mask/strided_slice_19report_uninitialized_variables_1/boolean_mask/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
5report_uninitialized_variables_1/boolean_mask/ReshapeReshape&report_uninitialized_variables_1/Const4report_uninitialized_variables_1/boolean_mask/concat*
T0*
_output_shapes
:*
Tshape0
�
=report_uninitialized_variables_1/boolean_mask/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
7report_uninitialized_variables_1/boolean_mask/Reshape_1Reshape+report_uninitialized_variables_1/LogicalNot=report_uninitialized_variables_1/boolean_mask/Reshape_1/shape*
T0
*
_output_shapes
:*
Tshape0
�
3report_uninitialized_variables_1/boolean_mask/WhereWhere7report_uninitialized_variables_1/boolean_mask/Reshape_1*'
_output_shapes
:���������
�
5report_uninitialized_variables_1/boolean_mask/SqueezeSqueeze3report_uninitialized_variables_1/boolean_mask/Where*
T0	*#
_output_shapes
:���������*
squeeze_dims

�
4report_uninitialized_variables_1/boolean_mask/GatherGather5report_uninitialized_variables_1/boolean_mask/Reshape5report_uninitialized_variables_1/boolean_mask/Squeeze*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
t
init_2NoOp1^linear/regression_head/metrics/mean/total/Assign1^linear/regression_head/metrics/mean/count/Assign
u
init_all_tablesNoOp-^linear/linear/lookup_1/hash_table/table_init-^linear/linear/lookup_2/hash_table/table_init
/
group_deps_1NoOp^init_2^init_all_tables
�
Merge/MergeSummaryMergeSummarySenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full$linear/regression_head/ScalarSummary*
_output_shapes
: *
N
P

save/ConstConst*
dtype0*
_output_shapes
: *
valueB Bmodel
�
save/StringJoin/inputs_1Const*
dtype0*
_output_shapes
: *<
value3B1 B+_temp_8480bb43ed4f444189e2791e93ed1632/part
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
	separator *
_output_shapes
: *
N
Q
save/num_shardsConst*
dtype0*
_output_shapes
: *
value	B :
\
save/ShardedFilename/shardConst*
dtype0*
_output_shapes
: *
value	B : 
}
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards*
_output_shapes
: 
�	
save/SaveV2/tensor_namesConst*
dtype0*
_output_shapes
:*�
value�B�Bglobal_stepBlinear/bias_weightB.linear/bias_weight/ear/bias_weight/part_0/FtrlB0linear/bias_weight/ear/bias_weight/part_0/Ftrl_1Blinear/height/weightB0linear/height/weight/r/height/weight/part_0/FtrlB2linear/height/weight/r/height/weight/part_0/Ftrl_1Blinear/horsepower/weightB4linear/horsepower/weight/rsepower/weight/part_0/FtrlB6linear/horsepower/weight/rsepower/weight/part_0/Ftrl_1Blinear/length/weightB0linear/length/weight/r/length/weight/part_0/FtrlB2linear/length/weight/r/length/weight/part_0/Ftrl_1Blinear/make/weightsB/linear/make/weights/ar/make/weights/part_0/FtrlB1linear/make/weights/ar/make/weights/part_0/Ftrl_1Blinear/num-of-cylinders/weightsB;linear/num-of-cylinders/weights/linders/weights/part_0/FtrlB=linear/num-of-cylinders/weights/linders/weights/part_0/Ftrl_1Blinear/num-of-doors/weightsB7linear/num-of-doors/weights/f-doors/weights/part_0/FtrlB9linear/num-of-doors/weights/f-doors/weights/part_0/Ftrl_1Blinear/width/weightB/linear/width/weight/ar/width/weight/part_0/FtrlB1linear/width/weight/ar/width/weight/part_0/Ftrl_1
�
save/SaveV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*�
value�B�B B1 0,1B1 0,1B1 0,1B1 1 0,1:0,1B1 1 0,1:0,1B1 1 0,1:0,1B1 1 0,1:0,1B1 1 0,1:0,1B1 1 0,1:0,1B1 1 0,1:0,1B1 1 0,1:0,1B1 1 0,1:0,1B50 1 0,50:0,1B50 1 0,50:0,1B50 1 0,50:0,1B7 1 0,7:0,1B7 1 0,7:0,1B7 1 0,7:0,1B2 1 0,2:0,1B2 1 0,2:0,1B2 1 0,2:0,1B1 1 0,1:0,1B1 1 0,1:0,1B1 1 0,1:0,1
�
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesglobal_steplinear/bias_weight/part_0/read:linear/regression_head/linear/bias_weight/part_0/Ftrl/read<linear/regression_head/linear/bias_weight/part_0/Ftrl_1/read linear/height/weight/part_0/read<linear/regression_head/linear/height/weight/part_0/Ftrl/read>linear/regression_head/linear/height/weight/part_0/Ftrl_1/read$linear/horsepower/weight/part_0/read@linear/regression_head/linear/horsepower/weight/part_0/Ftrl/readBlinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/read linear/length/weight/part_0/read<linear/regression_head/linear/length/weight/part_0/Ftrl/read>linear/regression_head/linear/length/weight/part_0/Ftrl_1/readlinear/make/weights/part_0/read;linear/regression_head/linear/make/weights/part_0/Ftrl/read=linear/regression_head/linear/make/weights/part_0/Ftrl_1/read+linear/num-of-cylinders/weights/part_0/readGlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl/readIlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/read'linear/num-of-doors/weights/part_0/readClinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl/readElinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/readlinear/width/weight/part_0/read;linear/regression_head/linear/width/weight/part_0/Ftrl/read=linear/regression_head/linear/width/weight/part_0/Ftrl_1/read*'
dtypes
2	
�
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2*
T0*
_output_shapes
: *'
_class
loc:@save/ShardedFilename
�
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency*
T0*
_output_shapes
:*
N*

axis 
}
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const*
delete_old_dirs(
z
save/IdentityIdentity
save/Const^save/control_dependency^save/MergeV2Checkpoints*
T0*
_output_shapes
: 
o
save/RestoreV2/tensor_namesConst*
dtype0*
_output_shapes
:* 
valueBBglobal_step
h
save/RestoreV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
_output_shapes
:*
dtypes
2	
�
save/AssignAssignglobal_stepsave/RestoreV2*
T0	*
_output_shapes
: *
validate_shape(*
use_locking(*
_class
loc:@global_step
x
save/RestoreV2_1/tensor_namesConst*
dtype0*
_output_shapes
:*'
valueBBlinear/bias_weight
o
!save/RestoreV2_1/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB1 0,1
�
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_1Assignlinear/bias_weight/part_0save/RestoreV2_1*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
�
save/RestoreV2_2/tensor_namesConst*
dtype0*
_output_shapes
:*C
value:B8B.linear/bias_weight/ear/bias_weight/part_0/Ftrl
o
!save/RestoreV2_2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB1 0,1
�
save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_2Assign5linear/regression_head/linear/bias_weight/part_0/Ftrlsave/RestoreV2_2*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
�
save/RestoreV2_3/tensor_namesConst*
dtype0*
_output_shapes
:*E
value<B:B0linear/bias_weight/ear/bias_weight/part_0/Ftrl_1
o
!save/RestoreV2_3/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB1 0,1
�
save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_3Assign7linear/regression_head/linear/bias_weight/part_0/Ftrl_1save/RestoreV2_3*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
z
save/RestoreV2_4/tensor_namesConst*
dtype0*
_output_shapes
:*)
value BBlinear/height/weight
u
!save/RestoreV2_4/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_4Assignlinear/height/weight/part_0save/RestoreV2_4*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
�
save/RestoreV2_5/tensor_namesConst*
dtype0*
_output_shapes
:*E
value<B:B0linear/height/weight/r/height/weight/part_0/Ftrl
u
!save/RestoreV2_5/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_5Assign7linear/regression_head/linear/height/weight/part_0/Ftrlsave/RestoreV2_5*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
�
save/RestoreV2_6/tensor_namesConst*
dtype0*
_output_shapes
:*G
value>B<B2linear/height/weight/r/height/weight/part_0/Ftrl_1
u
!save/RestoreV2_6/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_6Assign9linear/regression_head/linear/height/weight/part_0/Ftrl_1save/RestoreV2_6*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
~
save/RestoreV2_7/tensor_namesConst*
dtype0*
_output_shapes
:*-
value$B"Blinear/horsepower/weight
u
!save/RestoreV2_7/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_7Assignlinear/horsepower/weight/part_0save/RestoreV2_7*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
save/RestoreV2_8/tensor_namesConst*
dtype0*
_output_shapes
:*I
value@B>B4linear/horsepower/weight/rsepower/weight/part_0/Ftrl
u
!save/RestoreV2_8/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_8	RestoreV2
save/Constsave/RestoreV2_8/tensor_names!save/RestoreV2_8/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_8Assign;linear/regression_head/linear/horsepower/weight/part_0/Ftrlsave/RestoreV2_8*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
save/RestoreV2_9/tensor_namesConst*
dtype0*
_output_shapes
:*K
valueBB@B6linear/horsepower/weight/rsepower/weight/part_0/Ftrl_1
u
!save/RestoreV2_9/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_9	RestoreV2
save/Constsave/RestoreV2_9/tensor_names!save/RestoreV2_9/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_9Assign=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1save/RestoreV2_9*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
{
save/RestoreV2_10/tensor_namesConst*
dtype0*
_output_shapes
:*)
value BBlinear/length/weight
v
"save/RestoreV2_10/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_10	RestoreV2
save/Constsave/RestoreV2_10/tensor_names"save/RestoreV2_10/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_10Assignlinear/length/weight/part_0save/RestoreV2_10*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
�
save/RestoreV2_11/tensor_namesConst*
dtype0*
_output_shapes
:*E
value<B:B0linear/length/weight/r/length/weight/part_0/Ftrl
v
"save/RestoreV2_11/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_11	RestoreV2
save/Constsave/RestoreV2_11/tensor_names"save/RestoreV2_11/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_11Assign7linear/regression_head/linear/length/weight/part_0/Ftrlsave/RestoreV2_11*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
�
save/RestoreV2_12/tensor_namesConst*
dtype0*
_output_shapes
:*G
value>B<B2linear/length/weight/r/length/weight/part_0/Ftrl_1
v
"save/RestoreV2_12/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_12	RestoreV2
save/Constsave/RestoreV2_12/tensor_names"save/RestoreV2_12/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_12Assign9linear/regression_head/linear/length/weight/part_0/Ftrl_1save/RestoreV2_12*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
z
save/RestoreV2_13/tensor_namesConst*
dtype0*
_output_shapes
:*(
valueBBlinear/make/weights
x
"save/RestoreV2_13/shape_and_slicesConst*
dtype0*
_output_shapes
:*"
valueBB50 1 0,50:0,1
�
save/RestoreV2_13	RestoreV2
save/Constsave/RestoreV2_13/tensor_names"save/RestoreV2_13/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_13Assignlinear/make/weights/part_0save/RestoreV2_13*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
save/RestoreV2_14/tensor_namesConst*
dtype0*
_output_shapes
:*D
value;B9B/linear/make/weights/ar/make/weights/part_0/Ftrl
x
"save/RestoreV2_14/shape_and_slicesConst*
dtype0*
_output_shapes
:*"
valueBB50 1 0,50:0,1
�
save/RestoreV2_14	RestoreV2
save/Constsave/RestoreV2_14/tensor_names"save/RestoreV2_14/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_14Assign6linear/regression_head/linear/make/weights/part_0/Ftrlsave/RestoreV2_14*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
save/RestoreV2_15/tensor_namesConst*
dtype0*
_output_shapes
:*F
value=B;B1linear/make/weights/ar/make/weights/part_0/Ftrl_1
x
"save/RestoreV2_15/shape_and_slicesConst*
dtype0*
_output_shapes
:*"
valueBB50 1 0,50:0,1
�
save/RestoreV2_15	RestoreV2
save/Constsave/RestoreV2_15/tensor_names"save/RestoreV2_15/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_15Assign8linear/regression_head/linear/make/weights/part_0/Ftrl_1save/RestoreV2_15*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
save/RestoreV2_16/tensor_namesConst*
dtype0*
_output_shapes
:*4
value+B)Blinear/num-of-cylinders/weights
v
"save/RestoreV2_16/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB7 1 0,7:0,1
�
save/RestoreV2_16	RestoreV2
save/Constsave/RestoreV2_16/tensor_names"save/RestoreV2_16/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_16Assign&linear/num-of-cylinders/weights/part_0save/RestoreV2_16*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
save/RestoreV2_17/tensor_namesConst*
dtype0*
_output_shapes
:*P
valueGBEB;linear/num-of-cylinders/weights/linders/weights/part_0/Ftrl
v
"save/RestoreV2_17/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB7 1 0,7:0,1
�
save/RestoreV2_17	RestoreV2
save/Constsave/RestoreV2_17/tensor_names"save/RestoreV2_17/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_17AssignBlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrlsave/RestoreV2_17*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
save/RestoreV2_18/tensor_namesConst*
dtype0*
_output_shapes
:*R
valueIBGB=linear/num-of-cylinders/weights/linders/weights/part_0/Ftrl_1
v
"save/RestoreV2_18/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB7 1 0,7:0,1
�
save/RestoreV2_18	RestoreV2
save/Constsave/RestoreV2_18/tensor_names"save/RestoreV2_18/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_18AssignDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1save/RestoreV2_18*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
save/RestoreV2_19/tensor_namesConst*
dtype0*
_output_shapes
:*0
value'B%Blinear/num-of-doors/weights
v
"save/RestoreV2_19/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB2 1 0,2:0,1
�
save/RestoreV2_19	RestoreV2
save/Constsave/RestoreV2_19/tensor_names"save/RestoreV2_19/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_19Assign"linear/num-of-doors/weights/part_0save/RestoreV2_19*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
save/RestoreV2_20/tensor_namesConst*
dtype0*
_output_shapes
:*L
valueCBAB7linear/num-of-doors/weights/f-doors/weights/part_0/Ftrl
v
"save/RestoreV2_20/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB2 1 0,2:0,1
�
save/RestoreV2_20	RestoreV2
save/Constsave/RestoreV2_20/tensor_names"save/RestoreV2_20/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_20Assign>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrlsave/RestoreV2_20*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
save/RestoreV2_21/tensor_namesConst*
dtype0*
_output_shapes
:*N
valueEBCB9linear/num-of-doors/weights/f-doors/weights/part_0/Ftrl_1
v
"save/RestoreV2_21/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB2 1 0,2:0,1
�
save/RestoreV2_21	RestoreV2
save/Constsave/RestoreV2_21/tensor_names"save/RestoreV2_21/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_21Assign@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1save/RestoreV2_21*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
z
save/RestoreV2_22/tensor_namesConst*
dtype0*
_output_shapes
:*(
valueBBlinear/width/weight
v
"save/RestoreV2_22/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_22	RestoreV2
save/Constsave/RestoreV2_22/tensor_names"save/RestoreV2_22/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_22Assignlinear/width/weight/part_0save/RestoreV2_22*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
save/RestoreV2_23/tensor_namesConst*
dtype0*
_output_shapes
:*D
value;B9B/linear/width/weight/ar/width/weight/part_0/Ftrl
v
"save/RestoreV2_23/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_23	RestoreV2
save/Constsave/RestoreV2_23/tensor_names"save/RestoreV2_23/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_23Assign6linear/regression_head/linear/width/weight/part_0/Ftrlsave/RestoreV2_23*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
save/RestoreV2_24/tensor_namesConst*
dtype0*
_output_shapes
:*F
value=B;B1linear/width/weight/ar/width/weight/part_0/Ftrl_1
v
"save/RestoreV2_24/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_24	RestoreV2
save/Constsave/RestoreV2_24/tensor_names"save/RestoreV2_24/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_24Assign8linear/regression_head/linear/width/weight/part_0/Ftrl_1save/RestoreV2_24*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23^save/Assign_24
-
save/restore_allNoOp^save/restore_shard"����     a1��	z.t�P�AJ��
�5�5
9
Add
x"T
y"T
z"T"
Ttype:
2	
S
AddN
inputs"T*N
sum"T"
Nint(0"
Ttype:
2	��
�
	ApplyFtrl
var"T�
accum"T�
linear"T�	
grad"T
lr"T
l1"T
l2"T
lr_power"T
out"T�"
Ttype:
2	"
use_lockingbool( 
x
Assign
ref"T�

value"T

output_ref"T�"	
Ttype"
validate_shapebool("
use_lockingbool(�
p
	AssignAdd
ref"T�

value"T

output_ref"T�"
Ttype:
2	"
use_lockingbool( 
{
BiasAdd

value"T	
bias"T
output"T"
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
{
BiasAddGrad
out_backprop"T
output"T"
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
4
Fill
dims

value"T
output"T"	
Ttype
>
FloorDiv
x"T
y"T
z"T"
Ttype:
2	
�
Gather
params"Tparams
indices"Tindices
output"Tparams"
validate_indicesbool("
Tparamstype"
Tindicestype:
2	
:
Greater
x"T
y"T
z
"
Ttype:
2		
?
GreaterEqual
x"T
y"T
z
"
Ttype:
2		
�
	HashTable
table_handle�"
	containerstring "
shared_namestring "!
use_node_name_sharingbool( "
	key_dtypetype"
value_dtypetype�
.
Identity

input"T
output"T"	
Ttype
`
InitializeTable
table_handle�
keys"Tkey
values"Tval"
Tkeytype"
Tvaltype
N
IsVariableInitialized
ref"dtype�
is_initialized
"
dtypetype�
\
ListDiff
x"T
y"T
out"T
idx"out_idx"	
Ttype"
out_idxtype0:
2	


LogicalNot
x

y

u
LookupTableFind
table_handle�
keys"Tin
default_value"Tout
values"Tout"
Tintype"
Touttype
o
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2
:
Maximum
x"T
y"T
z"T"
Ttype:	
2	�
�
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
8
MergeSummary
inputs*N
summary"
Nint(0
b
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
<
Mul
x"T
y"T
z"T"
Ttype:
2	�
-
Neg
x"T
y"T"
Ttype:
	2	

NoOp
D
NotEqual
x"T
y"T
z
"
Ttype:
2	
�
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
�
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
B
QueueCloseV2

handle"#
cancel_pending_enqueuesbool( �
�
QueueDequeueManyV2

handle
n

components2component_types"!
component_types
list(type)(0"

timeout_msint����������
}
QueueEnqueueManyV2

handle

components2Tcomponents"
Tcomponents
list(type)(0"

timeout_msint����������
&
QueueSizeV2

handle
size�
�
RandomShuffleQueueV2

handle"!
component_types
list(type)(0"
shapeslist(shape)
 ("
capacityint���������"
min_after_dequeueint "
seedint "
seed2int "
	containerstring "
shared_namestring �
`
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:
2	
=
RealDiv
x"T
y"T
z"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
l
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
i
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
M
ScalarSummary
tags
values"T
summary"
Ttype:
2		
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
O
Size

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
�
SparseApplyFtrl
var"T�
accum"T�
linear"T�	
grad"T
indices"Tindices
lr"T
l1"T
l2"T
lr_power"T
out"T�"
Ttype:
2	"
Tindicestype:
2	"
use_lockingbool( 
y
SparseReorder
input_indices	
input_values"T
input_shape	
output_indices	
output_values"T"	
Ttype
h
SparseReshape
input_indices	
input_shape	
	new_shape	
output_indices	
output_shape	
�
SparseSegmentSum	
data"T
indices"Tidx
segment_ids
output"T"
Ttype:
2		"
Tidxtype0:
2	
�
SparseToDense
sparse_indices"Tindices
output_shape"Tindices
sparse_values"T
default_value"T

dense"T"
validate_indicesbool("	
Ttype"
Tindicestype:
2	
0
Square
x"T
y"T"
Ttype:
	2	
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
G
StringToHashBucketFast	
input

output	"
num_bucketsint(0
5
Sub
x"T
y"T
z"T"
Ttype:
	2	
�
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
P
Unique
x"T
y"T
idx"out_idx"	
Ttype"
out_idxtype0:
2	
P
Unpack

value"T
output"T*num"
numint("	
Ttype"
axisint 
�
UnsortedSegmentSum	
data"T
segment_ids"Tindices
num_segments
output"T"
Ttype:
2	"
Tindicestype:
2	
s

VariableV2
ref"dtype�"
shapeshape"
dtypetype"
	containerstring "
shared_namestring �

Where	
input
	
index	
&
	ZerosLike
x"T
y"T"	
Ttype*	1.2.0-rc12v1.2.0-rc0-24-g94484aa��

global_step/Initializer/zerosConst*
dtype0	*
_output_shapes
: *
value	B	 R *
_class
loc:@global_step
�
global_step
VariableV2*
	container *
_class
loc:@global_step*
dtype0	*
_output_shapes
: *
shape: *
shared_name 
�
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
T0	*
_output_shapes
: *
validate_shape(*
use_locking(*
_class
loc:@global_step
j
global_step/readIdentityglobal_step*
T0	*
_output_shapes
: *
_class
loc:@global_step
�
"enqueue_input/random_shuffle_queueRandomShuffleQueueV2*
	container *
seed2 *
shared_name *
min_after_dequeue�*
_output_shapes
: *

seed * 
component_types
2		*
capacity�*
shapes
: : : : : : : : : 
^
enqueue_input/PlaceholderPlaceholder*
dtype0	*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_1Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_2Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_3Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_4Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_5Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_6Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_7Placeholder*
dtype0*
_output_shapes
:*
shape:
`
enqueue_input/Placeholder_8Placeholder*
dtype0*
_output_shapes
:*
shape:
�
.enqueue_input/random_shuffle_queue_EnqueueManyQueueEnqueueManyV2"enqueue_input/random_shuffle_queueenqueue_input/Placeholderenqueue_input/Placeholder_1enqueue_input/Placeholder_2enqueue_input/Placeholder_3enqueue_input/Placeholder_4enqueue_input/Placeholder_5enqueue_input/Placeholder_6enqueue_input/Placeholder_7enqueue_input/Placeholder_8*
Tcomponents
2		*

timeout_ms���������
{
(enqueue_input/random_shuffle_queue_CloseQueueCloseV2"enqueue_input/random_shuffle_queue*
cancel_pending_enqueues( 
}
*enqueue_input/random_shuffle_queue_Close_1QueueCloseV2"enqueue_input/random_shuffle_queue*
cancel_pending_enqueues(
r
'enqueue_input/random_shuffle_queue_SizeQueueSizeV2"enqueue_input/random_shuffle_queue*
_output_shapes
: 
V
enqueue_input/sub/yConst*
dtype0*
_output_shapes
: *
value
B :�
w
enqueue_input/subSub'enqueue_input/random_shuffle_queue_Sizeenqueue_input/sub/y*
T0*
_output_shapes
: 
Y
enqueue_input/Maximum/xConst*
dtype0*
_output_shapes
: *
value	B : 
m
enqueue_input/MaximumMaximumenqueue_input/Maximum/xenqueue_input/sub*
T0*
_output_shapes
: 
a
enqueue_input/CastCastenqueue_input/Maximum*

SrcT0*
_output_shapes
: *

DstT0
X
enqueue_input/mul/yConst*
dtype0*
_output_shapes
: *
valueB
 *>î:
b
enqueue_input/mulMulenqueue_input/Castenqueue_input/mul/y*
T0*
_output_shapes
: 
�
Xenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full/tagsConst*
dtype0*
_output_shapes
: *d
value[BY BSenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full
�
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullScalarSummaryXenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full/tagsenqueue_input/mul*
T0*
_output_shapes
: 
d
"random_shuffle_queue_DequeueMany/nConst*
dtype0*
_output_shapes
: *
value	B :@
�
 random_shuffle_queue_DequeueManyQueueDequeueManyV2"enqueue_input/random_shuffle_queue"random_shuffle_queue_DequeueMany/n*J
_output_shapes8
6:@:@:@:@:@:@:@:@:@*

timeout_ms���������* 
component_types
2		
n
#linear/linear/height/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/height/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:6#linear/linear/height/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
-linear/height/weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *.
_class$
" loc:@linear/height/weight/part_0
�
linear/height/weight/part_0
VariableV2*
	container *.
_class$
" loc:@linear/height/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
"linear/height/weight/part_0/AssignAssignlinear/height/weight/part_0-linear/height/weight/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
�
 linear/height/weight/part_0/readIdentitylinear/height/weight/part_0*
T0*
_output_shapes

:*.
_class$
" loc:@linear/height/weight/part_0
k
linear/height/weightIdentity linear/height/weight/part_0/read*
T0*
_output_shapes

:
�
linear/linear/height/matmulMatMullinear/linear/height/ExpandDimslinear/height/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
l
linear/linear/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/ReshapeReshapelinear/linear/height/matmullinear/linear/Reshape/shape*
T0*
_output_shapes

:@*
Tshape0
r
'linear/linear/horsepower/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
#linear/linear/horsepower/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:3'linear/linear/horsepower/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
1linear/horsepower/weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
linear/horsepower/weight/part_0
VariableV2*
	container *2
_class(
&$loc:@linear/horsepower/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
&linear/horsepower/weight/part_0/AssignAssignlinear/horsepower/weight/part_01linear/horsepower/weight/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
$linear/horsepower/weight/part_0/readIdentitylinear/horsepower/weight/part_0*
T0*
_output_shapes

:*2
_class(
&$loc:@linear/horsepower/weight/part_0
s
linear/horsepower/weightIdentity$linear/horsepower/weight/part_0/read*
T0*
_output_shapes

:
�
linear/linear/horsepower/matmulMatMul#linear/linear/horsepower/ExpandDimslinear/horsepower/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
n
linear/linear/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_1Reshapelinear/linear/horsepower/matmullinear/linear/Reshape_1/shape*
T0*
_output_shapes

:@*
Tshape0
n
#linear/linear/length/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/length/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:5#linear/linear/length/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
-linear/length/weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *.
_class$
" loc:@linear/length/weight/part_0
�
linear/length/weight/part_0
VariableV2*
	container *.
_class$
" loc:@linear/length/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
"linear/length/weight/part_0/AssignAssignlinear/length/weight/part_0-linear/length/weight/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
�
 linear/length/weight/part_0/readIdentitylinear/length/weight/part_0*
T0*
_output_shapes

:*.
_class$
" loc:@linear/length/weight/part_0
k
linear/length/weightIdentity linear/length/weight/part_0/read*
T0*
_output_shapes

:
�
linear/linear/length/matmulMatMullinear/linear/length/ExpandDimslinear/length/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
n
linear/linear/Reshape_2/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_2Reshapelinear/linear/length/matmullinear/linear/Reshape_2/shape*
T0*
_output_shapes

:@*
Tshape0
m
"linear/linear/width/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/width/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:7"linear/linear/width/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
,linear/width/weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *-
_class#
!loc:@linear/width/weight/part_0
�
linear/width/weight/part_0
VariableV2*
	container *-
_class#
!loc:@linear/width/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
!linear/width/weight/part_0/AssignAssignlinear/width/weight/part_0,linear/width/weight/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
linear/width/weight/part_0/readIdentitylinear/width/weight/part_0*
T0*
_output_shapes

:*-
_class#
!loc:@linear/width/weight/part_0
i
linear/width/weightIdentitylinear/width/weight/part_0/read*
T0*
_output_shapes

:
�
linear/linear/width/matmulMatMullinear/linear/width/ExpandDimslinear/width/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
n
linear/linear/Reshape_3/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_3Reshapelinear/linear/width/matmullinear/linear/Reshape_3/shape*
T0*
_output_shapes

:@*
Tshape0
h
linear/linear/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:4linear/linear/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
x
'linear/linear/DenseToSparseTensor/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
&linear/linear/DenseToSparseTensor/CastCast'linear/linear/DenseToSparseTensor/Shape*

SrcT0*
_output_shapes
:*

DstT0	
k
*linear/linear/DenseToSparseTensor/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
*linear/linear/DenseToSparseTensor/NotEqualNotEquallinear/linear/expand_dims*linear/linear/DenseToSparseTensor/Cast_1/x*
T0*
_output_shapes

:@
�
'linear/linear/DenseToSparseTensor/WhereWhere*linear/linear/DenseToSparseTensor/NotEqual*'
_output_shapes
:���������
�
/linear/linear/DenseToSparseTensor/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
)linear/linear/DenseToSparseTensor/ReshapeReshapelinear/linear/expand_dims/linear/linear/DenseToSparseTensor/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
5linear/linear/DenseToSparseTensor/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
7linear/linear/DenseToSparseTensor/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
7linear/linear/DenseToSparseTensor/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
/linear/linear/DenseToSparseTensor/strided_sliceStridedSlice'linear/linear/DenseToSparseTensor/Where5linear/linear/DenseToSparseTensor/strided_slice/stack7linear/linear/DenseToSparseTensor/strided_slice/stack_17linear/linear/DenseToSparseTensor/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
7linear/linear/DenseToSparseTensor/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
9linear/linear/DenseToSparseTensor/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
1linear/linear/DenseToSparseTensor/strided_slice_1StridedSlice'linear/linear/DenseToSparseTensor/Where7linear/linear/DenseToSparseTensor/strided_slice_1/stack9linear/linear/DenseToSparseTensor/strided_slice_1/stack_19linear/linear/DenseToSparseTensor/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
)linear/linear/DenseToSparseTensor/unstackUnpack&linear/linear/DenseToSparseTensor/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
'linear/linear/DenseToSparseTensor/stackPack+linear/linear/DenseToSparseTensor/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
%linear/linear/DenseToSparseTensor/MulMul1linear/linear/DenseToSparseTensor/strided_slice_1'linear/linear/DenseToSparseTensor/stack*
T0	*'
_output_shapes
:���������
�
7linear/linear/DenseToSparseTensor/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
%linear/linear/DenseToSparseTensor/SumSum%linear/linear/DenseToSparseTensor/Mul7linear/linear/DenseToSparseTensor/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
%linear/linear/DenseToSparseTensor/AddAdd/linear/linear/DenseToSparseTensor/strided_slice%linear/linear/DenseToSparseTensor/Sum*
T0	*#
_output_shapes
:���������
�
(linear/linear/DenseToSparseTensor/GatherGather)linear/linear/DenseToSparseTensor/Reshape%linear/linear/DenseToSparseTensor/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
�
linear/linear/lookupStringToHashBucketFast(linear/linear/DenseToSparseTensor/Gather*
num_buckets2*#
_output_shapes
:���������
�
,linear/make/weights/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:2*
valueB2*    *-
_class#
!loc:@linear/make/weights/part_0
�
linear/make/weights/part_0
VariableV2*
	container *-
_class#
!loc:@linear/make/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
!linear/make/weights/part_0/AssignAssignlinear/make/weights/part_0,linear/make/weights/part_0/Initializer/zeros*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
linear/make/weights/part_0/readIdentitylinear/make/weights/part_0*
T0*
_output_shapes

:2*-
_class#
!loc:@linear/make/weights/part_0
u
+linear/linear/make/make_weights/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 
t
*linear/linear/make/make_weights/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
%linear/linear/make/make_weights/SliceSlice&linear/linear/DenseToSparseTensor/Cast+linear/linear/make/make_weights/Slice/begin*linear/linear/make/make_weights/Slice/size*
T0	*
_output_shapes
:*
Index0
o
%linear/linear/make/make_weights/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
$linear/linear/make/make_weights/ProdProd%linear/linear/make/make_weights/Slice%linear/linear/make/make_weights/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
p
.linear/linear/make/make_weights/Gather/indicesConst*
dtype0*
_output_shapes
: *
value	B :
�
&linear/linear/make/make_weights/GatherGather&linear/linear/DenseToSparseTensor/Cast.linear/linear/make/make_weights/Gather/indices*
_output_shapes
: *
validate_indices(*
Tparams0	*
Tindices0
�
&linear/linear/make/make_weights/Cast/xPack$linear/linear/make/make_weights/Prod&linear/linear/make/make_weights/Gather*
T0	*
_output_shapes
:*
N*

axis 
�
-linear/linear/make/make_weights/SparseReshapeSparseReshape'linear/linear/DenseToSparseTensor/Where&linear/linear/DenseToSparseTensor/Cast&linear/linear/make/make_weights/Cast/x*-
_output_shapes
:���������:
�
6linear/linear/make/make_weights/SparseReshape/IdentityIdentitylinear/linear/lookup*
T0	*#
_output_shapes
:���������
p
.linear/linear/make/make_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
,linear/linear/make/make_weights/GreaterEqualGreaterEqual6linear/linear/make/make_weights/SparseReshape/Identity.linear/linear/make/make_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
%linear/linear/make/make_weights/WhereWhere,linear/linear/make/make_weights/GreaterEqual*'
_output_shapes
:���������
�
-linear/linear/make/make_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
'linear/linear/make/make_weights/ReshapeReshape%linear/linear/make/make_weights/Where-linear/linear/make/make_weights/Reshape/shape*
T0	*#
_output_shapes
:���������*
Tshape0
�
(linear/linear/make/make_weights/Gather_1Gather-linear/linear/make/make_weights/SparseReshape'linear/linear/make/make_weights/Reshape*'
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
(linear/linear/make/make_weights/Gather_2Gather6linear/linear/make/make_weights/SparseReshape/Identity'linear/linear/make/make_weights/Reshape*#
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
(linear/linear/make/make_weights/IdentityIdentity/linear/linear/make/make_weights/SparseReshape:1*
T0	*
_output_shapes
:
{
9linear/linear/make/make_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
Glinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/strided_sliceStridedSlice(linear/linear/make/make_weights/IdentityGlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stackIlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stack_1Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
8linear/linear/make/make_weights/SparseFillEmptyRows/CastCastAlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice*

SrcT0	*
_output_shapes
: *

DstT0
�
?linear/linear/make/make_weights/SparseFillEmptyRows/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
?linear/linear/make/make_weights/SparseFillEmptyRows/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
9linear/linear/make/make_weights/SparseFillEmptyRows/rangeRange?linear/linear/make/make_weights/SparseFillEmptyRows/range/start8linear/linear/make/make_weights/SparseFillEmptyRows/Cast?linear/linear/make/make_weights/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:���������
�
:linear/linear/make/make_weights/SparseFillEmptyRows/Cast_1Cast9linear/linear/make/make_weights/SparseFillEmptyRows/range*

SrcT0*#
_output_shapes
:���������*

DstT0	
�
Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
Clinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1StridedSlice(linear/linear/make/make_weights/Gather_1Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stackKlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stack_1Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
<linear/linear/make/make_weights/SparseFillEmptyRows/ListDiffListDiff:linear/linear/make/make_weights/SparseFillEmptyRows/Cast_1Clinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
Ilinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Clinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2StridedSlice(linear/linear/make/make_weights/IdentityIlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stackKlinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stack_1Klinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Blinear/linear/make/make_weights/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
>linear/linear/make/make_weights/SparseFillEmptyRows/ExpandDims
ExpandDimsClinear/linear/make/make_weights/SparseFillEmptyRows/strided_slice_2Blinear/linear/make/make_weights/SparseFillEmptyRows/ExpandDims/dim*
T0	*
_output_shapes
:*

Tdim0
�
Olinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
_output_shapes
: *
value	B
 Z
�
Olinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
_output_shapes
: *
value	B
 Z 
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDenseSparseToDense<linear/linear/make/make_weights/SparseFillEmptyRows/ListDiff>linear/linear/make/make_weights/SparseFillEmptyRows/ExpandDimsOlinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesOlinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/default_value*
T0
*#
_output_shapes
:���������*
validate_indices(*
Tindices0	
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
;linear/linear/make/make_weights/SparseFillEmptyRows/ReshapeReshape<linear/linear/make/make_weights/SparseFillEmptyRows/ListDiffAlinear/linear/make/make_weights/SparseFillEmptyRows/Reshape/shape*
T0	*'
_output_shapes
:���������*
Tshape0
�
>linear/linear/make/make_weights/SparseFillEmptyRows/zeros_like	ZerosLike;linear/linear/make/make_weights/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:���������
�
?linear/linear/make/make_weights/SparseFillEmptyRows/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
�
:linear/linear/make/make_weights/SparseFillEmptyRows/concatConcatV2;linear/linear/make/make_weights/SparseFillEmptyRows/Reshape>linear/linear/make/make_weights/SparseFillEmptyRows/zeros_like?linear/linear/make/make_weights/SparseFillEmptyRows/concat/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
9linear/linear/make/make_weights/SparseFillEmptyRows/ShapeShape<linear/linear/make/make_weights/SparseFillEmptyRows/ListDiff*
T0	*
out_type0*
_output_shapes
:
�
8linear/linear/make/make_weights/SparseFillEmptyRows/FillFill9linear/linear/make/make_weights/SparseFillEmptyRows/Shape9linear/linear/make/make_weights/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:���������
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
<linear/linear/make/make_weights/SparseFillEmptyRows/concat_1ConcatV2(linear/linear/make/make_weights/Gather_1:linear/linear/make/make_weights/SparseFillEmptyRows/concatAlinear/linear/make/make_weights/SparseFillEmptyRows/concat_1/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
<linear/linear/make/make_weights/SparseFillEmptyRows/concat_2ConcatV2(linear/linear/make/make_weights/Gather_28linear/linear/make/make_weights/SparseFillEmptyRows/FillAlinear/linear/make/make_weights/SparseFillEmptyRows/concat_2/axis*

Tidx0*
T0	*#
_output_shapes
:���������*
N
�
Alinear/linear/make/make_weights/SparseFillEmptyRows/SparseReorderSparseReorder<linear/linear/make/make_weights/SparseFillEmptyRows/concat_1<linear/linear/make/make_weights/SparseFillEmptyRows/concat_2(linear/linear/make/make_weights/Identity*
T0	*6
_output_shapes$
":���������:���������
�
<linear/linear/make/make_weights/SparseFillEmptyRows/IdentityIdentity(linear/linear/make/make_weights/Identity*
T0	*
_output_shapes
:
�
Klinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
Mlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
Mlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
Elinear/linear/make/make_weights/embedding_lookup_sparse/strided_sliceStridedSliceAlinear/linear/make/make_weights/SparseFillEmptyRows/SparseReorderKlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stackMlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stack_1Mlinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
<linear/linear/make/make_weights/embedding_lookup_sparse/CastCastElinear/linear/make/make_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:���������*

DstT0
�
>linear/linear/make/make_weights/embedding_lookup_sparse/UniqueUniqueClinear/linear/make/make_weights/SparseFillEmptyRows/SparseReorder:1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
Hlinear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookupGatherlinear/make/weights/part_0/read>linear/linear/make/make_weights/embedding_lookup_sparse/Unique*'
_output_shapes
:���������*
validate_indices(*
Tparams0*-
_class#
!loc:@linear/make/weights/part_0*
Tindices0	
�
7linear/linear/make/make_weights/embedding_lookup_sparseSparseSegmentSumHlinear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup@linear/linear/make/make_weights/embedding_lookup_sparse/Unique:1<linear/linear/make/make_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:���������
�
/linear/linear/make/make_weights/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
)linear/linear/make/make_weights/Reshape_1ReshapeAlinear/linear/make/make_weights/SparseFillEmptyRows/SparseToDense/linear/linear/make/make_weights/Reshape_1/shape*
T0
*'
_output_shapes
:���������*
Tshape0
�
%linear/linear/make/make_weights/ShapeShape7linear/linear/make/make_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
}
3linear/linear/make/make_weights/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:

5linear/linear/make/make_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:

5linear/linear/make/make_weights/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
-linear/linear/make/make_weights/strided_sliceStridedSlice%linear/linear/make/make_weights/Shape3linear/linear/make/make_weights/strided_slice/stack5linear/linear/make/make_weights/strided_slice/stack_15linear/linear/make/make_weights/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
i
'linear/linear/make/make_weights/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
�
%linear/linear/make/make_weights/stackPack'linear/linear/make/make_weights/stack/0-linear/linear/make/make_weights/strided_slice*
T0*
_output_shapes
:*
N*

axis 
�
$linear/linear/make/make_weights/TileTile)linear/linear/make/make_weights/Reshape_1%linear/linear/make/make_weights/stack*
T0
*0
_output_shapes
:������������������*

Tmultiples0
�
*linear/linear/make/make_weights/zeros_like	ZerosLike7linear/linear/make/make_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
linear/linear/make/make_weightsSelect$linear/linear/make/make_weights/Tile*linear/linear/make/make_weights/zeros_like7linear/linear/make/make_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
&linear/linear/make/make_weights/Cast_1Cast&linear/linear/DenseToSparseTensor/Cast*

SrcT0	*
_output_shapes
:*

DstT0
w
-linear/linear/make/make_weights/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 
v
,linear/linear/make/make_weights/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
'linear/linear/make/make_weights/Slice_1Slice&linear/linear/make/make_weights/Cast_1-linear/linear/make/make_weights/Slice_1/begin,linear/linear/make/make_weights/Slice_1/size*
T0*
_output_shapes
:*
Index0
�
'linear/linear/make/make_weights/Shape_1Shapelinear/linear/make/make_weights*
T0*
out_type0*
_output_shapes
:
w
-linear/linear/make/make_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:

,linear/linear/make/make_weights/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
'linear/linear/make/make_weights/Slice_2Slice'linear/linear/make/make_weights/Shape_1-linear/linear/make/make_weights/Slice_2/begin,linear/linear/make/make_weights/Slice_2/size*
T0*
_output_shapes
:*
Index0
m
+linear/linear/make/make_weights/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
&linear/linear/make/make_weights/concatConcatV2'linear/linear/make/make_weights/Slice_1'linear/linear/make/make_weights/Slice_2+linear/linear/make/make_weights/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
)linear/linear/make/make_weights/Reshape_2Reshapelinear/linear/make/make_weights&linear/linear/make/make_weights/concat*
T0*'
_output_shapes
:���������*
Tshape0
n
linear/linear/Reshape_4/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_4Reshape)linear/linear/make/make_weights/Reshape_2linear/linear/Reshape_4/shape*
T0*'
_output_shapes
:���������*
Tshape0
j
linear/linear/expand_dims_1/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/expand_dims_1
ExpandDims"random_shuffle_queue_DequeueMany:2linear/linear/expand_dims_1/dim*
T0*
_output_shapes

:@*

Tdim0
z
)linear/linear/DenseToSparseTensor_1/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
(linear/linear/DenseToSparseTensor_1/CastCast)linear/linear/DenseToSparseTensor_1/Shape*

SrcT0*
_output_shapes
:*

DstT0	
m
,linear/linear/DenseToSparseTensor_1/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
,linear/linear/DenseToSparseTensor_1/NotEqualNotEquallinear/linear/expand_dims_1,linear/linear/DenseToSparseTensor_1/Cast_1/x*
T0*
_output_shapes

:@
�
)linear/linear/DenseToSparseTensor_1/WhereWhere,linear/linear/DenseToSparseTensor_1/NotEqual*'
_output_shapes
:���������
�
1linear/linear/DenseToSparseTensor_1/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
+linear/linear/DenseToSparseTensor_1/ReshapeReshapelinear/linear/expand_dims_11linear/linear/DenseToSparseTensor_1/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
7linear/linear/DenseToSparseTensor_1/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor_1/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor_1/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
1linear/linear/DenseToSparseTensor_1/strided_sliceStridedSlice)linear/linear/DenseToSparseTensor_1/Where7linear/linear/DenseToSparseTensor_1/strided_slice/stack9linear/linear/DenseToSparseTensor_1/strided_slice/stack_19linear/linear/DenseToSparseTensor_1/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
9linear/linear/DenseToSparseTensor_1/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
;linear/linear/DenseToSparseTensor_1/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
;linear/linear/DenseToSparseTensor_1/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
3linear/linear/DenseToSparseTensor_1/strided_slice_1StridedSlice)linear/linear/DenseToSparseTensor_1/Where9linear/linear/DenseToSparseTensor_1/strided_slice_1/stack;linear/linear/DenseToSparseTensor_1/strided_slice_1/stack_1;linear/linear/DenseToSparseTensor_1/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
+linear/linear/DenseToSparseTensor_1/unstackUnpack(linear/linear/DenseToSparseTensor_1/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
)linear/linear/DenseToSparseTensor_1/stackPack-linear/linear/DenseToSparseTensor_1/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
'linear/linear/DenseToSparseTensor_1/MulMul3linear/linear/DenseToSparseTensor_1/strided_slice_1)linear/linear/DenseToSparseTensor_1/stack*
T0	*'
_output_shapes
:���������
�
9linear/linear/DenseToSparseTensor_1/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
'linear/linear/DenseToSparseTensor_1/SumSum'linear/linear/DenseToSparseTensor_1/Mul9linear/linear/DenseToSparseTensor_1/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
'linear/linear/DenseToSparseTensor_1/AddAdd1linear/linear/DenseToSparseTensor_1/strided_slice'linear/linear/DenseToSparseTensor_1/Sum*
T0	*#
_output_shapes
:���������
�
*linear/linear/DenseToSparseTensor_1/GatherGather+linear/linear/DenseToSparseTensor_1/Reshape'linear/linear/DenseToSparseTensor_1/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
�
linear/linear/lookup_1/ConstConst*
dtype0*
_output_shapes
:*?
value6B4BeightBfiveBfourBsixBthreeBtwelveBtwo
]
linear/linear/lookup_1/SizeConst*
dtype0*
_output_shapes
: *
value	B :
d
"linear/linear/lookup_1/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
d
"linear/linear/lookup_1/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
linear/linear/lookup_1/rangeRange"linear/linear/lookup_1/range/startlinear/linear/lookup_1/Size"linear/linear/lookup_1/range/delta*

Tidx0*
_output_shapes
:
x
linear/linear/lookup_1/ToInt64Castlinear/linear/lookup_1/range*

SrcT0*
_output_shapes
:*

DstT0	
�
!linear/linear/lookup_1/hash_table	HashTable*
	container *
	key_dtype0*
use_node_name_sharing( *
_output_shapes
:*
shared_name *
value_dtype0	
r
'linear/linear/lookup_1/hash_table/ConstConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
,linear/linear/lookup_1/hash_table/table_initInitializeTable!linear/linear/lookup_1/hash_tablelinear/linear/lookup_1/Constlinear/linear/lookup_1/ToInt64*

Tval0	*

Tkey0*4
_class*
(&loc:@linear/linear/lookup_1/hash_table
�
linear/linear/hash_table_LookupLookupTableFind!linear/linear/lookup_1/hash_table*linear/linear/DenseToSparseTensor_1/Gather'linear/linear/lookup_1/hash_table/Const*#
_output_shapes
:���������*

Tout0	*	
Tin0*4
_class*
(&loc:@linear/linear/lookup_1/hash_table
�
8linear/num-of-cylinders/weights/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
&linear/num-of-cylinders/weights/part_0
VariableV2*
	container *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
-linear/num-of-cylinders/weights/part_0/AssignAssign&linear/num-of-cylinders/weights/part_08linear/num-of-cylinders/weights/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
+linear/num-of-cylinders/weights/part_0/readIdentity&linear/num-of-cylinders/weights/part_0*
T0*
_output_shapes

:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Clinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 
�
Blinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/SliceSlice(linear/linear/DenseToSparseTensor_1/CastClinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice/beginBlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice/size*
T0	*
_output_shapes
:*
Index0
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
<linear/linear/num-of-cylinders/num-of-cylinders_weights/ProdProd=linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice=linear/linear/num-of-cylinders/num-of-cylinders_weights/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
�
Flinear/linear/num-of-cylinders/num-of-cylinders_weights/Gather/indicesConst*
dtype0*
_output_shapes
: *
value	B :
�
>linear/linear/num-of-cylinders/num-of-cylinders_weights/GatherGather(linear/linear/DenseToSparseTensor_1/CastFlinear/linear/num-of-cylinders/num-of-cylinders_weights/Gather/indices*
_output_shapes
: *
validate_indices(*
Tparams0	*
Tindices0
�
>linear/linear/num-of-cylinders/num-of-cylinders_weights/Cast/xPack<linear/linear/num-of-cylinders/num-of-cylinders_weights/Prod>linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather*
T0	*
_output_shapes
:*
N*

axis 
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshapeSparseReshape)linear/linear/DenseToSparseTensor_1/Where(linear/linear/DenseToSparseTensor_1/Cast>linear/linear/num-of-cylinders/num-of-cylinders_weights/Cast/x*-
_output_shapes
:���������:
�
Nlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape/IdentityIdentitylinear/linear/hash_table_Lookup*
T0	*#
_output_shapes
:���������
�
Flinear/linear/num-of-cylinders/num-of-cylinders_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
Dlinear/linear/num-of-cylinders/num-of-cylinders_weights/GreaterEqualGreaterEqualNlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape/IdentityFlinear/linear/num-of-cylinders/num-of-cylinders_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/WhereWhereDlinear/linear/num-of-cylinders/num-of-cylinders_weights/GreaterEqual*'
_output_shapes
:���������
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/ReshapeReshape=linear/linear/num-of-cylinders/num-of-cylinders_weights/WhereElinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape/shape*
T0	*#
_output_shapes
:���������*
Tshape0
�
@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_1GatherElinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape?linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape*'
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_2GatherNlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape/Identity?linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape*#
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
@linear/linear/num-of-cylinders/num-of-cylinders_weights/IdentityIdentityGlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseReshape:1*
T0	*
_output_shapes
:
�
Qlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
_linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_sliceStridedSlice@linear/linear/num-of-cylinders/num-of-cylinders_weights/Identity_linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stackalinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stack_1alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Plinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/CastCastYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice*

SrcT0	*
_output_shapes
: *

DstT0
�
Wlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
Wlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
Qlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/rangeRangeWlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range/startPlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/CastWlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:���������
�
Rlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Cast_1CastQlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/range*

SrcT0*#
_output_shapes
:���������*

DstT0	
�
alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1StridedSlice@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_1alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stackclinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stack_1clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ListDiffListDiffRlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Cast_1[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
alinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2StridedSlice@linear/linear/num-of-cylinders/num-of-cylinders_weights/Identityalinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stackclinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stack_1clinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Zlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Vlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ExpandDims
ExpandDims[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/strided_slice_2Zlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ExpandDims/dim*
T0	*
_output_shapes
:*

Tdim0
�
glinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
_output_shapes
: *
value	B
 Z
�
glinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
_output_shapes
: *
value	B
 Z 
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDenseSparseToDenseTlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ListDiffVlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ExpandDimsglinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesglinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDense/default_value*
T0
*#
_output_shapes
:���������*
validate_indices(*
Tindices0	
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
Slinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ReshapeReshapeTlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ListDiffYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Reshape/shape*
T0	*'
_output_shapes
:���������*
Tshape0
�
Vlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/zeros_like	ZerosLikeSlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:���������
�
Wlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
�
Rlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concatConcatV2Slinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ReshapeVlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/zeros_likeWlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Qlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ShapeShapeTlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ListDiff*
T0	*
out_type0*
_output_shapes
:
�
Plinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/FillFillQlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/ShapeQlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:���������
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_1ConcatV2@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_1Rlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concatYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_1/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_2ConcatV2@linear/linear/num-of-cylinders/num-of-cylinders_weights/Gather_2Plinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/FillYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_2/axis*

Tidx0*
T0	*#
_output_shapes
:���������*
N
�
Ylinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseReorderSparseReorderTlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_1Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/concat_2@linear/linear/num-of-cylinders/num-of-cylinders_weights/Identity*
T0	*6
_output_shapes$
":���������:���������
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/IdentityIdentity@linear/linear/num-of-cylinders/num-of-cylinders_weights/Identity*
T0	*
_output_shapes
:
�
clinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
elinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
elinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
]linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_sliceStridedSliceYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseReorderclinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stackelinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stack_1elinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/CastCast]linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:���������*

DstT0
�
Vlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/UniqueUnique[linear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseReorder:1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
`linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookupGather+linear/num-of-cylinders/weights/part_0/readVlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique*'
_output_shapes
:���������*
validate_indices(*
Tparams0*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
Tindices0	
�
Olinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparseSparseSegmentSum`linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookupXlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique:1Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:���������
�
Glinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
Alinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_1ReshapeYlinear/linear/num-of-cylinders/num-of-cylinders_weights/SparseFillEmptyRows/SparseToDenseGlinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_1/shape*
T0
*'
_output_shapes
:���������*
Tshape0
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/ShapeShapeOlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
�
Klinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
Mlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Mlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_sliceStridedSlice=linear/linear/num-of-cylinders/num-of-cylinders_weights/ShapeKlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stackMlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stack_1Mlinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
�
=linear/linear/num-of-cylinders/num-of-cylinders_weights/stackPack?linear/linear/num-of-cylinders/num-of-cylinders_weights/stack/0Elinear/linear/num-of-cylinders/num-of-cylinders_weights/strided_slice*
T0*
_output_shapes
:*
N*

axis 
�
<linear/linear/num-of-cylinders/num-of-cylinders_weights/TileTileAlinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_1=linear/linear/num-of-cylinders/num-of-cylinders_weights/stack*
T0
*0
_output_shapes
:������������������*

Tmultiples0
�
Blinear/linear/num-of-cylinders/num-of-cylinders_weights/zeros_like	ZerosLikeOlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
7linear/linear/num-of-cylinders/num-of-cylinders_weightsSelect<linear/linear/num-of-cylinders/num-of-cylinders_weights/TileBlinear/linear/num-of-cylinders/num-of-cylinders_weights/zeros_likeOlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
>linear/linear/num-of-cylinders/num-of-cylinders_weights/Cast_1Cast(linear/linear/DenseToSparseTensor_1/Cast*

SrcT0	*
_output_shapes
:*

DstT0
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 
�
Dlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1Slice>linear/linear/num-of-cylinders/num-of-cylinders_weights/Cast_1Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1/beginDlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1/size*
T0*
_output_shapes
:*
Index0
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/Shape_1Shape7linear/linear/num-of-cylinders/num-of-cylinders_weights*
T0*
out_type0*
_output_shapes
:
�
Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
�
Dlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
?linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2Slice?linear/linear/num-of-cylinders/num-of-cylinders_weights/Shape_1Elinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2/beginDlinear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2/size*
T0*
_output_shapes
:*
Index0
�
Clinear/linear/num-of-cylinders/num-of-cylinders_weights/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
>linear/linear/num-of-cylinders/num-of-cylinders_weights/concatConcatV2?linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_1?linear/linear/num-of-cylinders/num-of-cylinders_weights/Slice_2Clinear/linear/num-of-cylinders/num-of-cylinders_weights/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
Alinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2Reshape7linear/linear/num-of-cylinders/num-of-cylinders_weights>linear/linear/num-of-cylinders/num-of-cylinders_weights/concat*
T0*'
_output_shapes
:���������*
Tshape0
n
linear/linear/Reshape_5/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_5ReshapeAlinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2linear/linear/Reshape_5/shape*
T0*'
_output_shapes
:���������*
Tshape0
j
linear/linear/expand_dims_2/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
linear/linear/expand_dims_2
ExpandDims"random_shuffle_queue_DequeueMany:1linear/linear/expand_dims_2/dim*
T0*
_output_shapes

:@*

Tdim0
z
)linear/linear/DenseToSparseTensor_2/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
(linear/linear/DenseToSparseTensor_2/CastCast)linear/linear/DenseToSparseTensor_2/Shape*

SrcT0*
_output_shapes
:*

DstT0	
m
,linear/linear/DenseToSparseTensor_2/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
,linear/linear/DenseToSparseTensor_2/NotEqualNotEquallinear/linear/expand_dims_2,linear/linear/DenseToSparseTensor_2/Cast_1/x*
T0*
_output_shapes

:@
�
)linear/linear/DenseToSparseTensor_2/WhereWhere,linear/linear/DenseToSparseTensor_2/NotEqual*'
_output_shapes
:���������
�
1linear/linear/DenseToSparseTensor_2/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
+linear/linear/DenseToSparseTensor_2/ReshapeReshapelinear/linear/expand_dims_21linear/linear/DenseToSparseTensor_2/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
7linear/linear/DenseToSparseTensor_2/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor_2/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
9linear/linear/DenseToSparseTensor_2/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
1linear/linear/DenseToSparseTensor_2/strided_sliceStridedSlice)linear/linear/DenseToSparseTensor_2/Where7linear/linear/DenseToSparseTensor_2/strided_slice/stack9linear/linear/DenseToSparseTensor_2/strided_slice/stack_19linear/linear/DenseToSparseTensor_2/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
9linear/linear/DenseToSparseTensor_2/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
;linear/linear/DenseToSparseTensor_2/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
;linear/linear/DenseToSparseTensor_2/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
3linear/linear/DenseToSparseTensor_2/strided_slice_1StridedSlice)linear/linear/DenseToSparseTensor_2/Where9linear/linear/DenseToSparseTensor_2/strided_slice_1/stack;linear/linear/DenseToSparseTensor_2/strided_slice_1/stack_1;linear/linear/DenseToSparseTensor_2/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
+linear/linear/DenseToSparseTensor_2/unstackUnpack(linear/linear/DenseToSparseTensor_2/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
)linear/linear/DenseToSparseTensor_2/stackPack-linear/linear/DenseToSparseTensor_2/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
'linear/linear/DenseToSparseTensor_2/MulMul3linear/linear/DenseToSparseTensor_2/strided_slice_1)linear/linear/DenseToSparseTensor_2/stack*
T0	*'
_output_shapes
:���������
�
9linear/linear/DenseToSparseTensor_2/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
'linear/linear/DenseToSparseTensor_2/SumSum'linear/linear/DenseToSparseTensor_2/Mul9linear/linear/DenseToSparseTensor_2/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
'linear/linear/DenseToSparseTensor_2/AddAdd1linear/linear/DenseToSparseTensor_2/strided_slice'linear/linear/DenseToSparseTensor_2/Sum*
T0	*#
_output_shapes
:���������
�
*linear/linear/DenseToSparseTensor_2/GatherGather+linear/linear/DenseToSparseTensor_2/Reshape'linear/linear/DenseToSparseTensor_2/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
n
linear/linear/lookup_2/ConstConst*
dtype0*
_output_shapes
:*
valueBBtwoBfour
]
linear/linear/lookup_2/SizeConst*
dtype0*
_output_shapes
: *
value	B :
d
"linear/linear/lookup_2/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
d
"linear/linear/lookup_2/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
linear/linear/lookup_2/rangeRange"linear/linear/lookup_2/range/startlinear/linear/lookup_2/Size"linear/linear/lookup_2/range/delta*

Tidx0*
_output_shapes
:
x
linear/linear/lookup_2/ToInt64Castlinear/linear/lookup_2/range*

SrcT0*
_output_shapes
:*

DstT0	
�
!linear/linear/lookup_2/hash_table	HashTable*
	container *
	key_dtype0*
use_node_name_sharing( *
_output_shapes
:*
shared_name *
value_dtype0	
r
'linear/linear/lookup_2/hash_table/ConstConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
,linear/linear/lookup_2/hash_table/table_initInitializeTable!linear/linear/lookup_2/hash_tablelinear/linear/lookup_2/Constlinear/linear/lookup_2/ToInt64*

Tval0	*

Tkey0*4
_class*
(&loc:@linear/linear/lookup_2/hash_table
�
!linear/linear/hash_table_Lookup_1LookupTableFind!linear/linear/lookup_2/hash_table*linear/linear/DenseToSparseTensor_2/Gather'linear/linear/lookup_2/hash_table/Const*#
_output_shapes
:���������*

Tout0	*	
Tin0*4
_class*
(&loc:@linear/linear/lookup_2/hash_table
�
4linear/num-of-doors/weights/part_0/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
"linear/num-of-doors/weights/part_0
VariableV2*
	container *5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
)linear/num-of-doors/weights/part_0/AssignAssign"linear/num-of-doors/weights/part_04linear/num-of-doors/weights/part_0/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
'linear/num-of-doors/weights/part_0/readIdentity"linear/num-of-doors/weights/part_0*
T0*
_output_shapes

:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
;linear/linear/num-of-doors/num-of-doors_weights/Slice/beginConst*
dtype0*
_output_shapes
:*
valueB: 
�
:linear/linear/num-of-doors/num-of-doors_weights/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
5linear/linear/num-of-doors/num-of-doors_weights/SliceSlice(linear/linear/DenseToSparseTensor_2/Cast;linear/linear/num-of-doors/num-of-doors_weights/Slice/begin:linear/linear/num-of-doors/num-of-doors_weights/Slice/size*
T0	*
_output_shapes
:*
Index0

5linear/linear/num-of-doors/num-of-doors_weights/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
4linear/linear/num-of-doors/num-of-doors_weights/ProdProd5linear/linear/num-of-doors/num-of-doors_weights/Slice5linear/linear/num-of-doors/num-of-doors_weights/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
�
>linear/linear/num-of-doors/num-of-doors_weights/Gather/indicesConst*
dtype0*
_output_shapes
: *
value	B :
�
6linear/linear/num-of-doors/num-of-doors_weights/GatherGather(linear/linear/DenseToSparseTensor_2/Cast>linear/linear/num-of-doors/num-of-doors_weights/Gather/indices*
_output_shapes
: *
validate_indices(*
Tparams0	*
Tindices0
�
6linear/linear/num-of-doors/num-of-doors_weights/Cast/xPack4linear/linear/num-of-doors/num-of-doors_weights/Prod6linear/linear/num-of-doors/num-of-doors_weights/Gather*
T0	*
_output_shapes
:*
N*

axis 
�
=linear/linear/num-of-doors/num-of-doors_weights/SparseReshapeSparseReshape)linear/linear/DenseToSparseTensor_2/Where(linear/linear/DenseToSparseTensor_2/Cast6linear/linear/num-of-doors/num-of-doors_weights/Cast/x*-
_output_shapes
:���������:
�
Flinear/linear/num-of-doors/num-of-doors_weights/SparseReshape/IdentityIdentity!linear/linear/hash_table_Lookup_1*
T0	*#
_output_shapes
:���������
�
>linear/linear/num-of-doors/num-of-doors_weights/GreaterEqual/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
<linear/linear/num-of-doors/num-of-doors_weights/GreaterEqualGreaterEqualFlinear/linear/num-of-doors/num-of-doors_weights/SparseReshape/Identity>linear/linear/num-of-doors/num-of-doors_weights/GreaterEqual/y*
T0	*#
_output_shapes
:���������
�
5linear/linear/num-of-doors/num-of-doors_weights/WhereWhere<linear/linear/num-of-doors/num-of-doors_weights/GreaterEqual*'
_output_shapes
:���������
�
=linear/linear/num-of-doors/num-of-doors_weights/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
7linear/linear/num-of-doors/num-of-doors_weights/ReshapeReshape5linear/linear/num-of-doors/num-of-doors_weights/Where=linear/linear/num-of-doors/num-of-doors_weights/Reshape/shape*
T0	*#
_output_shapes
:���������*
Tshape0
�
8linear/linear/num-of-doors/num-of-doors_weights/Gather_1Gather=linear/linear/num-of-doors/num-of-doors_weights/SparseReshape7linear/linear/num-of-doors/num-of-doors_weights/Reshape*'
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
8linear/linear/num-of-doors/num-of-doors_weights/Gather_2GatherFlinear/linear/num-of-doors/num-of-doors_weights/SparseReshape/Identity7linear/linear/num-of-doors/num-of-doors_weights/Reshape*#
_output_shapes
:���������*
validate_indices(*
Tparams0	*
Tindices0	
�
8linear/linear/num-of-doors/num-of-doors_weights/IdentityIdentity?linear/linear/num-of-doors/num-of-doors_weights/SparseReshape:1*
T0	*
_output_shapes
:
�
Ilinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ConstConst*
dtype0	*
_output_shapes
: *
value	B	 R 
�
Wlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_sliceStridedSlice8linear/linear/num-of-doors/num-of-doors_weights/IdentityWlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stackYlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stack_1Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Hlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/CastCastQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice*

SrcT0	*
_output_shapes
: *

DstT0
�
Olinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
Olinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
Ilinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/rangeRangeOlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range/startHlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/CastOlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range/delta*

Tidx0*#
_output_shapes
:���������
�
Jlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Cast_1CastIlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/range*

SrcT0*#
_output_shapes
:���������*

DstT0	
�
Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
Slinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1StridedSlice8linear/linear/num-of-doors/num-of-doors_weights/Gather_1Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack_1[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ListDiffListDiffJlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Cast_1Slinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
Ylinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
Slinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2StridedSlice8linear/linear/num-of-doors/num-of-doors_weights/IdentityYlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack_1[linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*
_output_shapes
: *

begin_mask *
Index0
�
Rlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Nlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ExpandDims
ExpandDimsSlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/strided_slice_2Rlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ExpandDims/dim*
T0	*
_output_shapes
:*

Tdim0
�
_linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense/sparse_valuesConst*
dtype0
*
_output_shapes
: *
value	B
 Z
�
_linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense/default_valueConst*
dtype0
*
_output_shapes
: *
value	B
 Z 
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDenseSparseToDenseLlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ListDiffNlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ExpandDims_linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense/sparse_values_linear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense/default_value*
T0
*#
_output_shapes
:���������*
validate_indices(*
Tindices0	
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
Klinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ReshapeReshapeLlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ListDiffQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Reshape/shape*
T0	*'
_output_shapes
:���������*
Tshape0
�
Nlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/zeros_like	ZerosLikeKlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Reshape*
T0	*'
_output_shapes
:���������
�
Olinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
�
Jlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concatConcatV2Klinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ReshapeNlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/zeros_likeOlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Ilinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ShapeShapeLlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ListDiff*
T0	*
out_type0*
_output_shapes
:
�
Hlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/FillFillIlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/ShapeIlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/Const*
T0	*#
_output_shapes
:���������
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_1ConcatV28linear/linear/num-of-doors/num-of-doors_weights/Gather_1Jlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concatQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_1/axis*

Tidx0*
T0	*'
_output_shapes
:���������*
N
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_2/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_2ConcatV28linear/linear/num-of-doors/num-of-doors_weights/Gather_2Hlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/FillQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_2/axis*

Tidx0*
T0	*#
_output_shapes
:���������*
N
�
Qlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseReorderSparseReorderLlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_1Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/concat_28linear/linear/num-of-doors/num-of-doors_weights/Identity*
T0	*6
_output_shapes$
":���������:���������
�
Llinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/IdentityIdentity8linear/linear/num-of-doors/num-of-doors_weights/Identity*
T0	*
_output_shapes
:
�
[linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
]linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
]linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
Ulinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_sliceStridedSliceQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseReorder[linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack]linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack_1]linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0	*#
_output_shapes
:���������*

begin_mask*
Index0
�
Llinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/CastCastUlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/strided_slice*

SrcT0	*#
_output_shapes
:���������*

DstT0
�
Nlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/UniqueUniqueSlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseReorder:1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0
�
Xlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookupGather'linear/num-of-doors/weights/part_0/readNlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique*'
_output_shapes
:���������*
validate_indices(*
Tparams0*5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
Tindices0	
�
Glinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparseSparseSegmentSumXlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookupPlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique:1Llinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Cast*

Tidx0*
T0*'
_output_shapes
:���������
�
?linear/linear/num-of-doors/num-of-doors_weights/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
9linear/linear/num-of-doors/num-of-doors_weights/Reshape_1ReshapeQlinear/linear/num-of-doors/num-of-doors_weights/SparseFillEmptyRows/SparseToDense?linear/linear/num-of-doors/num-of-doors_weights/Reshape_1/shape*
T0
*'
_output_shapes
:���������*
Tshape0
�
5linear/linear/num-of-doors/num-of-doors_weights/ShapeShapeGlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
�
Clinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
Elinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Elinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
=linear/linear/num-of-doors/num-of-doors_weights/strided_sliceStridedSlice5linear/linear/num-of-doors/num-of-doors_weights/ShapeClinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stackElinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stack_1Elinear/linear/num-of-doors/num-of-doors_weights/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
y
7linear/linear/num-of-doors/num-of-doors_weights/stack/0Const*
dtype0*
_output_shapes
: *
value	B :
�
5linear/linear/num-of-doors/num-of-doors_weights/stackPack7linear/linear/num-of-doors/num-of-doors_weights/stack/0=linear/linear/num-of-doors/num-of-doors_weights/strided_slice*
T0*
_output_shapes
:*
N*

axis 
�
4linear/linear/num-of-doors/num-of-doors_weights/TileTile9linear/linear/num-of-doors/num-of-doors_weights/Reshape_15linear/linear/num-of-doors/num-of-doors_weights/stack*
T0
*0
_output_shapes
:������������������*

Tmultiples0
�
:linear/linear/num-of-doors/num-of-doors_weights/zeros_like	ZerosLikeGlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
/linear/linear/num-of-doors/num-of-doors_weightsSelect4linear/linear/num-of-doors/num-of-doors_weights/Tile:linear/linear/num-of-doors/num-of-doors_weights/zeros_likeGlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse*
T0*'
_output_shapes
:���������
�
6linear/linear/num-of-doors/num-of-doors_weights/Cast_1Cast(linear/linear/DenseToSparseTensor_2/Cast*

SrcT0	*
_output_shapes
:*

DstT0
�
=linear/linear/num-of-doors/num-of-doors_weights/Slice_1/beginConst*
dtype0*
_output_shapes
:*
valueB: 
�
<linear/linear/num-of-doors/num-of-doors_weights/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
�
7linear/linear/num-of-doors/num-of-doors_weights/Slice_1Slice6linear/linear/num-of-doors/num-of-doors_weights/Cast_1=linear/linear/num-of-doors/num-of-doors_weights/Slice_1/begin<linear/linear/num-of-doors/num-of-doors_weights/Slice_1/size*
T0*
_output_shapes
:*
Index0
�
7linear/linear/num-of-doors/num-of-doors_weights/Shape_1Shape/linear/linear/num-of-doors/num-of-doors_weights*
T0*
out_type0*
_output_shapes
:
�
=linear/linear/num-of-doors/num-of-doors_weights/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB:
�
<linear/linear/num-of-doors/num-of-doors_weights/Slice_2/sizeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
7linear/linear/num-of-doors/num-of-doors_weights/Slice_2Slice7linear/linear/num-of-doors/num-of-doors_weights/Shape_1=linear/linear/num-of-doors/num-of-doors_weights/Slice_2/begin<linear/linear/num-of-doors/num-of-doors_weights/Slice_2/size*
T0*
_output_shapes
:*
Index0
}
;linear/linear/num-of-doors/num-of-doors_weights/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
6linear/linear/num-of-doors/num-of-doors_weights/concatConcatV27linear/linear/num-of-doors/num-of-doors_weights/Slice_17linear/linear/num-of-doors/num-of-doors_weights/Slice_2;linear/linear/num-of-doors/num-of-doors_weights/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
9linear/linear/num-of-doors/num-of-doors_weights/Reshape_2Reshape/linear/linear/num-of-doors/num-of-doors_weights6linear/linear/num-of-doors/num-of-doors_weights/concat*
T0*'
_output_shapes
:���������*
Tshape0
n
linear/linear/Reshape_6/shapeConst*
dtype0*
_output_shapes
:*
valueB"����   
�
linear/linear/Reshape_6Reshape9linear/linear/num-of-doors/num-of-doors_weights/Reshape_2linear/linear/Reshape_6/shape*
T0*'
_output_shapes
:���������*
Tshape0
�
linear/linear/AddNAddNlinear/linear/Reshapelinear/linear/Reshape_1linear/linear/Reshape_2linear/linear/Reshape_3linear/linear/Reshape_4linear/linear/Reshape_5linear/linear/Reshape_6*
T0*
_output_shapes

:@*
N
�
+linear/bias_weight/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *,
_class"
 loc:@linear/bias_weight/part_0
�
linear/bias_weight/part_0
VariableV2*
	container *,
_class"
 loc:@linear/bias_weight/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
 linear/bias_weight/part_0/AssignAssignlinear/bias_weight/part_0+linear/bias_weight/part_0/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
�
linear/bias_weight/part_0/readIdentitylinear/bias_weight/part_0*
T0*
_output_shapes
:*,
_class"
 loc:@linear/bias_weight/part_0
c
linear/bias_weightIdentitylinear/bias_weight/part_0/read*
T0*
_output_shapes
:
�
linear/linear/BiasAddBiasAddlinear/linear/AddNlinear/bias_weight*
T0*
_output_shapes

:@*
data_formatNHWC
�
)linear/regression_head/predictions/scoresSqueezelinear/linear/BiasAdd*
T0*
_output_shapes
:@*
squeeze_dims

�
+linear/regression_head/predictions/IdentityIdentity)linear/regression_head/predictions/scores*
T0*
_output_shapes
:@
�
7linear/regression_head/mean_squared_loss/ExpandDims/dimConst*
dtype0*
_output_shapes
:*
valueB:
�
3linear/regression_head/mean_squared_loss/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:87linear/regression_head/mean_squared_loss/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
,linear/regression_head/mean_squared_loss/subSublinear/linear/BiasAdd3linear/regression_head/mean_squared_loss/ExpandDims*
T0*
_output_shapes

:@
�
(linear/regression_head/mean_squared_lossSquare,linear/regression_head/mean_squared_loss/sub*
T0*
_output_shapes

:@
�
3linear/regression_head/mean_squared_loss/loss/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
-linear/regression_head/mean_squared_loss/lossMean(linear/regression_head/mean_squared_loss3linear/regression_head/mean_squared_loss/loss/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
n
)linear/regression_head/ScalarSummary/tagsConst*
dtype0*
_output_shapes
: *
valueB
 Bloss
�
$linear/regression_head/ScalarSummaryScalarSummary)linear/regression_head/ScalarSummary/tags-linear/regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: 
m
linear/regression_head/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
t
*linear/regression_head/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
v
,linear/regression_head/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
v
,linear/regression_head/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
$linear/regression_head/strided_sliceStridedSlicelinear/regression_head/Shape*linear/regression_head/strided_slice/stack,linear/regression_head/strided_slice/stack_1,linear/regression_head/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
r
/linear/regression_head/train_op/gradients/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
t
/linear/regression_head/train_op/gradients/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
.linear/regression_head/train_op/gradients/FillFill/linear/regression_head/train_op/gradients/Shape/linear/regression_head/train_op/gradients/Const*
T0*
_output_shapes
: 
�
jlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"      
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/ReshapeReshape.linear/regression_head/train_op/gradients/Filljlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Reshape/shape*
T0*
_output_shapes

:*
Tshape0
�
klinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Tile/multiplesConst*
dtype0*
_output_shapes
:*
valueB"@      
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/TileTiledlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Reshapeklinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Tile/multiples*
T0*
_output_shapes

:@*

Tmultiples0
�
blinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Shape_1Const*
dtype0*
_output_shapes
: *
valueB 
�
blinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/ProdProdblinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Shapeblinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
clinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Prod_1Proddlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Shape_1dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Const_1*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
flinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Maximum/yConst*
dtype0*
_output_shapes
: *
value	B :
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/MaximumMaximumclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Prod_1flinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Maximum/y*
T0*
_output_shapes
: 
�
elinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/floordivFloorDivalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Proddlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Maximum*
T0*
_output_shapes
: 
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/CastCastelinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0
�
dlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/truedivRealDivalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Tilealinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/Cast*
T0*
_output_shapes

:@
�
]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul/xConste^linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/truediv*
dtype0*
_output_shapes
: *
valueB
 *   @
�
[linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mulMul]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul/x,linear/regression_head/mean_squared_loss/sub*
T0*
_output_shapes

:@
�
]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul_1Muldlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/loss_grad/truediv[linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul*
T0*
_output_shapes

:@
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
clinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB"@      
�
qlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgsBroadcastGradientArgsalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
_linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/SumSum]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul_1qlinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgs*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
�
clinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeReshape_linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Sumalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
alinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Sum_1Sum]linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss_grad/mul_1slinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
�
_linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/NegNegalinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Sum_1*
T0*
_output_shapes
:
�
elinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Reshape_1Reshape_linear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Negclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Shape_1*
T0*
_output_shapes

:@*
Tshape0
�
Plinear/regression_head/train_op/gradients/linear/linear/BiasAdd_grad/BiasAddGradBiasAddGradclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/Reshape*
T0*
_output_shapes
:*
data_formatNHWC
�
Jlinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeJlinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_4_grad/ShapeShape)linear/linear/make/make_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_4_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_4_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_5_grad/ShapeShapeAlinear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_5_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_5_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Llinear/regression_head/train_op/gradients/linear/linear/Reshape_6_grad/ShapeShape9linear/linear/num-of-doors/num-of-doors_weights/Reshape_2*
T0*
out_type0*
_output_shapes
:
�
Nlinear/regression_head/train_op/gradients/linear/linear/Reshape_6_grad/ReshapeReshapeclinear/regression_head/train_op/gradients/linear/regression_head/mean_squared_loss/sub_grad/ReshapeLlinear/regression_head/train_op/gradients/linear/linear/Reshape_6_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Qlinear/regression_head/train_op/gradients/linear/linear/height/matmul_grad/MatMulMatMulLlinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/Reshapelinear/height/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Slinear/regression_head/train_op/gradients/linear/linear/height/matmul_grad/MatMul_1MatMullinear/linear/height/ExpandDimsLlinear/regression_head/train_op/gradients/linear/linear/Reshape_grad/Reshape*
T0*
_output_shapes

:*
transpose_a(*
transpose_b( 
�
Ulinear/regression_head/train_op/gradients/linear/linear/horsepower/matmul_grad/MatMulMatMulNlinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/Reshapelinear/horsepower/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Wlinear/regression_head/train_op/gradients/linear/linear/horsepower/matmul_grad/MatMul_1MatMul#linear/linear/horsepower/ExpandDimsNlinear/regression_head/train_op/gradients/linear/linear/Reshape_1_grad/Reshape*
T0*
_output_shapes

:*
transpose_a(*
transpose_b( 
�
Qlinear/regression_head/train_op/gradients/linear/linear/length/matmul_grad/MatMulMatMulNlinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/Reshapelinear/length/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Slinear/regression_head/train_op/gradients/linear/linear/length/matmul_grad/MatMul_1MatMullinear/linear/length/ExpandDimsNlinear/regression_head/train_op/gradients/linear/linear/Reshape_2_grad/Reshape*
T0*
_output_shapes

:*
transpose_a(*
transpose_b( 
�
Plinear/regression_head/train_op/gradients/linear/linear/width/matmul_grad/MatMulMatMulNlinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/Reshapelinear/width/weight*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Rlinear/regression_head/train_op/gradients/linear/linear/width/matmul_grad/MatMul_1MatMullinear/linear/width/ExpandDimsNlinear/regression_head/train_op/gradients/linear/linear/Reshape_3_grad/Reshape*
T0*
_output_shapes

:*
transpose_a(*
transpose_b( 
�
^linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/ShapeShapelinear/linear/make/make_weights*
T0*
out_type0*
_output_shapes
:
�
`linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/ReshapeReshapeNlinear/regression_head/train_op/gradients/linear/linear/Reshape_4_grad/Reshape^linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
vlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/ShapeShape7linear/linear/num-of-cylinders/num-of-cylinders_weights*
T0*
out_type0*
_output_shapes
:
�
xlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/ReshapeReshapeNlinear/regression_head/train_op/gradients/linear/linear/Reshape_5_grad/Reshapevlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
nlinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/ShapeShape/linear/linear/num-of-doors/num-of-doors_weights*
T0*
out_type0*
_output_shapes
:
�
plinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/ReshapeReshapeNlinear/regression_head/train_op/gradients/linear/linear/Reshape_6_grad/Reshapenlinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
Ylinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/zeros_like	ZerosLike*linear/linear/make/make_weights/zeros_like*
T0*'
_output_shapes
:���������
�
Ulinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/SelectSelect$linear/linear/make/make_weights/Tile`linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/ReshapeYlinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/zeros_like*
T0*
_output_shapes

:@
�
Wlinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/Select_1Select$linear/linear/make/make_weights/TileYlinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/zeros_like`linear/regression_head/train_op/gradients/linear/linear/make/make_weights/Reshape_2_grad/Reshape*
T0*
_output_shapes

:@
�
qlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/zeros_like	ZerosLikeBlinear/linear/num-of-cylinders/num-of-cylinders_weights/zeros_like*
T0*'
_output_shapes
:���������
�
mlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/SelectSelect<linear/linear/num-of-cylinders/num-of-cylinders_weights/Tilexlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/Reshapeqlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/zeros_like*
T0*
_output_shapes

:@
�
olinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/Select_1Select<linear/linear/num-of-cylinders/num-of-cylinders_weights/Tileqlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/zeros_likexlinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/Reshape_2_grad/Reshape*
T0*
_output_shapes

:@
�
ilinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/zeros_like	ZerosLike:linear/linear/num-of-doors/num-of-doors_weights/zeros_like*
T0*'
_output_shapes
:���������
�
elinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/SelectSelect4linear/linear/num-of-doors/num-of-doors_weights/Tileplinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/Reshapeilinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/zeros_like*
T0*
_output_shapes

:@
�
glinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/Select_1Select4linear/linear/num-of-doors/num-of-doors_weights/Tileilinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/zeros_likeplinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/Reshape_2_grad/Reshape*
T0*
_output_shapes

:@
�
llinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/ShapeShapeHlinear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup*
T0*
out_type0*
_output_shapes
:
�
zlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
tlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_sliceStridedSlicellinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/Shapezlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack_1|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
�
mlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/GatherGatherWlinear/regression_head/train_op/gradients/linear/linear/make/make_weights_grad/Select_1<linear/linear/make/make_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0
�
ylinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/UnsortedSegmentSumUnsortedSegmentSummlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/Gather@linear/linear/make/make_weights/embedding_lookup_sparse/Unique:1tlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/strided_slice*
T0*'
_output_shapes
:���������*
Tindices0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/ShapeShape`linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup*
T0*
out_type0*
_output_shapes
:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_sliceStridedSlice�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/GatherGatherolinear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights_grad/Select_1Tlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/UnsortedSegmentSumUnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/GatherXlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique:1�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/strided_slice*
T0*'
_output_shapes
:���������*
Tindices0
�
|linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/ShapeShapeXlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup*
T0*
out_type0*
_output_shapes
:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_sliceStridedSlice|linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *

begin_mask *
Index0
�
}linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/GatherGatherglinear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights_grad/Select_1Llinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Cast*'
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/UnsortedSegmentSumUnsortedSegmentSum}linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/GatherPlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique:1�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/strided_slice*
T0*'
_output_shapes
:���������*
Tindices0
�
}linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"2      *-
_class#
!loc:@linear/make/weights/part_0
�
|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/SizeSize>linear/linear/make/make_weights/embedding_lookup_sparse/Unique*
T0	*
out_type0*
_output_shapes
: 
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims
ExpandDims|linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/Size�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_sliceStridedSlice}linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
:*

begin_mask *
Index0
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
~linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/concatConcatV2�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeReshapeylinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse_grad/UnsortedSegmentSum~linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/concat*
T0*0
_output_shapes
:������������������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1Reshape>linear/linear/make/make_weights/embedding_lookup_sparse/Unique�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims*
T0	*#
_output_shapes
:���������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"      *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/SizeSizeVlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique*
T0	*
out_type0*
_output_shapes
: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims
ExpandDims�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Size�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_sliceStridedSlice�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
:*

begin_mask *
Index0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/concatConcatV2�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeReshape�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse_grad/UnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/concat*
T0*0
_output_shapes
:������������������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1ReshapeVlinear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/Unique�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims*
T0	*#
_output_shapes
:���������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"      *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/SizeSizeNlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique*
T0	*
out_type0*
_output_shapes
: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims
ExpandDims�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/Size�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_sliceStridedSlice�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/Shape�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_1�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
:*

begin_mask *
Index0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/concatConcatV2�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/strided_slice�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeReshape�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse_grad/UnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/concat*
T0*0
_output_shapes
:������������������*
Tshape0
�
�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1ReshapeNlinear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/Unique�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ExpandDims*
T0	*#
_output_shapes
:���������*
Tshape0
�
%linear/regression_head/train_op/ConstConst*
dtype0*
_output_shapes

:*
valueB*���=*.
_class$
" loc:@linear/height/weight/part_0
�
7linear/regression_head/linear/height/weight/part_0/Ftrl
VariableV2*
	container *.
_class$
" loc:@linear/height/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
>linear/regression_head/linear/height/weight/part_0/Ftrl/AssignAssign7linear/regression_head/linear/height/weight/part_0/Ftrl%linear/regression_head/train_op/Const*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
�
<linear/regression_head/linear/height/weight/part_0/Ftrl/readIdentity7linear/regression_head/linear/height/weight/part_0/Ftrl*
T0*
_output_shapes

:*.
_class$
" loc:@linear/height/weight/part_0
�
Klinear/regression_head/linear/height/weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *.
_class$
" loc:@linear/height/weight/part_0
�
9linear/regression_head/linear/height/weight/part_0/Ftrl_1
VariableV2*
	container *.
_class$
" loc:@linear/height/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
@linear/regression_head/linear/height/weight/part_0/Ftrl_1/AssignAssign9linear/regression_head/linear/height/weight/part_0/Ftrl_1Klinear/regression_head/linear/height/weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
�
>linear/regression_head/linear/height/weight/part_0/Ftrl_1/readIdentity9linear/regression_head/linear/height/weight/part_0/Ftrl_1*
T0*
_output_shapes

:*.
_class$
" loc:@linear/height/weight/part_0
�
'linear/regression_head/train_op/Const_1Const*
dtype0*
_output_shapes

:*
valueB*���=*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
;linear/regression_head/linear/horsepower/weight/part_0/Ftrl
VariableV2*
	container *2
_class(
&$loc:@linear/horsepower/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Blinear/regression_head/linear/horsepower/weight/part_0/Ftrl/AssignAssign;linear/regression_head/linear/horsepower/weight/part_0/Ftrl'linear/regression_head/train_op/Const_1*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
@linear/regression_head/linear/horsepower/weight/part_0/Ftrl/readIdentity;linear/regression_head/linear/horsepower/weight/part_0/Ftrl*
T0*
_output_shapes

:*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
Olinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1
VariableV2*
	container *2
_class(
&$loc:@linear/horsepower/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Dlinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/AssignAssign=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1Olinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
Blinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/readIdentity=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1*
T0*
_output_shapes

:*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
'linear/regression_head/train_op/Const_2Const*
dtype0*
_output_shapes

:*
valueB*���=*.
_class$
" loc:@linear/length/weight/part_0
�
7linear/regression_head/linear/length/weight/part_0/Ftrl
VariableV2*
	container *.
_class$
" loc:@linear/length/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
>linear/regression_head/linear/length/weight/part_0/Ftrl/AssignAssign7linear/regression_head/linear/length/weight/part_0/Ftrl'linear/regression_head/train_op/Const_2*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
�
<linear/regression_head/linear/length/weight/part_0/Ftrl/readIdentity7linear/regression_head/linear/length/weight/part_0/Ftrl*
T0*
_output_shapes

:*.
_class$
" loc:@linear/length/weight/part_0
�
Klinear/regression_head/linear/length/weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *.
_class$
" loc:@linear/length/weight/part_0
�
9linear/regression_head/linear/length/weight/part_0/Ftrl_1
VariableV2*
	container *.
_class$
" loc:@linear/length/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
@linear/regression_head/linear/length/weight/part_0/Ftrl_1/AssignAssign9linear/regression_head/linear/length/weight/part_0/Ftrl_1Klinear/regression_head/linear/length/weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
�
>linear/regression_head/linear/length/weight/part_0/Ftrl_1/readIdentity9linear/regression_head/linear/length/weight/part_0/Ftrl_1*
T0*
_output_shapes

:*.
_class$
" loc:@linear/length/weight/part_0
�
'linear/regression_head/train_op/Const_3Const*
dtype0*
_output_shapes

:*
valueB*���=*-
_class#
!loc:@linear/width/weight/part_0
�
6linear/regression_head/linear/width/weight/part_0/Ftrl
VariableV2*
	container *-
_class#
!loc:@linear/width/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
=linear/regression_head/linear/width/weight/part_0/Ftrl/AssignAssign6linear/regression_head/linear/width/weight/part_0/Ftrl'linear/regression_head/train_op/Const_3*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
;linear/regression_head/linear/width/weight/part_0/Ftrl/readIdentity6linear/regression_head/linear/width/weight/part_0/Ftrl*
T0*
_output_shapes

:*-
_class#
!loc:@linear/width/weight/part_0
�
Jlinear/regression_head/linear/width/weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *-
_class#
!loc:@linear/width/weight/part_0
�
8linear/regression_head/linear/width/weight/part_0/Ftrl_1
VariableV2*
	container *-
_class#
!loc:@linear/width/weight/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
?linear/regression_head/linear/width/weight/part_0/Ftrl_1/AssignAssign8linear/regression_head/linear/width/weight/part_0/Ftrl_1Jlinear/regression_head/linear/width/weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
=linear/regression_head/linear/width/weight/part_0/Ftrl_1/readIdentity8linear/regression_head/linear/width/weight/part_0/Ftrl_1*
T0*
_output_shapes

:*-
_class#
!loc:@linear/width/weight/part_0
�
'linear/regression_head/train_op/Const_4Const*
dtype0*
_output_shapes

:2*
valueB2*���=*-
_class#
!loc:@linear/make/weights/part_0
�
6linear/regression_head/linear/make/weights/part_0/Ftrl
VariableV2*
	container *-
_class#
!loc:@linear/make/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
=linear/regression_head/linear/make/weights/part_0/Ftrl/AssignAssign6linear/regression_head/linear/make/weights/part_0/Ftrl'linear/regression_head/train_op/Const_4*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
;linear/regression_head/linear/make/weights/part_0/Ftrl/readIdentity6linear/regression_head/linear/make/weights/part_0/Ftrl*
T0*
_output_shapes

:2*-
_class#
!loc:@linear/make/weights/part_0
�
Jlinear/regression_head/linear/make/weights/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:2*
valueB2*    *-
_class#
!loc:@linear/make/weights/part_0
�
8linear/regression_head/linear/make/weights/part_0/Ftrl_1
VariableV2*
	container *-
_class#
!loc:@linear/make/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
?linear/regression_head/linear/make/weights/part_0/Ftrl_1/AssignAssign8linear/regression_head/linear/make/weights/part_0/Ftrl_1Jlinear/regression_head/linear/make/weights/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
=linear/regression_head/linear/make/weights/part_0/Ftrl_1/readIdentity8linear/regression_head/linear/make/weights/part_0/Ftrl_1*
T0*
_output_shapes

:2*-
_class#
!loc:@linear/make/weights/part_0
�
'linear/regression_head/train_op/Const_5Const*
dtype0*
_output_shapes

:*
valueB*���=*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Blinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl
VariableV2*
	container *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Ilinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl/AssignAssignBlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl'linear/regression_head/train_op/Const_5*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Glinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl/readIdentityBlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl*
T0*
_output_shapes

:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Vlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Dlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1
VariableV2*
	container *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Klinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/AssignAssignDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1Vlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Ilinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/readIdentityDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1*
T0*
_output_shapes

:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
'linear/regression_head/train_op/Const_6Const*
dtype0*
_output_shapes

:*
valueB*���=*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl
VariableV2*
	container *5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Elinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl/AssignAssign>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl'linear/regression_head/train_op/Const_6*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Clinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl/readIdentity>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl*
T0*
_output_shapes

:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Rlinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes

:*
valueB*    *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1
VariableV2*
	container *5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
dtype0*
_output_shapes

:*
shape
:*
shared_name 
�
Glinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/AssignAssign@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1Rlinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Elinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/readIdentity@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1*
T0*
_output_shapes

:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
'linear/regression_head/train_op/Const_7Const*
dtype0*
_output_shapes
:*
valueB*���=*,
_class"
 loc:@linear/bias_weight/part_0
�
5linear/regression_head/linear/bias_weight/part_0/Ftrl
VariableV2*
	container *,
_class"
 loc:@linear/bias_weight/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
<linear/regression_head/linear/bias_weight/part_0/Ftrl/AssignAssign5linear/regression_head/linear/bias_weight/part_0/Ftrl'linear/regression_head/train_op/Const_7*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
�
:linear/regression_head/linear/bias_weight/part_0/Ftrl/readIdentity5linear/regression_head/linear/bias_weight/part_0/Ftrl*
T0*
_output_shapes
:*,
_class"
 loc:@linear/bias_weight/part_0
�
Ilinear/regression_head/linear/bias_weight/part_0/Ftrl_1/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *,
_class"
 loc:@linear/bias_weight/part_0
�
7linear/regression_head/linear/bias_weight/part_0/Ftrl_1
VariableV2*
	container *,
_class"
 loc:@linear/bias_weight/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
>linear/regression_head/linear/bias_weight/part_0/Ftrl_1/AssignAssign7linear/regression_head/linear/bias_weight/part_0/Ftrl_1Ilinear/regression_head/linear/bias_weight/part_0/Ftrl_1/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
�
<linear/regression_head/linear/bias_weight/part_0/Ftrl_1/readIdentity7linear/regression_head/linear/bias_weight/part_0/Ftrl_1*
T0*
_output_shapes
:*,
_class"
 loc:@linear/bias_weight/part_0
w
2linear/regression_head/train_op/Ftrl/learning_rateConst*
dtype0*
_output_shapes
: *
valueB
 *��L>
�
?linear/regression_head/train_op/Ftrl/l1_regularization_strengthConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
?linear/regression_head/train_op/Ftrl/l2_regularization_strengthConst*
dtype0*
_output_shapes
: *
valueB
 *    
}
8linear/regression_head/train_op/Ftrl/learning_rate_powerConst*
dtype0*
_output_shapes
: *
valueB
 *   �
�
Qlinear/regression_head/train_op/Ftrl/update_linear/height/weight/part_0/ApplyFtrl	ApplyFtrllinear/height/weight/part_07linear/regression_head/linear/height/weight/part_0/Ftrl9linear/regression_head/linear/height/weight/part_0/Ftrl_1Slinear/regression_head/train_op/gradients/linear/linear/height/matmul_grad/MatMul_12linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *.
_class$
" loc:@linear/height/weight/part_0
�
Ulinear/regression_head/train_op/Ftrl/update_linear/horsepower/weight/part_0/ApplyFtrl	ApplyFtrllinear/horsepower/weight/part_0;linear/regression_head/linear/horsepower/weight/part_0/Ftrl=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1Wlinear/regression_head/train_op/gradients/linear/linear/horsepower/matmul_grad/MatMul_12linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
Qlinear/regression_head/train_op/Ftrl/update_linear/length/weight/part_0/ApplyFtrl	ApplyFtrllinear/length/weight/part_07linear/regression_head/linear/length/weight/part_0/Ftrl9linear/regression_head/linear/length/weight/part_0/Ftrl_1Slinear/regression_head/train_op/gradients/linear/linear/length/matmul_grad/MatMul_12linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *.
_class$
" loc:@linear/length/weight/part_0
�
Plinear/regression_head/train_op/Ftrl/update_linear/width/weight/part_0/ApplyFtrl	ApplyFtrllinear/width/weight/part_06linear/regression_head/linear/width/weight/part_0/Ftrl8linear/regression_head/linear/width/weight/part_0/Ftrl_1Rlinear/regression_head/train_op/gradients/linear/linear/width/matmul_grad/MatMul_12linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *-
_class#
!loc:@linear/width/weight/part_0
�
Mlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/UniqueUnique�linear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0*-
_class#
!loc:@linear/make/weights/part_0
�
Llinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/ShapeShapeMlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/Unique*
T0	*
out_type0*
_output_shapes
:*-
_class#
!loc:@linear/make/weights/part_0
�
Zlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: *-
_class#
!loc:@linear/make/weights/part_0
�
\linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:*-
_class#
!loc:@linear/make/weights/part_0
�
\linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:*-
_class#
!loc:@linear/make/weights/part_0
�
Tlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_sliceStridedSliceLlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/ShapeZlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack\linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack_1\linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *-
_class#
!loc:@linear/make/weights/part_0*

begin_mask *
Index0
�
Ylinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/UnsortedSegmentSumUnsortedSegmentSumlinear/regression_head/train_op/gradients/linear/linear/make/make_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeOlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/Unique:1Tlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/strided_slice*
T0*0
_output_shapes
:������������������*-
_class#
!loc:@linear/make/weights/part_0*
Tindices0
�
Vlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/SparseApplyFtrlSparseApplyFtrllinear/make/weights/part_06linear/regression_head/linear/make/weights/part_0/Ftrl8linear/regression_head/linear/make/weights/part_0/Ftrl_1Ylinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/UnsortedSegmentSumMlinear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/Unique2linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:2*
use_locking( *
Tindices0	*-
_class#
!loc:@linear/make/weights/part_0
�
Ylinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/UniqueUnique�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Xlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/ShapeShapeYlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/Unique*
T0	*
out_type0*
_output_shapes
:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
flinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
hlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
hlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
`linear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_sliceStridedSliceXlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/Shapeflinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stackhlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stack_1hlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*

begin_mask *
Index0
�
elinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/UnsortedSegmentSumUnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-cylinders/num-of-cylinders_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape[linear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/Unique:1`linear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/strided_slice*
T0*0
_output_shapes
:������������������*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0*
Tindices0
�
blinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/SparseApplyFtrlSparseApplyFtrl&linear/num-of-cylinders/weights/part_0Blinear/regression_head/linear/num-of-cylinders/weights/part_0/FtrlDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1elinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/UnsortedSegmentSumYlinear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/Unique2linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *
Tindices0	*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
Ulinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/UniqueUnique�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/Reshape_1*
T0	*2
_output_shapes 
:���������:���������*
out_idx0*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Tlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/ShapeShapeUlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/Unique*
T0	*
out_type0*
_output_shapes
:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
blinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
dlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
dlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
\linear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_sliceStridedSliceTlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/Shapeblinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stackdlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stack_1dlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
T0*
_output_shapes
: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0*

begin_mask *
Index0
�
alinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/UnsortedSegmentSumUnsortedSegmentSum�linear/regression_head/train_op/gradients/linear/linear/num-of-doors/num-of-doors_weights/embedding_lookup_sparse/embedding_lookup_grad/ReshapeWlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/Unique:1\linear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/strided_slice*
T0*0
_output_shapes
:������������������*5
_class+
)'loc:@linear/num-of-doors/weights/part_0*
Tindices0
�
^linear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/SparseApplyFtrlSparseApplyFtrl"linear/num-of-doors/weights/part_0>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1alinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/UnsortedSegmentSumUlinear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/Unique2linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes

:*
use_locking( *
Tindices0	*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
Olinear/regression_head/train_op/Ftrl/update_linear/bias_weight/part_0/ApplyFtrl	ApplyFtrllinear/bias_weight/part_05linear/regression_head/linear/bias_weight/part_0/Ftrl7linear/regression_head/linear/bias_weight/part_0/Ftrl_1Plinear/regression_head/train_op/gradients/linear/linear/BiasAdd_grad/BiasAddGrad2linear/regression_head/train_op/Ftrl/learning_rate?linear/regression_head/train_op/Ftrl/l1_regularization_strength?linear/regression_head/train_op/Ftrl/l2_regularization_strength8linear/regression_head/train_op/Ftrl/learning_rate_power*
T0*
_output_shapes
:*
use_locking( *,
_class"
 loc:@linear/bias_weight/part_0
�
+linear/regression_head/train_op/Ftrl/updateNoOpR^linear/regression_head/train_op/Ftrl/update_linear/height/weight/part_0/ApplyFtrlV^linear/regression_head/train_op/Ftrl/update_linear/horsepower/weight/part_0/ApplyFtrlR^linear/regression_head/train_op/Ftrl/update_linear/length/weight/part_0/ApplyFtrlQ^linear/regression_head/train_op/Ftrl/update_linear/width/weight/part_0/ApplyFtrlW^linear/regression_head/train_op/Ftrl/update_linear/make/weights/part_0/SparseApplyFtrlc^linear/regression_head/train_op/Ftrl/update_linear/num-of-cylinders/weights/part_0/SparseApplyFtrl_^linear/regression_head/train_op/Ftrl/update_linear/num-of-doors/weights/part_0/SparseApplyFtrlP^linear/regression_head/train_op/Ftrl/update_linear/bias_weight/part_0/ApplyFtrl
�
*linear/regression_head/train_op/Ftrl/valueConst,^linear/regression_head/train_op/Ftrl/update*
dtype0	*
_output_shapes
: *
value	B	 R*
_class
loc:@global_step
�
$linear/regression_head/train_op/Ftrl	AssignAddglobal_step*linear/regression_head/train_op/Ftrl/value*
T0	*
_output_shapes
: *
use_locking( *
_class
loc:@global_step
n
)linear/regression_head/metrics/mean/zerosConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
)linear/regression_head/metrics/mean/total
VariableV2*
dtype0*
	container *
_output_shapes
: *
shape: *
shared_name 
�
0linear/regression_head/metrics/mean/total/AssignAssign)linear/regression_head/metrics/mean/total)linear/regression_head/metrics/mean/zeros*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*<
_class2
0.loc:@linear/regression_head/metrics/mean/total
�
.linear/regression_head/metrics/mean/total/readIdentity)linear/regression_head/metrics/mean/total*
T0*
_output_shapes
: *<
_class2
0.loc:@linear/regression_head/metrics/mean/total
p
+linear/regression_head/metrics/mean/zeros_1Const*
dtype0*
_output_shapes
: *
valueB
 *    
�
)linear/regression_head/metrics/mean/count
VariableV2*
dtype0*
	container *
_output_shapes
: *
shape: *
shared_name 
�
0linear/regression_head/metrics/mean/count/AssignAssign)linear/regression_head/metrics/mean/count+linear/regression_head/metrics/mean/zeros_1*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*<
_class2
0.loc:@linear/regression_head/metrics/mean/count
�
.linear/regression_head/metrics/mean/count/readIdentity)linear/regression_head/metrics/mean/count*
T0*
_output_shapes
: *<
_class2
0.loc:@linear/regression_head/metrics/mean/count
j
(linear/regression_head/metrics/mean/SizeConst*
dtype0*
_output_shapes
: *
value	B :
�
-linear/regression_head/metrics/mean/ToFloat_1Cast(linear/regression_head/metrics/mean/Size*

SrcT0*
_output_shapes
: *

DstT0
l
)linear/regression_head/metrics/mean/ConstConst*
dtype0*
_output_shapes
: *
valueB 
�
'linear/regression_head/metrics/mean/SumSum-linear/regression_head/mean_squared_loss/loss)linear/regression_head/metrics/mean/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
-linear/regression_head/metrics/mean/AssignAdd	AssignAdd)linear/regression_head/metrics/mean/total'linear/regression_head/metrics/mean/Sum*
T0*
_output_shapes
: *
use_locking( *<
_class2
0.loc:@linear/regression_head/metrics/mean/total
�
/linear/regression_head/metrics/mean/AssignAdd_1	AssignAdd)linear/regression_head/metrics/mean/count-linear/regression_head/metrics/mean/ToFloat_1.^linear/regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: *
use_locking( *<
_class2
0.loc:@linear/regression_head/metrics/mean/count
r
-linear/regression_head/metrics/mean/Greater/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
+linear/regression_head/metrics/mean/GreaterGreater.linear/regression_head/metrics/mean/count/read-linear/regression_head/metrics/mean/Greater/y*
T0*
_output_shapes
: 
�
+linear/regression_head/metrics/mean/truedivRealDiv.linear/regression_head/metrics/mean/total/read.linear/regression_head/metrics/mean/count/read*
T0*
_output_shapes
: 
p
+linear/regression_head/metrics/mean/value/eConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
)linear/regression_head/metrics/mean/valueSelect+linear/regression_head/metrics/mean/Greater+linear/regression_head/metrics/mean/truediv+linear/regression_head/metrics/mean/value/e*
T0*
_output_shapes
: 
t
/linear/regression_head/metrics/mean/Greater_1/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
-linear/regression_head/metrics/mean/Greater_1Greater/linear/regression_head/metrics/mean/AssignAdd_1/linear/regression_head/metrics/mean/Greater_1/y*
T0*
_output_shapes
: 
�
-linear/regression_head/metrics/mean/truediv_1RealDiv-linear/regression_head/metrics/mean/AssignAdd/linear/regression_head/metrics/mean/AssignAdd_1*
T0*
_output_shapes
: 
t
/linear/regression_head/metrics/mean/update_op/eConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
-linear/regression_head/metrics/mean/update_opSelect-linear/regression_head/metrics/mean/Greater_1-linear/regression_head/metrics/mean/truediv_1/linear/regression_head/metrics/mean/update_op/e*
T0*
_output_shapes
: 
�
initNoOp^global_step/Assign#^linear/height/weight/part_0/Assign'^linear/horsepower/weight/part_0/Assign#^linear/length/weight/part_0/Assign"^linear/width/weight/part_0/Assign"^linear/make/weights/part_0/Assign.^linear/num-of-cylinders/weights/part_0/Assign*^linear/num-of-doors/weights/part_0/Assign!^linear/bias_weight/part_0/Assign?^linear/regression_head/linear/height/weight/part_0/Ftrl/AssignA^linear/regression_head/linear/height/weight/part_0/Ftrl_1/AssignC^linear/regression_head/linear/horsepower/weight/part_0/Ftrl/AssignE^linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/Assign?^linear/regression_head/linear/length/weight/part_0/Ftrl/AssignA^linear/regression_head/linear/length/weight/part_0/Ftrl_1/Assign>^linear/regression_head/linear/width/weight/part_0/Ftrl/Assign@^linear/regression_head/linear/width/weight/part_0/Ftrl_1/Assign>^linear/regression_head/linear/make/weights/part_0/Ftrl/Assign@^linear/regression_head/linear/make/weights/part_0/Ftrl_1/AssignJ^linear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl/AssignL^linear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/AssignF^linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl/AssignH^linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/Assign=^linear/regression_head/linear/bias_weight/part_0/Ftrl/Assign?^linear/regression_head/linear/bias_weight/part_0/Ftrl_1/Assign

init_1NoOp
"

group_depsNoOp^init^init_1
�
4report_uninitialized_variables/IsVariableInitializedIsVariableInitializedglobal_step*
dtype0	*
_output_shapes
: *
_class
loc:@global_step
�
6report_uninitialized_variables/IsVariableInitialized_1IsVariableInitializedlinear/height/weight/part_0*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/height/weight/part_0
�
6report_uninitialized_variables/IsVariableInitialized_2IsVariableInitializedlinear/horsepower/weight/part_0*
dtype0*
_output_shapes
: *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
6report_uninitialized_variables/IsVariableInitialized_3IsVariableInitializedlinear/length/weight/part_0*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/length/weight/part_0
�
6report_uninitialized_variables/IsVariableInitialized_4IsVariableInitializedlinear/width/weight/part_0*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/width/weight/part_0
�
6report_uninitialized_variables/IsVariableInitialized_5IsVariableInitializedlinear/make/weights/part_0*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/make/weights/part_0
�
6report_uninitialized_variables/IsVariableInitialized_6IsVariableInitialized&linear/num-of-cylinders/weights/part_0*
dtype0*
_output_shapes
: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
6report_uninitialized_variables/IsVariableInitialized_7IsVariableInitialized"linear/num-of-doors/weights/part_0*
dtype0*
_output_shapes
: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
6report_uninitialized_variables/IsVariableInitialized_8IsVariableInitializedlinear/bias_weight/part_0*
dtype0*
_output_shapes
: *,
_class"
 loc:@linear/bias_weight/part_0
�
6report_uninitialized_variables/IsVariableInitialized_9IsVariableInitialized7linear/regression_head/linear/height/weight/part_0/Ftrl*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/height/weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_10IsVariableInitialized9linear/regression_head/linear/height/weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/height/weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_11IsVariableInitialized;linear/regression_head/linear/horsepower/weight/part_0/Ftrl*
dtype0*
_output_shapes
: *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_12IsVariableInitialized=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_13IsVariableInitialized7linear/regression_head/linear/length/weight/part_0/Ftrl*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/length/weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_14IsVariableInitialized9linear/regression_head/linear/length/weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/length/weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_15IsVariableInitialized6linear/regression_head/linear/width/weight/part_0/Ftrl*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/width/weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_16IsVariableInitialized8linear/regression_head/linear/width/weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/width/weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_17IsVariableInitialized6linear/regression_head/linear/make/weights/part_0/Ftrl*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/make/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_18IsVariableInitialized8linear/regression_head/linear/make/weights/part_0/Ftrl_1*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/make/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_19IsVariableInitializedBlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl*
dtype0*
_output_shapes
: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_20IsVariableInitializedDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1*
dtype0*
_output_shapes
: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_21IsVariableInitialized>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl*
dtype0*
_output_shapes
: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_22IsVariableInitialized@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1*
dtype0*
_output_shapes
: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_23IsVariableInitialized5linear/regression_head/linear/bias_weight/part_0/Ftrl*
dtype0*
_output_shapes
: *,
_class"
 loc:@linear/bias_weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_24IsVariableInitialized7linear/regression_head/linear/bias_weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *,
_class"
 loc:@linear/bias_weight/part_0
�
7report_uninitialized_variables/IsVariableInitialized_25IsVariableInitialized)linear/regression_head/metrics/mean/total*
dtype0*
_output_shapes
: *<
_class2
0.loc:@linear/regression_head/metrics/mean/total
�
7report_uninitialized_variables/IsVariableInitialized_26IsVariableInitialized)linear/regression_head/metrics/mean/count*
dtype0*
_output_shapes
: *<
_class2
0.loc:@linear/regression_head/metrics/mean/count
�
$report_uninitialized_variables/stackPack4report_uninitialized_variables/IsVariableInitialized6report_uninitialized_variables/IsVariableInitialized_16report_uninitialized_variables/IsVariableInitialized_26report_uninitialized_variables/IsVariableInitialized_36report_uninitialized_variables/IsVariableInitialized_46report_uninitialized_variables/IsVariableInitialized_56report_uninitialized_variables/IsVariableInitialized_66report_uninitialized_variables/IsVariableInitialized_76report_uninitialized_variables/IsVariableInitialized_86report_uninitialized_variables/IsVariableInitialized_97report_uninitialized_variables/IsVariableInitialized_107report_uninitialized_variables/IsVariableInitialized_117report_uninitialized_variables/IsVariableInitialized_127report_uninitialized_variables/IsVariableInitialized_137report_uninitialized_variables/IsVariableInitialized_147report_uninitialized_variables/IsVariableInitialized_157report_uninitialized_variables/IsVariableInitialized_167report_uninitialized_variables/IsVariableInitialized_177report_uninitialized_variables/IsVariableInitialized_187report_uninitialized_variables/IsVariableInitialized_197report_uninitialized_variables/IsVariableInitialized_207report_uninitialized_variables/IsVariableInitialized_217report_uninitialized_variables/IsVariableInitialized_227report_uninitialized_variables/IsVariableInitialized_237report_uninitialized_variables/IsVariableInitialized_247report_uninitialized_variables/IsVariableInitialized_257report_uninitialized_variables/IsVariableInitialized_26*
T0
*
_output_shapes
:*
N*

axis 
y
)report_uninitialized_variables/LogicalNot
LogicalNot$report_uninitialized_variables/stack*
_output_shapes
:
�
$report_uninitialized_variables/ConstConst*
dtype0*
_output_shapes
:*�

value�
B�
Bglobal_stepBlinear/height/weight/part_0Blinear/horsepower/weight/part_0Blinear/length/weight/part_0Blinear/width/weight/part_0Blinear/make/weights/part_0B&linear/num-of-cylinders/weights/part_0B"linear/num-of-doors/weights/part_0Blinear/bias_weight/part_0B7linear/regression_head/linear/height/weight/part_0/FtrlB9linear/regression_head/linear/height/weight/part_0/Ftrl_1B;linear/regression_head/linear/horsepower/weight/part_0/FtrlB=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1B7linear/regression_head/linear/length/weight/part_0/FtrlB9linear/regression_head/linear/length/weight/part_0/Ftrl_1B6linear/regression_head/linear/width/weight/part_0/FtrlB8linear/regression_head/linear/width/weight/part_0/Ftrl_1B6linear/regression_head/linear/make/weights/part_0/FtrlB8linear/regression_head/linear/make/weights/part_0/Ftrl_1BBlinear/regression_head/linear/num-of-cylinders/weights/part_0/FtrlBDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1B>linear/regression_head/linear/num-of-doors/weights/part_0/FtrlB@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1B5linear/regression_head/linear/bias_weight/part_0/FtrlB7linear/regression_head/linear/bias_weight/part_0/Ftrl_1B)linear/regression_head/metrics/mean/totalB)linear/regression_head/metrics/mean/count
{
1report_uninitialized_variables/boolean_mask/ShapeConst*
dtype0*
_output_shapes
:*
valueB:
�
?report_uninitialized_variables/boolean_mask/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Areport_uninitialized_variables/boolean_mask/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
9report_uninitialized_variables/boolean_mask/strided_sliceStridedSlice1report_uninitialized_variables/boolean_mask/Shape?report_uninitialized_variables/boolean_mask/strided_slice/stackAreport_uninitialized_variables/boolean_mask/strided_slice/stack_1Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
:*

begin_mask*
Index0
�
Breport_uninitialized_variables/boolean_mask/Prod/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB: 
�
0report_uninitialized_variables/boolean_mask/ProdProd9report_uninitialized_variables/boolean_mask/strided_sliceBreport_uninitialized_variables/boolean_mask/Prod/reduction_indices*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
}
3report_uninitialized_variables/boolean_mask/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
;report_uninitialized_variables/boolean_mask/strided_slice_1StridedSlice3report_uninitialized_variables/boolean_mask/Shape_1Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackCreport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
: *

begin_mask *
Index0
�
;report_uninitialized_variables/boolean_mask/concat/values_0Pack0report_uninitialized_variables/boolean_mask/Prod*
T0*
_output_shapes
:*
N*

axis 
y
7report_uninitialized_variables/boolean_mask/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
2report_uninitialized_variables/boolean_mask/concatConcatV2;report_uninitialized_variables/boolean_mask/concat/values_0;report_uninitialized_variables/boolean_mask/strided_slice_17report_uninitialized_variables/boolean_mask/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
3report_uninitialized_variables/boolean_mask/ReshapeReshape$report_uninitialized_variables/Const2report_uninitialized_variables/boolean_mask/concat*
T0*
_output_shapes
:*
Tshape0
�
;report_uninitialized_variables/boolean_mask/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
5report_uninitialized_variables/boolean_mask/Reshape_1Reshape)report_uninitialized_variables/LogicalNot;report_uninitialized_variables/boolean_mask/Reshape_1/shape*
T0
*
_output_shapes
:*
Tshape0
�
1report_uninitialized_variables/boolean_mask/WhereWhere5report_uninitialized_variables/boolean_mask/Reshape_1*'
_output_shapes
:���������
�
3report_uninitialized_variables/boolean_mask/SqueezeSqueeze1report_uninitialized_variables/boolean_mask/Where*
T0	*#
_output_shapes
:���������*
squeeze_dims

�
2report_uninitialized_variables/boolean_mask/GatherGather3report_uninitialized_variables/boolean_mask/Reshape3report_uninitialized_variables/boolean_mask/Squeeze*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
g
$report_uninitialized_resources/ConstConst*
dtype0*
_output_shapes
: *
valueB 
M
concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
concatConcatV22report_uninitialized_variables/boolean_mask/Gather$report_uninitialized_resources/Constconcat/axis*

Tidx0*
T0*#
_output_shapes
:���������*
N
�
6report_uninitialized_variables_1/IsVariableInitializedIsVariableInitializedglobal_step*
dtype0	*
_output_shapes
: *
_class
loc:@global_step
�
8report_uninitialized_variables_1/IsVariableInitialized_1IsVariableInitializedlinear/height/weight/part_0*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/height/weight/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_2IsVariableInitializedlinear/horsepower/weight/part_0*
dtype0*
_output_shapes
: *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_3IsVariableInitializedlinear/length/weight/part_0*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/length/weight/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_4IsVariableInitializedlinear/width/weight/part_0*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/width/weight/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_5IsVariableInitializedlinear/make/weights/part_0*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/make/weights/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_6IsVariableInitialized&linear/num-of-cylinders/weights/part_0*
dtype0*
_output_shapes
: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_7IsVariableInitialized"linear/num-of-doors/weights/part_0*
dtype0*
_output_shapes
: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_8IsVariableInitializedlinear/bias_weight/part_0*
dtype0*
_output_shapes
: *,
_class"
 loc:@linear/bias_weight/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_9IsVariableInitialized7linear/regression_head/linear/height/weight/part_0/Ftrl*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/height/weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_10IsVariableInitialized9linear/regression_head/linear/height/weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/height/weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_11IsVariableInitialized;linear/regression_head/linear/horsepower/weight/part_0/Ftrl*
dtype0*
_output_shapes
: *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_12IsVariableInitialized=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *2
_class(
&$loc:@linear/horsepower/weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_13IsVariableInitialized7linear/regression_head/linear/length/weight/part_0/Ftrl*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/length/weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_14IsVariableInitialized9linear/regression_head/linear/length/weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *.
_class$
" loc:@linear/length/weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_15IsVariableInitialized6linear/regression_head/linear/width/weight/part_0/Ftrl*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/width/weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_16IsVariableInitialized8linear/regression_head/linear/width/weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/width/weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_17IsVariableInitialized6linear/regression_head/linear/make/weights/part_0/Ftrl*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/make/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_18IsVariableInitialized8linear/regression_head/linear/make/weights/part_0/Ftrl_1*
dtype0*
_output_shapes
: *-
_class#
!loc:@linear/make/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_19IsVariableInitializedBlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl*
dtype0*
_output_shapes
: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_20IsVariableInitializedDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1*
dtype0*
_output_shapes
: *9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_21IsVariableInitialized>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl*
dtype0*
_output_shapes
: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_22IsVariableInitialized@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1*
dtype0*
_output_shapes
: *5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_23IsVariableInitialized5linear/regression_head/linear/bias_weight/part_0/Ftrl*
dtype0*
_output_shapes
: *,
_class"
 loc:@linear/bias_weight/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_24IsVariableInitialized7linear/regression_head/linear/bias_weight/part_0/Ftrl_1*
dtype0*
_output_shapes
: *,
_class"
 loc:@linear/bias_weight/part_0
�
&report_uninitialized_variables_1/stackPack6report_uninitialized_variables_1/IsVariableInitialized8report_uninitialized_variables_1/IsVariableInitialized_18report_uninitialized_variables_1/IsVariableInitialized_28report_uninitialized_variables_1/IsVariableInitialized_38report_uninitialized_variables_1/IsVariableInitialized_48report_uninitialized_variables_1/IsVariableInitialized_58report_uninitialized_variables_1/IsVariableInitialized_68report_uninitialized_variables_1/IsVariableInitialized_78report_uninitialized_variables_1/IsVariableInitialized_88report_uninitialized_variables_1/IsVariableInitialized_99report_uninitialized_variables_1/IsVariableInitialized_109report_uninitialized_variables_1/IsVariableInitialized_119report_uninitialized_variables_1/IsVariableInitialized_129report_uninitialized_variables_1/IsVariableInitialized_139report_uninitialized_variables_1/IsVariableInitialized_149report_uninitialized_variables_1/IsVariableInitialized_159report_uninitialized_variables_1/IsVariableInitialized_169report_uninitialized_variables_1/IsVariableInitialized_179report_uninitialized_variables_1/IsVariableInitialized_189report_uninitialized_variables_1/IsVariableInitialized_199report_uninitialized_variables_1/IsVariableInitialized_209report_uninitialized_variables_1/IsVariableInitialized_219report_uninitialized_variables_1/IsVariableInitialized_229report_uninitialized_variables_1/IsVariableInitialized_239report_uninitialized_variables_1/IsVariableInitialized_24*
T0
*
_output_shapes
:*
N*

axis 
}
+report_uninitialized_variables_1/LogicalNot
LogicalNot&report_uninitialized_variables_1/stack*
_output_shapes
:
�

&report_uninitialized_variables_1/ConstConst*
dtype0*
_output_shapes
:*�	
value�	B�	Bglobal_stepBlinear/height/weight/part_0Blinear/horsepower/weight/part_0Blinear/length/weight/part_0Blinear/width/weight/part_0Blinear/make/weights/part_0B&linear/num-of-cylinders/weights/part_0B"linear/num-of-doors/weights/part_0Blinear/bias_weight/part_0B7linear/regression_head/linear/height/weight/part_0/FtrlB9linear/regression_head/linear/height/weight/part_0/Ftrl_1B;linear/regression_head/linear/horsepower/weight/part_0/FtrlB=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1B7linear/regression_head/linear/length/weight/part_0/FtrlB9linear/regression_head/linear/length/weight/part_0/Ftrl_1B6linear/regression_head/linear/width/weight/part_0/FtrlB8linear/regression_head/linear/width/weight/part_0/Ftrl_1B6linear/regression_head/linear/make/weights/part_0/FtrlB8linear/regression_head/linear/make/weights/part_0/Ftrl_1BBlinear/regression_head/linear/num-of-cylinders/weights/part_0/FtrlBDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1B>linear/regression_head/linear/num-of-doors/weights/part_0/FtrlB@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1B5linear/regression_head/linear/bias_weight/part_0/FtrlB7linear/regression_head/linear/bias_weight/part_0/Ftrl_1
}
3report_uninitialized_variables_1/boolean_mask/ShapeConst*
dtype0*
_output_shapes
:*
valueB:
�
Areport_uninitialized_variables_1/boolean_mask/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
;report_uninitialized_variables_1/boolean_mask/strided_sliceStridedSlice3report_uninitialized_variables_1/boolean_mask/ShapeAreport_uninitialized_variables_1/boolean_mask/strided_slice/stackCreport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
:*

begin_mask*
Index0
�
Dreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB: 
�
2report_uninitialized_variables_1/boolean_mask/ProdProd;report_uninitialized_variables_1/boolean_mask/strided_sliceDreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indices*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 

5report_uninitialized_variables_1/boolean_mask/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
�
Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
=report_uninitialized_variables_1/boolean_mask/strided_slice_1StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_1Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0*
_output_shapes
: *

begin_mask *
Index0
�
=report_uninitialized_variables_1/boolean_mask/concat/values_0Pack2report_uninitialized_variables_1/boolean_mask/Prod*
T0*
_output_shapes
:*
N*

axis 
{
9report_uninitialized_variables_1/boolean_mask/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
4report_uninitialized_variables_1/boolean_mask/concatConcatV2=report_uninitialized_variables_1/boolean_mask/concat/values_0=report_uninitialized_variables_1/boolean_mask/strided_slice_19report_uninitialized_variables_1/boolean_mask/concat/axis*

Tidx0*
T0*
_output_shapes
:*
N
�
5report_uninitialized_variables_1/boolean_mask/ReshapeReshape&report_uninitialized_variables_1/Const4report_uninitialized_variables_1/boolean_mask/concat*
T0*
_output_shapes
:*
Tshape0
�
=report_uninitialized_variables_1/boolean_mask/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
7report_uninitialized_variables_1/boolean_mask/Reshape_1Reshape+report_uninitialized_variables_1/LogicalNot=report_uninitialized_variables_1/boolean_mask/Reshape_1/shape*
T0
*
_output_shapes
:*
Tshape0
�
3report_uninitialized_variables_1/boolean_mask/WhereWhere7report_uninitialized_variables_1/boolean_mask/Reshape_1*'
_output_shapes
:���������
�
5report_uninitialized_variables_1/boolean_mask/SqueezeSqueeze3report_uninitialized_variables_1/boolean_mask/Where*
T0	*#
_output_shapes
:���������*
squeeze_dims

�
4report_uninitialized_variables_1/boolean_mask/GatherGather5report_uninitialized_variables_1/boolean_mask/Reshape5report_uninitialized_variables_1/boolean_mask/Squeeze*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
t
init_2NoOp1^linear/regression_head/metrics/mean/total/Assign1^linear/regression_head/metrics/mean/count/Assign
u
init_all_tablesNoOp-^linear/linear/lookup_1/hash_table/table_init-^linear/linear/lookup_2/hash_table/table_init
/
group_deps_1NoOp^init_2^init_all_tables
�
Merge/MergeSummaryMergeSummarySenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full$linear/regression_head/ScalarSummary*
_output_shapes
: *
N
P

save/ConstConst*
dtype0*
_output_shapes
: *
valueB Bmodel
�
save/StringJoin/inputs_1Const*
dtype0*
_output_shapes
: *<
value3B1 B+_temp_8480bb43ed4f444189e2791e93ed1632/part
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
	separator *
_output_shapes
: *
N
Q
save/num_shardsConst*
dtype0*
_output_shapes
: *
value	B :
\
save/ShardedFilename/shardConst*
dtype0*
_output_shapes
: *
value	B : 
}
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards*
_output_shapes
: 
�	
save/SaveV2/tensor_namesConst*
dtype0*
_output_shapes
:*�
value�B�Bglobal_stepBlinear/bias_weightB.linear/bias_weight/ear/bias_weight/part_0/FtrlB0linear/bias_weight/ear/bias_weight/part_0/Ftrl_1Blinear/height/weightB0linear/height/weight/r/height/weight/part_0/FtrlB2linear/height/weight/r/height/weight/part_0/Ftrl_1Blinear/horsepower/weightB4linear/horsepower/weight/rsepower/weight/part_0/FtrlB6linear/horsepower/weight/rsepower/weight/part_0/Ftrl_1Blinear/length/weightB0linear/length/weight/r/length/weight/part_0/FtrlB2linear/length/weight/r/length/weight/part_0/Ftrl_1Blinear/make/weightsB/linear/make/weights/ar/make/weights/part_0/FtrlB1linear/make/weights/ar/make/weights/part_0/Ftrl_1Blinear/num-of-cylinders/weightsB;linear/num-of-cylinders/weights/linders/weights/part_0/FtrlB=linear/num-of-cylinders/weights/linders/weights/part_0/Ftrl_1Blinear/num-of-doors/weightsB7linear/num-of-doors/weights/f-doors/weights/part_0/FtrlB9linear/num-of-doors/weights/f-doors/weights/part_0/Ftrl_1Blinear/width/weightB/linear/width/weight/ar/width/weight/part_0/FtrlB1linear/width/weight/ar/width/weight/part_0/Ftrl_1
�
save/SaveV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*�
value�B�B B1 0,1B1 0,1B1 0,1B1 1 0,1:0,1B1 1 0,1:0,1B1 1 0,1:0,1B1 1 0,1:0,1B1 1 0,1:0,1B1 1 0,1:0,1B1 1 0,1:0,1B1 1 0,1:0,1B1 1 0,1:0,1B50 1 0,50:0,1B50 1 0,50:0,1B50 1 0,50:0,1B7 1 0,7:0,1B7 1 0,7:0,1B7 1 0,7:0,1B2 1 0,2:0,1B2 1 0,2:0,1B2 1 0,2:0,1B1 1 0,1:0,1B1 1 0,1:0,1B1 1 0,1:0,1
�
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesglobal_steplinear/bias_weight/part_0/read:linear/regression_head/linear/bias_weight/part_0/Ftrl/read<linear/regression_head/linear/bias_weight/part_0/Ftrl_1/read linear/height/weight/part_0/read<linear/regression_head/linear/height/weight/part_0/Ftrl/read>linear/regression_head/linear/height/weight/part_0/Ftrl_1/read$linear/horsepower/weight/part_0/read@linear/regression_head/linear/horsepower/weight/part_0/Ftrl/readBlinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/read linear/length/weight/part_0/read<linear/regression_head/linear/length/weight/part_0/Ftrl/read>linear/regression_head/linear/length/weight/part_0/Ftrl_1/readlinear/make/weights/part_0/read;linear/regression_head/linear/make/weights/part_0/Ftrl/read=linear/regression_head/linear/make/weights/part_0/Ftrl_1/read+linear/num-of-cylinders/weights/part_0/readGlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl/readIlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/read'linear/num-of-doors/weights/part_0/readClinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl/readElinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/readlinear/width/weight/part_0/read;linear/regression_head/linear/width/weight/part_0/Ftrl/read=linear/regression_head/linear/width/weight/part_0/Ftrl_1/read*'
dtypes
2	
�
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2*
T0*
_output_shapes
: *'
_class
loc:@save/ShardedFilename
�
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency*
T0*
_output_shapes
:*
N*

axis 
}
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const*
delete_old_dirs(
z
save/IdentityIdentity
save/Const^save/control_dependency^save/MergeV2Checkpoints*
T0*
_output_shapes
: 
o
save/RestoreV2/tensor_namesConst*
dtype0*
_output_shapes
:* 
valueBBglobal_step
h
save/RestoreV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
_output_shapes
:*
dtypes
2	
�
save/AssignAssignglobal_stepsave/RestoreV2*
T0	*
_output_shapes
: *
validate_shape(*
use_locking(*
_class
loc:@global_step
x
save/RestoreV2_1/tensor_namesConst*
dtype0*
_output_shapes
:*'
valueBBlinear/bias_weight
o
!save/RestoreV2_1/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB1 0,1
�
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_1Assignlinear/bias_weight/part_0save/RestoreV2_1*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
�
save/RestoreV2_2/tensor_namesConst*
dtype0*
_output_shapes
:*C
value:B8B.linear/bias_weight/ear/bias_weight/part_0/Ftrl
o
!save/RestoreV2_2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB1 0,1
�
save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_2Assign5linear/regression_head/linear/bias_weight/part_0/Ftrlsave/RestoreV2_2*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
�
save/RestoreV2_3/tensor_namesConst*
dtype0*
_output_shapes
:*E
value<B:B0linear/bias_weight/ear/bias_weight/part_0/Ftrl_1
o
!save/RestoreV2_3/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB1 0,1
�
save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_3Assign7linear/regression_head/linear/bias_weight/part_0/Ftrl_1save/RestoreV2_3*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*,
_class"
 loc:@linear/bias_weight/part_0
z
save/RestoreV2_4/tensor_namesConst*
dtype0*
_output_shapes
:*)
value BBlinear/height/weight
u
!save/RestoreV2_4/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_4Assignlinear/height/weight/part_0save/RestoreV2_4*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
�
save/RestoreV2_5/tensor_namesConst*
dtype0*
_output_shapes
:*E
value<B:B0linear/height/weight/r/height/weight/part_0/Ftrl
u
!save/RestoreV2_5/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_5Assign7linear/regression_head/linear/height/weight/part_0/Ftrlsave/RestoreV2_5*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
�
save/RestoreV2_6/tensor_namesConst*
dtype0*
_output_shapes
:*G
value>B<B2linear/height/weight/r/height/weight/part_0/Ftrl_1
u
!save/RestoreV2_6/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_6Assign9linear/regression_head/linear/height/weight/part_0/Ftrl_1save/RestoreV2_6*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/height/weight/part_0
~
save/RestoreV2_7/tensor_namesConst*
dtype0*
_output_shapes
:*-
value$B"Blinear/horsepower/weight
u
!save/RestoreV2_7/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_7Assignlinear/horsepower/weight/part_0save/RestoreV2_7*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
save/RestoreV2_8/tensor_namesConst*
dtype0*
_output_shapes
:*I
value@B>B4linear/horsepower/weight/rsepower/weight/part_0/Ftrl
u
!save/RestoreV2_8/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_8	RestoreV2
save/Constsave/RestoreV2_8/tensor_names!save/RestoreV2_8/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_8Assign;linear/regression_head/linear/horsepower/weight/part_0/Ftrlsave/RestoreV2_8*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
�
save/RestoreV2_9/tensor_namesConst*
dtype0*
_output_shapes
:*K
valueBB@B6linear/horsepower/weight/rsepower/weight/part_0/Ftrl_1
u
!save/RestoreV2_9/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_9	RestoreV2
save/Constsave/RestoreV2_9/tensor_names!save/RestoreV2_9/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_9Assign=linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1save/RestoreV2_9*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*2
_class(
&$loc:@linear/horsepower/weight/part_0
{
save/RestoreV2_10/tensor_namesConst*
dtype0*
_output_shapes
:*)
value BBlinear/length/weight
v
"save/RestoreV2_10/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_10	RestoreV2
save/Constsave/RestoreV2_10/tensor_names"save/RestoreV2_10/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_10Assignlinear/length/weight/part_0save/RestoreV2_10*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
�
save/RestoreV2_11/tensor_namesConst*
dtype0*
_output_shapes
:*E
value<B:B0linear/length/weight/r/length/weight/part_0/Ftrl
v
"save/RestoreV2_11/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_11	RestoreV2
save/Constsave/RestoreV2_11/tensor_names"save/RestoreV2_11/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_11Assign7linear/regression_head/linear/length/weight/part_0/Ftrlsave/RestoreV2_11*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
�
save/RestoreV2_12/tensor_namesConst*
dtype0*
_output_shapes
:*G
value>B<B2linear/length/weight/r/length/weight/part_0/Ftrl_1
v
"save/RestoreV2_12/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_12	RestoreV2
save/Constsave/RestoreV2_12/tensor_names"save/RestoreV2_12/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_12Assign9linear/regression_head/linear/length/weight/part_0/Ftrl_1save/RestoreV2_12*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*.
_class$
" loc:@linear/length/weight/part_0
z
save/RestoreV2_13/tensor_namesConst*
dtype0*
_output_shapes
:*(
valueBBlinear/make/weights
x
"save/RestoreV2_13/shape_and_slicesConst*
dtype0*
_output_shapes
:*"
valueBB50 1 0,50:0,1
�
save/RestoreV2_13	RestoreV2
save/Constsave/RestoreV2_13/tensor_names"save/RestoreV2_13/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_13Assignlinear/make/weights/part_0save/RestoreV2_13*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
save/RestoreV2_14/tensor_namesConst*
dtype0*
_output_shapes
:*D
value;B9B/linear/make/weights/ar/make/weights/part_0/Ftrl
x
"save/RestoreV2_14/shape_and_slicesConst*
dtype0*
_output_shapes
:*"
valueBB50 1 0,50:0,1
�
save/RestoreV2_14	RestoreV2
save/Constsave/RestoreV2_14/tensor_names"save/RestoreV2_14/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_14Assign6linear/regression_head/linear/make/weights/part_0/Ftrlsave/RestoreV2_14*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
save/RestoreV2_15/tensor_namesConst*
dtype0*
_output_shapes
:*F
value=B;B1linear/make/weights/ar/make/weights/part_0/Ftrl_1
x
"save/RestoreV2_15/shape_and_slicesConst*
dtype0*
_output_shapes
:*"
valueBB50 1 0,50:0,1
�
save/RestoreV2_15	RestoreV2
save/Constsave/RestoreV2_15/tensor_names"save/RestoreV2_15/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_15Assign8linear/regression_head/linear/make/weights/part_0/Ftrl_1save/RestoreV2_15*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/make/weights/part_0
�
save/RestoreV2_16/tensor_namesConst*
dtype0*
_output_shapes
:*4
value+B)Blinear/num-of-cylinders/weights
v
"save/RestoreV2_16/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB7 1 0,7:0,1
�
save/RestoreV2_16	RestoreV2
save/Constsave/RestoreV2_16/tensor_names"save/RestoreV2_16/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_16Assign&linear/num-of-cylinders/weights/part_0save/RestoreV2_16*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
save/RestoreV2_17/tensor_namesConst*
dtype0*
_output_shapes
:*P
valueGBEB;linear/num-of-cylinders/weights/linders/weights/part_0/Ftrl
v
"save/RestoreV2_17/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB7 1 0,7:0,1
�
save/RestoreV2_17	RestoreV2
save/Constsave/RestoreV2_17/tensor_names"save/RestoreV2_17/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_17AssignBlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrlsave/RestoreV2_17*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
save/RestoreV2_18/tensor_namesConst*
dtype0*
_output_shapes
:*R
valueIBGB=linear/num-of-cylinders/weights/linders/weights/part_0/Ftrl_1
v
"save/RestoreV2_18/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB7 1 0,7:0,1
�
save/RestoreV2_18	RestoreV2
save/Constsave/RestoreV2_18/tensor_names"save/RestoreV2_18/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_18AssignDlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1save/RestoreV2_18*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*9
_class/
-+loc:@linear/num-of-cylinders/weights/part_0
�
save/RestoreV2_19/tensor_namesConst*
dtype0*
_output_shapes
:*0
value'B%Blinear/num-of-doors/weights
v
"save/RestoreV2_19/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB2 1 0,2:0,1
�
save/RestoreV2_19	RestoreV2
save/Constsave/RestoreV2_19/tensor_names"save/RestoreV2_19/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_19Assign"linear/num-of-doors/weights/part_0save/RestoreV2_19*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
save/RestoreV2_20/tensor_namesConst*
dtype0*
_output_shapes
:*L
valueCBAB7linear/num-of-doors/weights/f-doors/weights/part_0/Ftrl
v
"save/RestoreV2_20/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB2 1 0,2:0,1
�
save/RestoreV2_20	RestoreV2
save/Constsave/RestoreV2_20/tensor_names"save/RestoreV2_20/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_20Assign>linear/regression_head/linear/num-of-doors/weights/part_0/Ftrlsave/RestoreV2_20*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
�
save/RestoreV2_21/tensor_namesConst*
dtype0*
_output_shapes
:*N
valueEBCB9linear/num-of-doors/weights/f-doors/weights/part_0/Ftrl_1
v
"save/RestoreV2_21/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB2 1 0,2:0,1
�
save/RestoreV2_21	RestoreV2
save/Constsave/RestoreV2_21/tensor_names"save/RestoreV2_21/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_21Assign@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1save/RestoreV2_21*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*5
_class+
)'loc:@linear/num-of-doors/weights/part_0
z
save/RestoreV2_22/tensor_namesConst*
dtype0*
_output_shapes
:*(
valueBBlinear/width/weight
v
"save/RestoreV2_22/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_22	RestoreV2
save/Constsave/RestoreV2_22/tensor_names"save/RestoreV2_22/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_22Assignlinear/width/weight/part_0save/RestoreV2_22*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
save/RestoreV2_23/tensor_namesConst*
dtype0*
_output_shapes
:*D
value;B9B/linear/width/weight/ar/width/weight/part_0/Ftrl
v
"save/RestoreV2_23/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_23	RestoreV2
save/Constsave/RestoreV2_23/tensor_names"save/RestoreV2_23/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_23Assign6linear/regression_head/linear/width/weight/part_0/Ftrlsave/RestoreV2_23*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
save/RestoreV2_24/tensor_namesConst*
dtype0*
_output_shapes
:*F
value=B;B1linear/width/weight/ar/width/weight/part_0/Ftrl_1
v
"save/RestoreV2_24/shape_and_slicesConst*
dtype0*
_output_shapes
:* 
valueBB1 1 0,1:0,1
�
save/RestoreV2_24	RestoreV2
save/Constsave/RestoreV2_24/tensor_names"save/RestoreV2_24/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_24Assign8linear/regression_head/linear/width/weight/part_0/Ftrl_1save/RestoreV2_24*
T0*
_output_shapes

:*
validate_shape(*
use_locking(*-
_class#
!loc:@linear/width/weight/part_0
�
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23^save/Assign_24
-
save/restore_allNoOp^save/restore_shard"<
save/Const:0save/Identity:0save/restore_all (5 @F8"!
local_init_op

group_deps_1"o
local_variables\
Z
+linear/regression_head/metrics/mean/total:0
+linear/regression_head/metrics/mean/count:0"�
queue_runners��
�
"enqueue_input/random_shuffle_queue.enqueue_input/random_shuffle_queue_EnqueueMany(enqueue_input/random_shuffle_queue_Close"*enqueue_input/random_shuffle_queue_Close_1*"=
losses3
1
/linear/regression_head/mean_squared_loss/loss:0" 
global_step

global_step:0"�	
trainable_variables�	�	
�
linear/height/weight/part_0:0"linear/height/weight/part_0/Assign"linear/height/weight/part_0/read:0""
linear/height/weight  "
�
!linear/horsepower/weight/part_0:0&linear/horsepower/weight/part_0/Assign&linear/horsepower/weight/part_0/read:0"&
linear/horsepower/weight  "
�
linear/length/weight/part_0:0"linear/length/weight/part_0/Assign"linear/length/weight/part_0/read:0""
linear/length/weight  "
�
linear/width/weight/part_0:0!linear/width/weight/part_0/Assign!linear/width/weight/part_0/read:0"!
linear/width/weight  "
�
linear/make/weights/part_0:0!linear/make/weights/part_0/Assign!linear/make/weights/part_0/read:0"!
linear/make/weights2  "2
�
(linear/num-of-cylinders/weights/part_0:0-linear/num-of-cylinders/weights/part_0/Assign-linear/num-of-cylinders/weights/part_0/read:0"-
linear/num-of-cylinders/weights  "
�
$linear/num-of-doors/weights/part_0:0)linear/num-of-doors/weights/part_0/Assign)linear/num-of-doors/weights/part_0/read:0")
linear/num-of-doors/weights  "
�
linear/bias_weight/part_0:0 linear/bias_weight/part_0/Assign linear/bias_weight/part_0/read:0"
linear/bias_weight ""J
savers@>
<
save/Const:0save/Identity:0save/restore_all (5 @F8"&

summary_op

Merge/MergeSummary:0"s
table_initializer^
\
,linear/linear/lookup_1/hash_table/table_init
,linear/linear/lookup_2/hash_table/table_init"�
linear�
�
linear/height/weight/part_0:0
!linear/horsepower/weight/part_0:0
linear/length/weight/part_0:0
linear/width/weight/part_0:0
linear/make/weights/part_0:0
(linear/num-of-cylinders/weights/part_0:0
$linear/num-of-doors/weights/part_0:0
linear/bias_weight/part_0:0"�
model_variables�
�
linear/height/weight/part_0:0
!linear/horsepower/weight/part_0:0
linear/length/weight/part_0:0
linear/width/weight/part_0:0
linear/make/weights/part_0:0
(linear/num-of-cylinders/weights/part_0:0
$linear/num-of-doors/weights/part_0:0
linear/bias_weight/part_0:0"U
ready_for_local_init_op:
8
6report_uninitialized_variables_1/boolean_mask/Gather:0"
ready_op


concat:0"�+
	variables�+�+
7
global_step:0global_step/Assignglobal_step/read:0
�
linear/height/weight/part_0:0"linear/height/weight/part_0/Assign"linear/height/weight/part_0/read:0""
linear/height/weight  "
�
!linear/horsepower/weight/part_0:0&linear/horsepower/weight/part_0/Assign&linear/horsepower/weight/part_0/read:0"&
linear/horsepower/weight  "
�
linear/length/weight/part_0:0"linear/length/weight/part_0/Assign"linear/length/weight/part_0/read:0""
linear/length/weight  "
�
linear/width/weight/part_0:0!linear/width/weight/part_0/Assign!linear/width/weight/part_0/read:0"!
linear/width/weight  "
�
linear/make/weights/part_0:0!linear/make/weights/part_0/Assign!linear/make/weights/part_0/read:0"!
linear/make/weights2  "2
�
(linear/num-of-cylinders/weights/part_0:0-linear/num-of-cylinders/weights/part_0/Assign-linear/num-of-cylinders/weights/part_0/read:0"-
linear/num-of-cylinders/weights  "
�
$linear/num-of-doors/weights/part_0:0)linear/num-of-doors/weights/part_0/Assign)linear/num-of-doors/weights/part_0/read:0")
linear/num-of-doors/weights  "
�
linear/bias_weight/part_0:0 linear/bias_weight/part_0/Assign linear/bias_weight/part_0/read:0"
linear/bias_weight "
�
9linear/regression_head/linear/height/weight/part_0/Ftrl:0>linear/regression_head/linear/height/weight/part_0/Ftrl/Assign>linear/regression_head/linear/height/weight/part_0/Ftrl/read:0">
0linear/height/weight/r/height/weight/part_0/Ftrl  "
�
;linear/regression_head/linear/height/weight/part_0/Ftrl_1:0@linear/regression_head/linear/height/weight/part_0/Ftrl_1/Assign@linear/regression_head/linear/height/weight/part_0/Ftrl_1/read:0"@
2linear/height/weight/r/height/weight/part_0/Ftrl_1  "
�
=linear/regression_head/linear/horsepower/weight/part_0/Ftrl:0Blinear/regression_head/linear/horsepower/weight/part_0/Ftrl/AssignBlinear/regression_head/linear/horsepower/weight/part_0/Ftrl/read:0"B
4linear/horsepower/weight/rsepower/weight/part_0/Ftrl  "
�
?linear/regression_head/linear/horsepower/weight/part_0/Ftrl_1:0Dlinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/AssignDlinear/regression_head/linear/horsepower/weight/part_0/Ftrl_1/read:0"D
6linear/horsepower/weight/rsepower/weight/part_0/Ftrl_1  "
�
9linear/regression_head/linear/length/weight/part_0/Ftrl:0>linear/regression_head/linear/length/weight/part_0/Ftrl/Assign>linear/regression_head/linear/length/weight/part_0/Ftrl/read:0">
0linear/length/weight/r/length/weight/part_0/Ftrl  "
�
;linear/regression_head/linear/length/weight/part_0/Ftrl_1:0@linear/regression_head/linear/length/weight/part_0/Ftrl_1/Assign@linear/regression_head/linear/length/weight/part_0/Ftrl_1/read:0"@
2linear/length/weight/r/length/weight/part_0/Ftrl_1  "
�
8linear/regression_head/linear/width/weight/part_0/Ftrl:0=linear/regression_head/linear/width/weight/part_0/Ftrl/Assign=linear/regression_head/linear/width/weight/part_0/Ftrl/read:0"=
/linear/width/weight/ar/width/weight/part_0/Ftrl  "
�
:linear/regression_head/linear/width/weight/part_0/Ftrl_1:0?linear/regression_head/linear/width/weight/part_0/Ftrl_1/Assign?linear/regression_head/linear/width/weight/part_0/Ftrl_1/read:0"?
1linear/width/weight/ar/width/weight/part_0/Ftrl_1  "
�
8linear/regression_head/linear/make/weights/part_0/Ftrl:0=linear/regression_head/linear/make/weights/part_0/Ftrl/Assign=linear/regression_head/linear/make/weights/part_0/Ftrl/read:0"=
/linear/make/weights/ar/make/weights/part_0/Ftrl2  "2
�
:linear/regression_head/linear/make/weights/part_0/Ftrl_1:0?linear/regression_head/linear/make/weights/part_0/Ftrl_1/Assign?linear/regression_head/linear/make/weights/part_0/Ftrl_1/read:0"?
1linear/make/weights/ar/make/weights/part_0/Ftrl_12  "2
�
Dlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl:0Ilinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl/AssignIlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl/read:0"I
;linear/num-of-cylinders/weights/linders/weights/part_0/Ftrl  "
�
Flinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1:0Klinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/AssignKlinear/regression_head/linear/num-of-cylinders/weights/part_0/Ftrl_1/read:0"K
=linear/num-of-cylinders/weights/linders/weights/part_0/Ftrl_1  "
�
@linear/regression_head/linear/num-of-doors/weights/part_0/Ftrl:0Elinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl/AssignElinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl/read:0"E
7linear/num-of-doors/weights/f-doors/weights/part_0/Ftrl  "
�
Blinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1:0Glinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/AssignGlinear/regression_head/linear/num-of-doors/weights/part_0/Ftrl_1/read:0"G
9linear/num-of-doors/weights/f-doors/weights/part_0/Ftrl_1  "
�
7linear/regression_head/linear/bias_weight/part_0/Ftrl:0<linear/regression_head/linear/bias_weight/part_0/Ftrl/Assign<linear/regression_head/linear/bias_weight/part_0/Ftrl/read:0"9
.linear/bias_weight/ear/bias_weight/part_0/Ftrl "
�
9linear/regression_head/linear/bias_weight/part_0/Ftrl_1:0>linear/regression_head/linear/bias_weight/part_0/Ftrl_1/Assign>linear/regression_head/linear/bias_weight/part_0/Ftrl_1/read:0";
0linear/bias_weight/ear/bias_weight/part_0/Ftrl_1 ""�
	summaries�

Uenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full:0
&linear/regression_head/ScalarSummary:0"4
train_op(
&
$linear/regression_head/train_op/Ftrl"
init_op


group_deps����9       �7�	�v��P�A�N:+'tensorboard/linear_regressor/model.ckptN�G�       ���	!x��P�A�N:	r��w       洦�	�y��P�A�N*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?

loss��aM�e��&       sO� 	m���P�A�N*

global_step/secC��C�##�w       洦�	:���P�A�N*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�%�=

loss5s|M5B�(&       sO� 	g1��P�A�O*

global_step/secvD��ىw       洦�	�`��P�A�O*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�%�=

lossh�#MRsG&       sO� 	௮�P�A�P*

global_step/sec�^<D�cz�w       洦�	J׮�P�A�P*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fulle�6>

loss>�YM+���&       sO� 	KE��P�A�Q*

global_step/secf�RDዮ�w       洦�	,l��P�A�Q*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�?

lossm�XM�N19&       sO� 	�X��P�A�R*

global_step/sec{FD0�~w       洦�	����P�A�R*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss��oM����&       sO� 	_k��P�A�R*

global_step/sec�6FD]� �w       洦�	S���P�A�R*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

lossd��M�bp&       sO� 	4q��P�A�S*

global_step/sec�kGDL�w       洦�	���P�A�S*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

lossVpM@�ǜ&       sO� 	�,��P�A�T*

global_step/sec��ND�=�uw       洦�	�F��P�A�T*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss�DZM���D&       sO� 	����P�A�U*

global_step/seclUDK��w       洦�	����P�A�U*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full �?

loss�wM��1(&       sO� 	�W��P�A�U*

global_step/sec��PD�rw       洦�	}���P�A�U*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?

loss�ȏM���&&       sO� 	BH��P�A�V*

global_step/sec��ID�ڽ=w       洦�	1q��P�A�V*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss(iMm[d&       sO� 	K���P�A�W*

global_step/sec�|?D����w       洦�	3���P�A�W*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

lossQ�M����&       sO� 	 ��P�A�X*

global_step/sec(�UD�5Kw       洦�	.:��P�A�X*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss���Ml��&       sO� 	��P�A�Y*

global_step/sec("ND��O/w       洦�	���P�A�Y*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss�AfM��%�&       sO� 	�E�P�A�Y*

global_step/secϣXD#t��w       洦�	6a�P�A�Y*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss��}M��k�&       sO� 	�N�P�A�Z*

global_step/sec�hcD�
8�w       洦�	�i�P�A�Z*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss��9Mb�Y&       sO� 	���P�A�[*

global_step/sec�^D\���w       洦�	\��P�A�[*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

lossj�iM��B�&       sO� 	U�!�P�A�\*

global_step/sec�\D�� �w       洦�	X�!�P�A�\*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full �?

loss^�qM��&       sO� 	�o)�P�A�\*

global_step/sect
QD��w       洦�	�)�P�A�\*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss�t;M�m7L&       sO� 	��0�P�A�]*

global_step/sec�TD�!��w       洦�	31�P�A�]*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss�3FM����&       sO� 	�8�P�A�^*

global_step/sec�AOD���w       洦�	>�8�P�A�^*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?

loss��QMO].&       sO� 	�&@�P�A�_*

global_step/secS>VD��$�w       洦�	�D@�P�A�_*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss
.3MXc�.&       sO� 	ܥG�P�A�`*

global_step/sec�qUDܒ�5w       洦�	��G�P�A�`*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?

loss��;M��&M&       sO� 	�>O�P�A�`*

global_step/sec|�RDo���w       洦�	�WO�P�A�`*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

lossO%�M)�-�&       sO� 	��V�P�A�a*

global_step/secZuUD��1Zw       洦�	H�V�P�A�a*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss��BMy4&       sO� 	�u_�P�A�b*

global_step/sec+�7DQ���w       洦�	�_�P�A�b*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss��tMM5�&       sO� 	g�P�A�c*

global_step/sec�jSD�
��w       洦�	�!g�P�A�c*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

lossL!wM��2&       sO� 	�n�P�A�d*

global_step/secq�LD2�Mw       洦�	�o�P�A�d*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss�xM,�j&       sO� 	 x�P�A�d*

global_step/sec,-D0�^w       洦�	�Ox�P�A�d*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full �?

loss��JM��S&       sO� 	Ԁ�P�A�e*

global_step/sec+7D�8�w       洦�	����P�A�e*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

lossNqM��6B&       sO� 	���P�A�f*

global_step/sec��\DX���w       洦�	�,��P�A�f*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss���M���&       sO� 	D+��P�A�g*

global_step/secXaD$#nWw       洦�	�R��P�A�g*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss/�M���&       sO� 	���P�A�g*

global_step/sec4Dw       洦�	�(��P�A�g*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

lossj�EM�aZ�&       sO� 	�=��P�A�h*

global_step/sec�&.D�h6+w       洦�	�K��P�A�h*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?

loss:�5M���\&       sO� 	�ި�P�A�i*

global_step/sec6�QD(��w       洦�	7���P�A�i*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

lossC�sMr;{Y&       sO� 	�]��P�A�j*

global_step/sec�WUDv���w       洦�	�w��P�A�j*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss[(M6���&       sO� 	`��P�A�k*

global_step/secANdD��w       洦�	.���P�A�k*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

lossp@CM��&       sO� 	�k��P�A�k*

global_step/sec��FD�Pw       洦�	1���P�A�k*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

lossC#�Mn�%�&       sO� 	����P�A�l*

global_step/sec��Dl���w       洦�	n���P�A�l*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss�(8M�@&       sO� 	|��P�A�m*

global_step/sec��LDQ���w       洦�	����P�A�m*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?

loss�YM���&       sO� 	7=��P�A�n*

global_step/sec�UND�f�Iw       洦�	�p��P�A�n*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full��0?

loss��cM��X�&       sO� 	�C��P�A�n*

global_step/sec,\GD�޾	w       洦�	b��P�A�n*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss�uM����&       sO� 	e���P�A�o*

global_step/sec&>D-|<Zw       洦�	,���P�A�o*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss��4M-q�&       sO� 	����P�A�p*

global_step/secQ�2D`�w       洦�	K���P�A�p*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full��0?

losswFtM��Kl&       sO� 	#��P�A�q*

global_step/secǺ>D�<� w       洦�	�+��P�A�q*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss��EM'�"&       sO� 	r��P�A�r*

global_step/sec�rKD��	�w       洦�	
�P�A�r*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�۲>

lossyz7M�A�&       sO� 	
�
�P�A�r*

global_step/sec��QDa���w       洦�	�
�P�A�r*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full+�>

loss�CM:�t&       sO� 	��P�A�s*

global_step/sec��SD�ʨ�w       洦�	�5�P�A�s*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�?

loss��Mu(�+&       sO� 	���P�A�t*

global_step/sec#5D�  w       洦�	��P�A�t*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?

loss#<^M�SY&       sO� 	��"�P�A�u*

global_step/sec�wND��w       洦�	<�"�P�A�u*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�۲>

loss$VqM,��1&       sO� 	Չ*�P�A�u*

global_step/secu�JDƬ�5w       洦�	��*�P�A�u*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full��0?

loss4OHM8�2{&       sO� 	 �1�P�A�v*

global_step/seca�VD��?w       洦�	>2�P�A�v*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss�>M_�#&       sO� 	Y�9�P�A�w*

global_step/secx�QD{Zw       洦�	��9�P�A�w*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss��MX�4&       sO� 	]�A�P�A�x*

global_step/seceED-�)�w       洦�	��A�P�A�x*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?

losss�0M@�:&       sO� 	dJ�P�A�y*

global_step/sec�>D�w       洦�	�CJ�P�A�y*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�?

loss�یM�W>�&       sO� 	HS�P�A�y*

global_step/sec�o2D��{w       洦�	�dS�P�A�y*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full���>

loss�jM�v��&       sO� 	��]�P�A�z*

global_step/sec�FD�!cw       洦�	� ^�P�A�z*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�۲>

lossL�lM0]?&       sO� 	�ah�P�A�{*

global_step/sec�D> �w       洦�	s�h�P�A�{*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full���>

loss���M����&       sO� 	vq�P�A�|*

global_step/secR30D|�7�w       洦�	 �q�P�A�|*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss�]AM�eff&       sO� 	�z�P�A�}*

global_step/sec��/D6Nw       洦�	��z�P�A�}*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss�M˿z�&       sO� 	�Ƅ�P�A�}*

global_step/sec�DI�@"w       洦�	���P�A�}*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss2J�M��(�&       sO� 	���P�A�~*

global_step/sec-D�/[.w       洦�	�9��P�A�~*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss��!M;U^Z&       sO� 	����P�A�*

global_step/sec��2Dژ�Sw       洦�	v$��P�A�*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�۲>

loss��&MWOH�'       ��F	����P�A��*

global_step/sec�19DIZx       ��!�	eȟ�P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full���>

loss�a�M?��'       ��F	����P�A��*

global_step/sec��3D��zx       ��!�	i���P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss��EM�#��'       ��F	����P�Aف*

global_step/sec,�D<�6<x       ��!�	�Ʋ�P�Aف*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�?

loss�^M/�F�'       ��F	�>��P�A��*

global_step/sec>�7D�LFx       ��!�	�j��P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss0�3M�v�'       ��F	
>��P�A��*

global_step/sec�1Df��rx       ��!�	�m��P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss#\~M�ݫ'       ��F	ك��P�A��*

global_step/sec��D>/T�x       ��!�	����P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?

losspWeM�;t�'       ��F	� ��P�A�*

global_step/sec<�	D�_C�x       ��!�	JX��P�A�*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full���>

loss�#MF�'       ��F	����P�Aͅ*

global_step/sec^&DDDqx       ��!�	M���P�Aͅ*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?

lossx1hM	���'       ��F	�a��P�A��*

global_step/sec�79D����x       ��!�	��P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss ܱM�c��'       ��F	: ��P�A��*

global_step/sec5 RD�nx       ��!�	���P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss8(M���'       ��F	D7��P�A��*

global_step/sec|�]D��,x       ��!�	Q��P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss�3BME39'       ��F	ho�P�A݈*

global_step/sec�]D�x�x       ��!�	���P�A݈*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

lossI�AMg�'       ��F	��	�P�A��*

global_step/sec9lTD��*x       ��!�	s
�P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss��HMXOd�'       ��F	���P�A��*

global_step/sec'�4D`�!x       ��!�	Q��P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss�JM��='       ��F	�7�P�A��*

global_step/sec�L>D.�o�x       ��!�	�`�P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�?

loss�?�M��&Q'       ��F	 +#�P�A�*

global_step/secSID�m��x       ��!�	�S#�P�A�*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss��M�R��'       ��F	�h+�P�Aь*

global_step/sec�BD��x       ��!�	 �+�P�Aь*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

lossҸ+Ms}>'       ��F	164�P�A��*

global_step/sec��5D�dFEx       ��!�	<P4�P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss�6yM�X�6'       ��F	v�;�P�A��*

global_step/sec�FYD��Gx       ��!�	-�;�P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss��M23�'       ��F	�JD�P�A��*

global_step/secq�7Dgޖ�x       ��!�	v�D�P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�%�=

loss1�}M4@�q'       ��F	��P�P�A�*

global_step/sec�
DPe��x       ��!�	��P�P�A�*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�%�=

loss]�zM�tW<'       ��F	>)\�P�AŐ*

global_step/sec>	D{�8x       ��!�	�j\�P�AŐ*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�۲>

loss$g7M�'       ��F	p)e�P�A��*

global_step/sec��1D2�ax       ��!�	�Xe�P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?

lossަ,M1���'       ��F	
p�P�A��*

global_step/sec�D�"�wx       ��!�	�Dp�P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss�hVM�h�'       ��F	1Dy�P�A�*

global_step/secz�.D���x       ��!�	Rdy�P�A�*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss��M[�\'       ��F	ׁ�P�AՓ*

global_step/sec��:Dr�Ex       ��!�	��P�AՓ*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?

loss2�SM��|'       ��F	y?��P�A��*

global_step/sec{K>D�iZ8x       ��!�	]��P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

lossPk�MH"��'       ��F	�V��P�A��*

global_step/secd�ED�	x       ��!�	�u��P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss�VOMrA�'       ��F	���P�A��*

global_step/sec�h7D�M�x       ��!�	w.��P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss��	M�<A'       ��F	�1��P�A�*

global_step/secO�DD���x       ��!�	uQ��P�A�*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss�8�M)��'       ��F	���P�Aɗ*

global_step/sec9*D���x       ��!�	����P�Aɗ*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss��M��t�'       ��F	����P�A��*

global_step/sec��D)��	x       ��!�	���P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

lossD�HM��b+'       ��F	�=��P�A��*

global_step/sec׆,D&C��x       ��!�	~N��P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?

lossت�MQ[�'       ��F	GW��P�A��*

global_step/seci�/D��zx       ��!�	����P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?

lossl�fMq��'       ��F	����P�Aٚ*

global_step/sec��<Dqnax       ��!�	����P�Aٚ*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss�ZqM�8+'       ��F	hN��P�A��*

global_step/sec+A<D�	Cx       ��!�	�p��P�A��*i
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?

loss�hM �#P:       ���	���P�A��:+'tensorboard/linear_regressor/model.ckptU_��