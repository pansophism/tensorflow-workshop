       �K"	   �P�Abrain.Event:2TZڊ�     �.�	=�P�A"��
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
�
Vdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Rdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:4Vdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/CastCast`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Shape*

SrcT0*
_output_shapes
:*

DstT0	
�
cdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
cdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/NotEqualNotEqualRdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dimscdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Cast_1/x*
T0*
_output_shapes

:@
�
`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/WhereWherecdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/NotEqual*'
_output_shapes
:���������
�
hdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
bdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/ReshapeReshapeRdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dimshdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
ndnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
hdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_sliceStridedSlice`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Wherendnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stackpdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stack_1pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stack_2*
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
pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
rdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
rdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1StridedSlice`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Wherepdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stackrdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stack_1rdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
bdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/unstackUnpack_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/stackPackddnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/MulMuljdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/stack*
T0	*'
_output_shapes
:���������
�
pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/SumSum^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Mulpdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/AddAddhdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Sum*
T0	*#
_output_shapes
:���������
�
adnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/GatherGatherbdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Reshape^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
�
Mdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/lookupStringToHashBucketFastadnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Gather*
num_buckets2*#
_output_shapes
:���������
�
gdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
idnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
idnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
adnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_sliceStridedSlice_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Castgdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stackidnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stack_1idnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*
_output_shapes
:*

begin_mask*
Index0
�
idnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
kdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
kdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
cdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1StridedSlice_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Castidnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stackkdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stack_1kdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*
_output_shapes
:*

begin_mask *
Index0
�
Ydnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
Xdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/ProdProdcdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1Ydnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
�
cdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat/values_1PackXdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/Prod*
T0	*
_output_shapes
:*
N*

axis 
�
_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Zdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concatConcatV2adnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slicecdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat/values_1_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat/axis*

Tidx0*
T0	*
_output_shapes
:*
N
�
adnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshapeSparseReshape`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Where_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/CastZdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat*-
_output_shapes
:���������:
�
jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshape/IdentityIdentityMdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/lookup*
T0	*#
_output_shapes
:���������
�
bdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SparseToDense/default_valueConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
Tdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SparseToDenseSparseToDenseadnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshapecdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshape:1jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshape/Identitybdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SparseToDense/default_value*
T0	*0
_output_shapes
:������������������*
validate_indices(*
Tindices0	
�
Tdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
Vdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/Const_1Const*
dtype0*
_output_shapes
: *
valueB
 *    
�
Tdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/depthConst*
dtype0*
_output_shapes
: *
value	B :2
�
Wdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/on_valueConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
Xdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/off_valueConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
Ndnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hotOneHotTdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SparseToDenseTdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/depthWdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/on_valueXdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/off_value*
axis���������*
TI0	*4
_output_shapes"
 :������������������2*
T0
�
\dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
Jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SumSumNdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot\dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/Sum/reduction_indices*

Tidx0*
T0*'
_output_shapes
:���������2*
	keep_dims( 
�
^dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:1^dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
hdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
gdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/CastCasthdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Shape*

SrcT0*
_output_shapes
:*

DstT0	
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/NotEqualNotEqualZdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dimskdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Cast_1/x*
T0*
_output_shapes

:@
�
hdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/WhereWherekdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/NotEqual*'
_output_shapes
:���������
�
pdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
jdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/ReshapeReshapeZdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dimspdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
vdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
pdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_sliceStridedSlicehdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Wherevdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stackxdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stack_1xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stack_2*
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
xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
rdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1StridedSlicehdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Wherexdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stackzdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stack_1zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
jdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/unstackUnpackgdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
hdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/stackPackldnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
fdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/MulMulrdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1hdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/stack*
T0	*'
_output_shapes
:���������
�
xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
fdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/SumSumfdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Mulxdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
fdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/AddAddpdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slicefdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Sum*
T0	*#
_output_shapes
:���������
�
idnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/GatherGatherjdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Reshapefdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
�
[dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/ConstConst*
dtype0*
_output_shapes
:*
valueBBtwoBfour
�
Zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/SizeConst*
dtype0*
_output_shapes
: *
value	B :
�
adnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
adnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
[dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/rangeRangeadnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range/startZdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/Sizeadnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range/delta*

Tidx0*
_output_shapes
:
�
]dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/ToInt64Cast[dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range*

SrcT0*
_output_shapes
:*

DstT0	
�
`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table	HashTable*
	container *
	key_dtype0*
use_node_name_sharing( *
_output_shapes
:*
value_dtype0	*
shared_name 
�
fdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table/ConstConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table/table_initInitializeTable`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table[dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/Const]dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/ToInt64*

Tval0	*

Tkey0*s
_classi
geloc:@dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table
�
`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/hash_table_LookupLookupTableFind`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_tableidnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Gatherfdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table/Const*#
_output_shapes
:���������*

Tout0	*	
Tin0*s
_classi
geloc:@dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table
�
odnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
qdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
qdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
idnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_sliceStridedSlicegdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Castodnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stackqdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stack_1qdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*
_output_shapes
:*

begin_mask*
Index0
�
qdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
sdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
sdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1StridedSlicegdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Castqdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stacksdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stack_1sdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*
_output_shapes
:*

begin_mask *
Index0
�
adnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/ProdProdkdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1adnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat/values_1Pack`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/Prod*
T0	*
_output_shapes
:*
N*

axis 
�
gdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
bdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concatConcatV2idnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slicekdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat/values_1gdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat/axis*

Tidx0*
T0	*
_output_shapes
:*
N
�
idnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshapeSparseReshapehdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Wheregdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Castbdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat*-
_output_shapes
:���������:
�
rdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshape/IdentityIdentity`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/hash_table_Lookup*
T0	*#
_output_shapes
:���������
�
jdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SparseToDense/default_valueConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SparseToDenseSparseToDenseidnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshapekdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshape:1rdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshape/Identityjdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SparseToDense/default_value*
T0	*0
_output_shapes
:������������������*
validate_indices(*
Tindices0	
�
\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
^dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/Const_1Const*
dtype0*
_output_shapes
: *
valueB
 *    
�
\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/depthConst*
dtype0*
_output_shapes
: *
value	B :
�
_dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/on_valueConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/off_valueConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
Vdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hotOneHot\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SparseToDense\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/depth_dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/on_value`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/off_value*
axis���������*
TI0	*4
_output_shapes"
 :������������������*
T0
�
ddnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
Rdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SumSumVdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hotddnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/Sum/reduction_indices*

Tidx0*
T0*'
_output_shapes
:���������*
	keep_dims( 
�
Pdnn/input_from_feature_columns/input_from_feature_columns/height/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Ldnn/input_from_feature_columns/input_from_feature_columns/height/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:6Pdnn/input_from_feature_columns/input_from_feature_columns/height/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
Tdnn/input_from_feature_columns/input_from_feature_columns/horsepower/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Pdnn/input_from_feature_columns/input_from_feature_columns/horsepower/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:3Tdnn/input_from_feature_columns/input_from_feature_columns/horsepower/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
Pdnn/input_from_feature_columns/input_from_feature_columns/length/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Ldnn/input_from_feature_columns/input_from_feature_columns/length/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:5Pdnn/input_from_feature_columns/input_from_feature_columns/length/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
Odnn/input_from_feature_columns/input_from_feature_columns/width/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Kdnn/input_from_feature_columns/input_from_feature_columns/width/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:7Odnn/input_from_feature_columns/input_from_feature_columns/width/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
Ednn/input_from_feature_columns/input_from_feature_columns/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
�
@dnn/input_from_feature_columns/input_from_feature_columns/concatConcatV2Jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SumRdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SumLdnn/input_from_feature_columns/input_from_feature_columns/height/expand_dimsPdnn/input_from_feature_columns/input_from_feature_columns/horsepower/expand_dimsLdnn/input_from_feature_columns/input_from_feature_columns/length/expand_dimsKdnn/input_from_feature_columns/input_from_feature_columns/width/expand_dimsEdnn/input_from_feature_columns/input_from_feature_columns/concat/axis*

Tidx0*
T0*
_output_shapes

:@8*
N
�
Adnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"8   2   *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *�s�*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *�s>*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
Idnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/shape*
seed2 *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
dtype0*
T0*
_output_shapes

:82*

seed 
�
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/sub*
T0*
_output_shapes

:82*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
;dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes

:82*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
 dnn/hiddenlayer_0/weights/part_0
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
dtype0*
_output_shapes

:82*
shape
:82*
shared_name 
�
'dnn/hiddenlayer_0/weights/part_0/AssignAssign dnn/hiddenlayer_0/weights/part_0;dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform*
T0*
_output_shapes

:82*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
%dnn/hiddenlayer_0/weights/part_0/readIdentity dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes

:82*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
1dnn/hiddenlayer_0/biases/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:2*
valueB2*    *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
dnn/hiddenlayer_0/biases/part_0
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
dtype0*
_output_shapes
:2*
shape:2*
shared_name 
�
&dnn/hiddenlayer_0/biases/part_0/AssignAssigndnn/hiddenlayer_0/biases/part_01dnn/hiddenlayer_0/biases/part_0/Initializer/zeros*
T0*
_output_shapes
:2*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
$dnn/hiddenlayer_0/biases/part_0/readIdentitydnn/hiddenlayer_0/biases/part_0*
T0*
_output_shapes
:2*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
u
dnn/hiddenlayer_0/weightsIdentity%dnn/hiddenlayer_0/weights/part_0/read*
T0*
_output_shapes

:82
�
dnn/hiddenlayer_0/MatMulMatMul@dnn/input_from_feature_columns/input_from_feature_columns/concatdnn/hiddenlayer_0/weights*
T0*
_output_shapes

:@2*
transpose_a( *
transpose_b( 
o
dnn/hiddenlayer_0/biasesIdentity$dnn/hiddenlayer_0/biases/part_0/read*
T0*
_output_shapes
:2
�
dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/biases*
T0*
_output_shapes

:@2*
data_formatNHWC
p
$dnn/hiddenlayer_0/hiddenlayer_0/ReluReludnn/hiddenlayer_0/BiasAdd*
T0*
_output_shapes

:@2
[
dnn/zero_fraction/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
dnn/zero_fraction/EqualEqual$dnn/hiddenlayer_0/hiddenlayer_0/Reludnn/zero_fraction/zero*
T0*
_output_shapes

:@2
o
dnn/zero_fraction/CastCastdnn/zero_fraction/Equal*

SrcT0
*
_output_shapes

:@2*

DstT0
h
dnn/zero_fraction/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
dnn/zero_fraction/MeanMeandnn/zero_fraction/Castdnn/zero_fraction/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
2dnn/dnn/hiddenlayer_0_fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *>
value5B3 B-dnn/dnn/hiddenlayer_0_fraction_of_zero_values
�
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0_fraction_of_zero_values/tagsdnn/zero_fraction/Mean*
T0*
_output_shapes
: 
�
$dnn/dnn/hiddenlayer_0_activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_0_activation
�
 dnn/dnn/hiddenlayer_0_activationHistogramSummary$dnn/dnn/hiddenlayer_0_activation/tag$dnn/hiddenlayer_0/hiddenlayer_0/Relu*
T0*
_output_shapes
: 
�
Adnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"2      *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *�7��*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *�7�>*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
Idnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/shape*
seed2 *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
dtype0*
T0*
_output_shapes

:2*

seed 
�
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/sub*
T0*
_output_shapes

:2*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
;dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes

:2*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
 dnn/hiddenlayer_1/weights/part_0
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
'dnn/hiddenlayer_1/weights/part_0/AssignAssign dnn/hiddenlayer_1/weights/part_0;dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
%dnn/hiddenlayer_1/weights/part_0/readIdentity dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes

:2*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
1dnn/hiddenlayer_1/biases/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
dnn/hiddenlayer_1/biases/part_0
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
&dnn/hiddenlayer_1/biases/part_0/AssignAssigndnn/hiddenlayer_1/biases/part_01dnn/hiddenlayer_1/biases/part_0/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
$dnn/hiddenlayer_1/biases/part_0/readIdentitydnn/hiddenlayer_1/biases/part_0*
T0*
_output_shapes
:*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
u
dnn/hiddenlayer_1/weightsIdentity%dnn/hiddenlayer_1/weights/part_0/read*
T0*
_output_shapes

:2
�
dnn/hiddenlayer_1/MatMulMatMul$dnn/hiddenlayer_0/hiddenlayer_0/Reludnn/hiddenlayer_1/weights*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
o
dnn/hiddenlayer_1/biasesIdentity$dnn/hiddenlayer_1/biases/part_0/read*
T0*
_output_shapes
:
�
dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMuldnn/hiddenlayer_1/biases*
T0*
_output_shapes

:@*
data_formatNHWC
p
$dnn/hiddenlayer_1/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*
T0*
_output_shapes

:@
]
dnn/zero_fraction_1/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
dnn/zero_fraction_1/EqualEqual$dnn/hiddenlayer_1/hiddenlayer_1/Reludnn/zero_fraction_1/zero*
T0*
_output_shapes

:@
s
dnn/zero_fraction_1/CastCastdnn/zero_fraction_1/Equal*

SrcT0
*
_output_shapes

:@*

DstT0
j
dnn/zero_fraction_1/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
dnn/zero_fraction_1/MeanMeandnn/zero_fraction_1/Castdnn/zero_fraction_1/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
2dnn/dnn/hiddenlayer_1_fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *>
value5B3 B-dnn/dnn/hiddenlayer_1_fraction_of_zero_values
�
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_1_fraction_of_zero_values/tagsdnn/zero_fraction_1/Mean*
T0*
_output_shapes
: 
�
$dnn/dnn/hiddenlayer_1_activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_1_activation
�
 dnn/dnn/hiddenlayer_1_activationHistogramSummary$dnn/dnn/hiddenlayer_1_activation/tag$dnn/hiddenlayer_1/hiddenlayer_1/Relu*
T0*
_output_shapes
: 
�
Adnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"   
   *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *�Kƾ*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *�K�>*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
Idnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/shape*
seed2 *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
dtype0*
T0*
_output_shapes

:
*

seed 
�
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/sub*
T0*
_output_shapes

:
*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
;dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes

:
*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
 dnn/hiddenlayer_2/weights/part_0
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
dtype0*
_output_shapes

:
*
shape
:
*
shared_name 
�
'dnn/hiddenlayer_2/weights/part_0/AssignAssign dnn/hiddenlayer_2/weights/part_0;dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
%dnn/hiddenlayer_2/weights/part_0/readIdentity dnn/hiddenlayer_2/weights/part_0*
T0*
_output_shapes

:
*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
1dnn/hiddenlayer_2/biases/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:
*
valueB
*    *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
dnn/hiddenlayer_2/biases/part_0
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
dtype0*
_output_shapes
:
*
shape:
*
shared_name 
�
&dnn/hiddenlayer_2/biases/part_0/AssignAssigndnn/hiddenlayer_2/biases/part_01dnn/hiddenlayer_2/biases/part_0/Initializer/zeros*
T0*
_output_shapes
:
*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
$dnn/hiddenlayer_2/biases/part_0/readIdentitydnn/hiddenlayer_2/biases/part_0*
T0*
_output_shapes
:
*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
u
dnn/hiddenlayer_2/weightsIdentity%dnn/hiddenlayer_2/weights/part_0/read*
T0*
_output_shapes

:

�
dnn/hiddenlayer_2/MatMulMatMul$dnn/hiddenlayer_1/hiddenlayer_1/Reludnn/hiddenlayer_2/weights*
T0*
_output_shapes

:@
*
transpose_a( *
transpose_b( 
o
dnn/hiddenlayer_2/biasesIdentity$dnn/hiddenlayer_2/biases/part_0/read*
T0*
_output_shapes
:

�
dnn/hiddenlayer_2/BiasAddBiasAdddnn/hiddenlayer_2/MatMuldnn/hiddenlayer_2/biases*
T0*
_output_shapes

:@
*
data_formatNHWC
p
$dnn/hiddenlayer_2/hiddenlayer_2/ReluReludnn/hiddenlayer_2/BiasAdd*
T0*
_output_shapes

:@

]
dnn/zero_fraction_2/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
dnn/zero_fraction_2/EqualEqual$dnn/hiddenlayer_2/hiddenlayer_2/Reludnn/zero_fraction_2/zero*
T0*
_output_shapes

:@

s
dnn/zero_fraction_2/CastCastdnn/zero_fraction_2/Equal*

SrcT0
*
_output_shapes

:@
*

DstT0
j
dnn/zero_fraction_2/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
dnn/zero_fraction_2/MeanMeandnn/zero_fraction_2/Castdnn/zero_fraction_2/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
2dnn/dnn/hiddenlayer_2_fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *>
value5B3 B-dnn/dnn/hiddenlayer_2_fraction_of_zero_values
�
-dnn/dnn/hiddenlayer_2_fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_2_fraction_of_zero_values/tagsdnn/zero_fraction_2/Mean*
T0*
_output_shapes
: 
�
$dnn/dnn/hiddenlayer_2_activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_2_activation
�
 dnn/dnn/hiddenlayer_2_activationHistogramSummary$dnn/dnn/hiddenlayer_2_activation/tag$dnn/hiddenlayer_2/hiddenlayer_2/Relu*
T0*
_output_shapes
: 
�
:dnn/logits/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"
      *,
_class"
 loc:@dnn/logits/weights/part_0
�
8dnn/logits/weights/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *�=�*,
_class"
 loc:@dnn/logits/weights/part_0
�
8dnn/logits/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *�=?*,
_class"
 loc:@dnn/logits/weights/part_0
�
Bdnn/logits/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniform:dnn/logits/weights/part_0/Initializer/random_uniform/shape*
seed2 *,
_class"
 loc:@dnn/logits/weights/part_0*
dtype0*
T0*
_output_shapes

:
*

seed 
�
8dnn/logits/weights/part_0/Initializer/random_uniform/subSub8dnn/logits/weights/part_0/Initializer/random_uniform/max8dnn/logits/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes
: *,
_class"
 loc:@dnn/logits/weights/part_0
�
8dnn/logits/weights/part_0/Initializer/random_uniform/mulMulBdnn/logits/weights/part_0/Initializer/random_uniform/RandomUniform8dnn/logits/weights/part_0/Initializer/random_uniform/sub*
T0*
_output_shapes

:
*,
_class"
 loc:@dnn/logits/weights/part_0
�
4dnn/logits/weights/part_0/Initializer/random_uniformAdd8dnn/logits/weights/part_0/Initializer/random_uniform/mul8dnn/logits/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes

:
*,
_class"
 loc:@dnn/logits/weights/part_0
�
dnn/logits/weights/part_0
VariableV2*
	container *,
_class"
 loc:@dnn/logits/weights/part_0*
dtype0*
_output_shapes

:
*
shape
:
*
shared_name 
�
 dnn/logits/weights/part_0/AssignAssigndnn/logits/weights/part_04dnn/logits/weights/part_0/Initializer/random_uniform*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*,
_class"
 loc:@dnn/logits/weights/part_0
�
dnn/logits/weights/part_0/readIdentitydnn/logits/weights/part_0*
T0*
_output_shapes

:
*,
_class"
 loc:@dnn/logits/weights/part_0
�
*dnn/logits/biases/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *+
_class!
loc:@dnn/logits/biases/part_0
�
dnn/logits/biases/part_0
VariableV2*
	container *+
_class!
loc:@dnn/logits/biases/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
dnn/logits/biases/part_0/AssignAssigndnn/logits/biases/part_0*dnn/logits/biases/part_0/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*+
_class!
loc:@dnn/logits/biases/part_0
�
dnn/logits/biases/part_0/readIdentitydnn/logits/biases/part_0*
T0*
_output_shapes
:*+
_class!
loc:@dnn/logits/biases/part_0
g
dnn/logits/weightsIdentitydnn/logits/weights/part_0/read*
T0*
_output_shapes

:

�
dnn/logits/MatMulMatMul$dnn/hiddenlayer_2/hiddenlayer_2/Reludnn/logits/weights*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
a
dnn/logits/biasesIdentitydnn/logits/biases/part_0/read*
T0*
_output_shapes
:
�
dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/biases*
T0*
_output_shapes

:@*
data_formatNHWC
]
dnn/zero_fraction_3/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
y
dnn/zero_fraction_3/EqualEqualdnn/logits/BiasAdddnn/zero_fraction_3/zero*
T0*
_output_shapes

:@
s
dnn/zero_fraction_3/CastCastdnn/zero_fraction_3/Equal*

SrcT0
*
_output_shapes

:@*

DstT0
j
dnn/zero_fraction_3/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
dnn/zero_fraction_3/MeanMeandnn/zero_fraction_3/Castdnn/zero_fraction_3/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
+dnn/dnn/logits_fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *7
value.B, B&dnn/dnn/logits_fraction_of_zero_values
�
&dnn/dnn/logits_fraction_of_zero_valuesScalarSummary+dnn/dnn/logits_fraction_of_zero_values/tagsdnn/zero_fraction_3/Mean*
T0*
_output_shapes
: 
w
dnn/dnn/logits_activation/tagConst*
dtype0*
_output_shapes
: **
value!B Bdnn/dnn/logits_activation
�
dnn/dnn/logits_activationHistogramSummarydnn/dnn/logits_activation/tagdnn/logits/BiasAdd*
T0*
_output_shapes
: 
�
&dnn/regression_head/predictions/scoresSqueezednn/logits/BiasAdd*
T0*
_output_shapes
:@*
squeeze_dims

�
(dnn/regression_head/predictions/IdentityIdentity&dnn/regression_head/predictions/scores*
T0*
_output_shapes
:@
~
4dnn/regression_head/mean_squared_loss/ExpandDims/dimConst*
dtype0*
_output_shapes
:*
valueB:
�
0dnn/regression_head/mean_squared_loss/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:84dnn/regression_head/mean_squared_loss/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
)dnn/regression_head/mean_squared_loss/subSubdnn/logits/BiasAdd0dnn/regression_head/mean_squared_loss/ExpandDims*
T0*
_output_shapes

:@
�
%dnn/regression_head/mean_squared_lossSquare)dnn/regression_head/mean_squared_loss/sub*
T0*
_output_shapes

:@
�
0dnn/regression_head/mean_squared_loss/loss/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
*dnn/regression_head/mean_squared_loss/lossMean%dnn/regression_head/mean_squared_loss0dnn/regression_head/mean_squared_loss/loss/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
k
&dnn/regression_head/ScalarSummary/tagsConst*
dtype0*
_output_shapes
: *
valueB
 Bloss
�
!dnn/regression_head/ScalarSummaryScalarSummary&dnn/regression_head/ScalarSummary/tags*dnn/regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: 
j
dnn/regression_head/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
q
'dnn/regression_head/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
s
)dnn/regression_head/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
s
)dnn/regression_head/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
!dnn/regression_head/strided_sliceStridedSlicednn/regression_head/Shape'dnn/regression_head/strided_slice/stack)dnn/regression_head/strided_slice/stack_1)dnn/regression_head/strided_slice/stack_2*
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
7dnn/regression_head/dnn/learning_rate/Initializer/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *��L=*8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
�
%dnn/regression_head/dnn/learning_rate
VariableV2*
	container *8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate*
dtype0*
_output_shapes
: *
shape: *
shared_name 
�
,dnn/regression_head/dnn/learning_rate/AssignAssign%dnn/regression_head/dnn/learning_rate7dnn/regression_head/dnn/learning_rate/Initializer/Const*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
�
*dnn/regression_head/dnn/learning_rate/readIdentity%dnn/regression_head/dnn/learning_rate*
T0*
_output_shapes
: *8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
s
0dnn/regression_head/train_op/dnn/gradients/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
u
0dnn/regression_head/train_op/dnn/gradients/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
/dnn/regression_head/train_op/dnn/gradients/FillFill0dnn/regression_head/train_op/dnn/gradients/Shape0dnn/regression_head/train_op/dnn/gradients/Const*
T0*
_output_shapes
: 
�
hdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"      
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/ReshapeReshape/dnn/regression_head/train_op/dnn/gradients/Fillhdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Reshape/shape*
T0*
_output_shapes

:*
Tshape0
�
idnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Tile/multiplesConst*
dtype0*
_output_shapes
:*
valueB"@      
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/TileTilebdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Reshapeidnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Tile/multiples*
T0*
_output_shapes

:@*

Tmultiples0
�
`dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Shape_1Const*
dtype0*
_output_shapes
: *
valueB 
�
`dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/ProdProd`dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Shape`dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
adnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Prod_1Prodbdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Shape_1bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Const_1*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
ddnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Maximum/yConst*
dtype0*
_output_shapes
: *
value	B :
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/MaximumMaximumadnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Prod_1ddnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Maximum/y*
T0*
_output_shapes
: 
�
cdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/floordivFloorDiv_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Prodbdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Maximum*
T0*
_output_shapes
: 
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/CastCastcdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/truedivRealDiv_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Tile_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Cast*
T0*
_output_shapes

:@
�
[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul/xConstc^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/truediv*
dtype0*
_output_shapes
: *
valueB
 *   @
�
Ydnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mulMul[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul/x)dnn/regression_head/mean_squared_loss/sub*
T0*
_output_shapes

:@
�
[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul_1Mulbdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/truedivYdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul*
T0*
_output_shapes

:@
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
adnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB"@      
�
odnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgsBroadcastGradientArgs_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shapeadnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
]dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/SumSum[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul_1odnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgs*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
�
adnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/ReshapeReshape]dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Sum_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Sum_1Sum[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul_1qdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
�
]dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/NegNeg_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Sum_1*
T0*
_output_shapes
:
�
cdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape_1Reshape]dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Negadnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shape_1*
T0*
_output_shapes

:@*
Tshape0
�
jdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/group_depsNoOpb^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshaped^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape_1
�
rdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependencyIdentityadnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshapek^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/group_deps*
T0*
_output_shapes

:@*t
_classj
hfloc:@dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape
�
tdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependency_1Identitycdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape_1k^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/group_deps*
T0*
_output_shapes

:@*v
_classl
jhloc:@dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape_1
�
Ndnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/BiasAddGradBiasAddGradrdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependency*
T0*
_output_shapes
:*
data_formatNHWC
�
Sdnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/group_depsNoOps^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependencyO^dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/BiasAddGrad
�
[dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependencyIdentityrdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependencyT^dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes

:@*t
_classj
hfloc:@dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape
�
]dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependency_1IdentityNdnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/BiasAddGradT^dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:*a
_classW
USloc:@dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/BiasAddGrad
�
Hdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMulMatMul[dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependencydnn/logits/weights*
T0*
_output_shapes

:@
*
transpose_a( *
transpose_b(
�
Jdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul_1MatMul$dnn/hiddenlayer_2/hiddenlayer_2/Relu[dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes

:
*
transpose_a(*
transpose_b( 
�
Rdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/group_depsNoOpI^dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMulK^dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul_1
�
Zdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/control_dependencyIdentityHdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMulS^dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:@
*[
_classQ
OMloc:@dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul
�
\dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/control_dependency_1IdentityJdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul_1S^dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:
*]
_classS
QOloc:@dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul_1
�
]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGradReluGradZdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/control_dependency$dnn/hiddenlayer_2/hiddenlayer_2/Relu*
T0*
_output_shapes

:@

�
Udnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/BiasAddGradBiasAddGrad]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGrad*
T0*
_output_shapes
:
*
data_formatNHWC
�
Zdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/group_depsNoOp^^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGradV^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/BiasAddGrad
�
bdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependencyIdentity]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes

:@
*p
_classf
dbloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGrad
�
ddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependency_1IdentityUdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/BiasAddGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:
*h
_class^
\Zloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/BiasAddGrad
�
Odnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMulMatMulbdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependencydnn/hiddenlayer_2/weights*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Qdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul_1MatMul$dnn/hiddenlayer_1/hiddenlayer_1/Relubdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes

:
*
transpose_a(*
transpose_b( 
�
Ydnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/group_depsNoOpP^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMulR^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul_1
�
adnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/control_dependencyIdentityOdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMulZ^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:@*b
_classX
VTloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul
�
cdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/control_dependency_1IdentityQdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul_1Z^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:
*d
_classZ
XVloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul_1
�
]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGradReluGradadnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/control_dependency$dnn/hiddenlayer_1/hiddenlayer_1/Relu*
T0*
_output_shapes

:@
�
Udnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/BiasAddGradBiasAddGrad]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGrad*
T0*
_output_shapes
:*
data_formatNHWC
�
Zdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/group_depsNoOp^^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGradV^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/BiasAddGrad
�
bdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependencyIdentity]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes

:@*p
_classf
dbloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGrad
�
ddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependency_1IdentityUdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/BiasAddGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:*h
_class^
\Zloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/BiasAddGrad
�
Odnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMulMatMulbdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependencydnn/hiddenlayer_1/weights*
T0*
_output_shapes

:@2*
transpose_a( *
transpose_b(
�
Qdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul_1MatMul$dnn/hiddenlayer_0/hiddenlayer_0/Relubdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes

:2*
transpose_a(*
transpose_b( 
�
Ydnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/group_depsNoOpP^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMulR^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul_1
�
adnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/control_dependencyIdentityOdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMulZ^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:@2*b
_classX
VTloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul
�
cdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/control_dependency_1IdentityQdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul_1Z^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:2*d
_classZ
XVloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul_1
�
]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGradReluGradadnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/control_dependency$dnn/hiddenlayer_0/hiddenlayer_0/Relu*
T0*
_output_shapes

:@2
�
Udnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/BiasAddGradBiasAddGrad]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGrad*
T0*
_output_shapes
:2*
data_formatNHWC
�
Zdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/group_depsNoOp^^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGradV^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/BiasAddGrad
�
bdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependencyIdentity]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes

:@2*p
_classf
dbloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGrad
�
ddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependency_1IdentityUdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/BiasAddGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:2*h
_class^
\Zloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/BiasAddGrad
�
Odnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMulMatMulbdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependencydnn/hiddenlayer_0/weights*
T0*
_output_shapes

:@8*
transpose_a( *
transpose_b(
�
Qdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul_1MatMul@dnn/input_from_feature_columns/input_from_feature_columns/concatbdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes

:82*
transpose_a(*
transpose_b( 
�
Ydnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/group_depsNoOpP^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMulR^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul_1
�
adnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/control_dependencyIdentityOdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMulZ^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:@8*b
_classX
VTloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul
�
cdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/control_dependency_1IdentityQdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul_1Z^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:82*d
_classZ
XVloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul_1
�
Rdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes

:82*
valueB82*���=*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
dtype0*
_output_shapes

:82*
shape
:82*
shared_name 
�
Gdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/AssignAssign@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/AdagradRdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes

:82*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
Ednn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/readIdentity@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad*
T0*
_output_shapes

:82*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
Qdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes
:2*
valueB2*���=*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
dtype0*
_output_shapes
:2*
shape:2*
shared_name 
�
Fdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/AssignAssign?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/AdagradQdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes
:2*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
Ddnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/readIdentity?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad*
T0*
_output_shapes
:2*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
Rdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes

:2*
valueB2*���=*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
Gdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/AssignAssign@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/AdagradRdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
Ednn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/readIdentity@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad*
T0*
_output_shapes

:2*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
Qdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes
:*
valueB*���=*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
Fdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/AssignAssign?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/AdagradQdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
Ddnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/readIdentity?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad*
T0*
_output_shapes
:*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
Rdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes

:
*
valueB
*���=*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
dtype0*
_output_shapes

:
*
shape
:
*
shared_name 
�
Gdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/AssignAssign@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/AdagradRdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
Ednn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/readIdentity@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad*
T0*
_output_shapes

:
*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
Qdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes
:
*
valueB
*���=*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
dtype0*
_output_shapes
:
*
shape:
*
shared_name 
�
Fdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/AssignAssign?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/AdagradQdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes
:
*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
Ddnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/readIdentity?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad*
T0*
_output_shapes
:
*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
Kdnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes

:
*
valueB
*���=*,
_class"
 loc:@dnn/logits/weights/part_0
�
9dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad
VariableV2*
	container *,
_class"
 loc:@dnn/logits/weights/part_0*
dtype0*
_output_shapes

:
*
shape
:
*
shared_name 
�
@dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/AssignAssign9dnn/regression_head/dnn/dnn/logits/weights/part_0/AdagradKdnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*,
_class"
 loc:@dnn/logits/weights/part_0
�
>dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/readIdentity9dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad*
T0*
_output_shapes

:
*,
_class"
 loc:@dnn/logits/weights/part_0
�
Jdnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes
:*
valueB*���=*+
_class!
loc:@dnn/logits/biases/part_0
�
8dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad
VariableV2*
	container *+
_class!
loc:@dnn/logits/biases/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
?dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/AssignAssign8dnn/regression_head/dnn/dnn/logits/biases/part_0/AdagradJdnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*+
_class!
loc:@dnn/logits/biases/part_0
�
=dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/readIdentity8dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad*
T0*
_output_shapes
:*+
_class!
loc:@dnn/logits/biases/part_0
�
[dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_0/weights/part_0/ApplyAdagradApplyAdagrad dnn/hiddenlayer_0/weights/part_0@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readcdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:82*
use_locking( *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
Zdnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_0/biases/part_0/ApplyAdagradApplyAdagraddnn/hiddenlayer_0/biases/part_0?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:2*
use_locking( *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
[dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_1/weights/part_0/ApplyAdagradApplyAdagrad dnn/hiddenlayer_1/weights/part_0@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readcdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:2*
use_locking( *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
Zdnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_1/biases/part_0/ApplyAdagradApplyAdagraddnn/hiddenlayer_1/biases/part_0?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:*
use_locking( *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
[dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_2/weights/part_0/ApplyAdagradApplyAdagrad dnn/hiddenlayer_2/weights/part_0@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readcdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:
*
use_locking( *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
Zdnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_2/biases/part_0/ApplyAdagradApplyAdagraddnn/hiddenlayer_2/biases/part_0?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:
*
use_locking( *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
Tdnn/regression_head/train_op/dnn/train/update_dnn/logits/weights/part_0/ApplyAdagradApplyAdagraddnn/logits/weights/part_09dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/read\dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:
*
use_locking( *,
_class"
 loc:@dnn/logits/weights/part_0
�
Sdnn/regression_head/train_op/dnn/train/update_dnn/logits/biases/part_0/ApplyAdagradApplyAdagraddnn/logits/biases/part_08dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/read]dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:*
use_locking( *+
_class!
loc:@dnn/logits/biases/part_0
�
-dnn/regression_head/train_op/dnn/train/updateNoOp\^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_0/weights/part_0/ApplyAdagrad[^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_0/biases/part_0/ApplyAdagrad\^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_1/weights/part_0/ApplyAdagrad[^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_1/biases/part_0/ApplyAdagrad\^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_2/weights/part_0/ApplyAdagrad[^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_2/biases/part_0/ApplyAdagradU^dnn/regression_head/train_op/dnn/train/update_dnn/logits/weights/part_0/ApplyAdagradT^dnn/regression_head/train_op/dnn/train/update_dnn/logits/biases/part_0/ApplyAdagrad
�
,dnn/regression_head/train_op/dnn/train/valueConst.^dnn/regression_head/train_op/dnn/train/update*
dtype0	*
_output_shapes
: *
value	B	 R*
_class
loc:@global_step
�
&dnn/regression_head/train_op/dnn/train	AssignAddglobal_step,dnn/regression_head/train_op/dnn/train/value*
T0	*
_output_shapes
: *
use_locking( *
_class
loc:@global_step
�
3dnn/regression_head/train_op/dnn/control_dependencyIdentity*dnn/regression_head/mean_squared_loss/loss'^dnn/regression_head/train_op/dnn/train*
T0*
_output_shapes
: *=
_class3
1/loc:@dnn/regression_head/mean_squared_loss/loss
k
&dnn/regression_head/metrics/mean/zerosConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
&dnn/regression_head/metrics/mean/total
VariableV2*
dtype0*
	container *
_output_shapes
: *
shape: *
shared_name 
�
-dnn/regression_head/metrics/mean/total/AssignAssign&dnn/regression_head/metrics/mean/total&dnn/regression_head/metrics/mean/zeros*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*9
_class/
-+loc:@dnn/regression_head/metrics/mean/total
�
+dnn/regression_head/metrics/mean/total/readIdentity&dnn/regression_head/metrics/mean/total*
T0*
_output_shapes
: *9
_class/
-+loc:@dnn/regression_head/metrics/mean/total
m
(dnn/regression_head/metrics/mean/zeros_1Const*
dtype0*
_output_shapes
: *
valueB
 *    
�
&dnn/regression_head/metrics/mean/count
VariableV2*
dtype0*
	container *
_output_shapes
: *
shape: *
shared_name 
�
-dnn/regression_head/metrics/mean/count/AssignAssign&dnn/regression_head/metrics/mean/count(dnn/regression_head/metrics/mean/zeros_1*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*9
_class/
-+loc:@dnn/regression_head/metrics/mean/count
�
+dnn/regression_head/metrics/mean/count/readIdentity&dnn/regression_head/metrics/mean/count*
T0*
_output_shapes
: *9
_class/
-+loc:@dnn/regression_head/metrics/mean/count
g
%dnn/regression_head/metrics/mean/SizeConst*
dtype0*
_output_shapes
: *
value	B :
�
*dnn/regression_head/metrics/mean/ToFloat_1Cast%dnn/regression_head/metrics/mean/Size*

SrcT0*
_output_shapes
: *

DstT0
i
&dnn/regression_head/metrics/mean/ConstConst*
dtype0*
_output_shapes
: *
valueB 
�
$dnn/regression_head/metrics/mean/SumSum*dnn/regression_head/mean_squared_loss/loss&dnn/regression_head/metrics/mean/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
*dnn/regression_head/metrics/mean/AssignAdd	AssignAdd&dnn/regression_head/metrics/mean/total$dnn/regression_head/metrics/mean/Sum*
T0*
_output_shapes
: *
use_locking( *9
_class/
-+loc:@dnn/regression_head/metrics/mean/total
�
,dnn/regression_head/metrics/mean/AssignAdd_1	AssignAdd&dnn/regression_head/metrics/mean/count*dnn/regression_head/metrics/mean/ToFloat_1+^dnn/regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: *
use_locking( *9
_class/
-+loc:@dnn/regression_head/metrics/mean/count
o
*dnn/regression_head/metrics/mean/Greater/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
(dnn/regression_head/metrics/mean/GreaterGreater+dnn/regression_head/metrics/mean/count/read*dnn/regression_head/metrics/mean/Greater/y*
T0*
_output_shapes
: 
�
(dnn/regression_head/metrics/mean/truedivRealDiv+dnn/regression_head/metrics/mean/total/read+dnn/regression_head/metrics/mean/count/read*
T0*
_output_shapes
: 
m
(dnn/regression_head/metrics/mean/value/eConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
&dnn/regression_head/metrics/mean/valueSelect(dnn/regression_head/metrics/mean/Greater(dnn/regression_head/metrics/mean/truediv(dnn/regression_head/metrics/mean/value/e*
T0*
_output_shapes
: 
q
,dnn/regression_head/metrics/mean/Greater_1/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
*dnn/regression_head/metrics/mean/Greater_1Greater,dnn/regression_head/metrics/mean/AssignAdd_1,dnn/regression_head/metrics/mean/Greater_1/y*
T0*
_output_shapes
: 
�
*dnn/regression_head/metrics/mean/truediv_1RealDiv*dnn/regression_head/metrics/mean/AssignAdd,dnn/regression_head/metrics/mean/AssignAdd_1*
T0*
_output_shapes
: 
q
,dnn/regression_head/metrics/mean/update_op/eConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
*dnn/regression_head/metrics/mean/update_opSelect*dnn/regression_head/metrics/mean/Greater_1*dnn/regression_head/metrics/mean/truediv_1,dnn/regression_head/metrics/mean/update_op/e*
T0*
_output_shapes
: "ɥ�=ƾ     ��v	�K�P�AJ��
�+�*
9
Add
x"T
y"T
z"T"
Ttype:
2	
�
ApplyAdagrad
var"T�
accum"T�
lr"T	
grad"T
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
A
Equal
x"T
y"T
z
"
Ttype:
2	
�
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
�
	HashTable
table_handle�"
	containerstring "
shared_namestring "!
use_node_name_sharingbool( "
	key_dtypetype"
value_dtypetype�
S
HistogramSummary
tag
values"T
summary"
Ttype0:
2		
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
�
OneHot
indices"TI	
depth
on_value"T
	off_value"T
output"T"
axisint���������"	
Ttype"
TItype0	:
2	
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
}
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	�
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
A
Relu
features"T
activations"T"
Ttype:
2		
S
ReluGrad
	gradients"T
features"T
	backprops"T"
Ttype:
2		
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
h
SparseReshape
input_indices	
input_shape	
	new_shape	
output_indices	
output_shape	
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
Unpack

value"T
output"T*num"
numint("	
Ttype"
axisint 
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
index	*	1.2.0-rc12v1.2.0-rc0-24-g94484aa��
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
�
Vdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Rdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:4Vdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/CastCast`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Shape*

SrcT0*
_output_shapes
:*

DstT0	
�
cdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
cdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/NotEqualNotEqualRdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dimscdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Cast_1/x*
T0*
_output_shapes

:@
�
`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/WhereWherecdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/NotEqual*'
_output_shapes
:���������
�
hdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
bdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/ReshapeReshapeRdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dimshdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
ndnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
hdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_sliceStridedSlice`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Wherendnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stackpdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stack_1pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stack_2*
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
pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
rdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
rdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1StridedSlice`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Wherepdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stackrdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stack_1rdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
bdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/unstackUnpack_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/stackPackddnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/MulMuljdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/stack*
T0	*'
_output_shapes
:���������
�
pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/SumSum^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Mulpdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/AddAddhdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Sum*
T0	*#
_output_shapes
:���������
�
adnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/GatherGatherbdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Reshape^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
�
Mdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/lookupStringToHashBucketFastadnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Gather*
num_buckets2*#
_output_shapes
:���������
�
gdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
idnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
idnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
adnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_sliceStridedSlice_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Castgdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stackidnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stack_1idnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*
_output_shapes
:*

begin_mask*
Index0
�
idnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
kdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
kdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
cdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1StridedSlice_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Castidnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stackkdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stack_1kdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*
_output_shapes
:*

begin_mask *
Index0
�
Ydnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
Xdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/ProdProdcdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1Ydnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
�
cdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat/values_1PackXdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/Prod*
T0	*
_output_shapes
:*
N*

axis 
�
_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Zdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concatConcatV2adnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slicecdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat/values_1_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat/axis*

Tidx0*
T0	*
_output_shapes
:*
N
�
adnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshapeSparseReshape`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Where_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/CastZdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat*-
_output_shapes
:���������:
�
jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshape/IdentityIdentityMdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/lookup*
T0	*#
_output_shapes
:���������
�
bdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SparseToDense/default_valueConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
Tdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SparseToDenseSparseToDenseadnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshapecdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshape:1jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshape/Identitybdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SparseToDense/default_value*
T0	*0
_output_shapes
:������������������*
validate_indices(*
Tindices0	
�
Tdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
Vdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/Const_1Const*
dtype0*
_output_shapes
: *
valueB
 *    
�
Tdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/depthConst*
dtype0*
_output_shapes
: *
value	B :2
�
Wdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/on_valueConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
Xdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/off_valueConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
Ndnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hotOneHotTdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SparseToDenseTdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/depthWdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/on_valueXdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/off_value*
axis���������*
TI0	*4
_output_shapes"
 :������������������2*
T0
�
\dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
Jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SumSumNdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot\dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/Sum/reduction_indices*

Tidx0*
T0*'
_output_shapes
:���������2*
	keep_dims( 
�
^dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:1^dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
hdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
gdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/CastCasthdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Shape*

SrcT0*
_output_shapes
:*

DstT0	
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/NotEqualNotEqualZdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dimskdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Cast_1/x*
T0*
_output_shapes

:@
�
hdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/WhereWherekdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/NotEqual*'
_output_shapes
:���������
�
pdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
jdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/ReshapeReshapeZdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dimspdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
vdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
pdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_sliceStridedSlicehdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Wherevdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stackxdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stack_1xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stack_2*
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
xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
rdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1StridedSlicehdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Wherexdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stackzdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stack_1zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
jdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/unstackUnpackgdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
hdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/stackPackldnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
fdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/MulMulrdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1hdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/stack*
T0	*'
_output_shapes
:���������
�
xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
fdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/SumSumfdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Mulxdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
fdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/AddAddpdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slicefdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Sum*
T0	*#
_output_shapes
:���������
�
idnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/GatherGatherjdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Reshapefdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
�
[dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/ConstConst*
dtype0*
_output_shapes
:*
valueBBtwoBfour
�
Zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/SizeConst*
dtype0*
_output_shapes
: *
value	B :
�
adnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
adnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
[dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/rangeRangeadnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range/startZdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/Sizeadnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range/delta*

Tidx0*
_output_shapes
:
�
]dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/ToInt64Cast[dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range*

SrcT0*
_output_shapes
:*

DstT0	
�
`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table	HashTable*
	container *
	key_dtype0*
use_node_name_sharing( *
_output_shapes
:*
shared_name *
value_dtype0	
�
fdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table/ConstConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table/table_initInitializeTable`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table[dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/Const]dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/ToInt64*

Tval0	*

Tkey0*s
_classi
geloc:@dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table
�
`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/hash_table_LookupLookupTableFind`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_tableidnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Gatherfdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table/Const*#
_output_shapes
:���������*

Tout0	*	
Tin0*s
_classi
geloc:@dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table
�
odnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
qdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
qdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
idnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_sliceStridedSlicegdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Castodnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stackqdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stack_1qdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*
_output_shapes
:*

begin_mask*
Index0
�
qdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
sdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
sdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1StridedSlicegdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Castqdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stacksdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stack_1sdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*
_output_shapes
:*

begin_mask *
Index0
�
adnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/ProdProdkdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1adnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat/values_1Pack`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/Prod*
T0	*
_output_shapes
:*
N*

axis 
�
gdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
bdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concatConcatV2idnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slicekdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat/values_1gdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat/axis*

Tidx0*
T0	*
_output_shapes
:*
N
�
idnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshapeSparseReshapehdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Wheregdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Castbdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat*-
_output_shapes
:���������:
�
rdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshape/IdentityIdentity`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/hash_table_Lookup*
T0	*#
_output_shapes
:���������
�
jdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SparseToDense/default_valueConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SparseToDenseSparseToDenseidnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshapekdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshape:1rdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshape/Identityjdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SparseToDense/default_value*
T0	*0
_output_shapes
:������������������*
validate_indices(*
Tindices0	
�
\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
^dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/Const_1Const*
dtype0*
_output_shapes
: *
valueB
 *    
�
\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/depthConst*
dtype0*
_output_shapes
: *
value	B :
�
_dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/on_valueConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/off_valueConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
Vdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hotOneHot\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SparseToDense\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/depth_dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/on_value`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/off_value*
axis���������*
TI0	*4
_output_shapes"
 :������������������*
T0
�
ddnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
Rdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SumSumVdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hotddnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/Sum/reduction_indices*

Tidx0*
T0*'
_output_shapes
:���������*
	keep_dims( 
�
Pdnn/input_from_feature_columns/input_from_feature_columns/height/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Ldnn/input_from_feature_columns/input_from_feature_columns/height/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:6Pdnn/input_from_feature_columns/input_from_feature_columns/height/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
Tdnn/input_from_feature_columns/input_from_feature_columns/horsepower/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Pdnn/input_from_feature_columns/input_from_feature_columns/horsepower/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:3Tdnn/input_from_feature_columns/input_from_feature_columns/horsepower/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
Pdnn/input_from_feature_columns/input_from_feature_columns/length/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Ldnn/input_from_feature_columns/input_from_feature_columns/length/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:5Pdnn/input_from_feature_columns/input_from_feature_columns/length/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
Odnn/input_from_feature_columns/input_from_feature_columns/width/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Kdnn/input_from_feature_columns/input_from_feature_columns/width/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:7Odnn/input_from_feature_columns/input_from_feature_columns/width/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
Ednn/input_from_feature_columns/input_from_feature_columns/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
�
@dnn/input_from_feature_columns/input_from_feature_columns/concatConcatV2Jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SumRdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SumLdnn/input_from_feature_columns/input_from_feature_columns/height/expand_dimsPdnn/input_from_feature_columns/input_from_feature_columns/horsepower/expand_dimsLdnn/input_from_feature_columns/input_from_feature_columns/length/expand_dimsKdnn/input_from_feature_columns/input_from_feature_columns/width/expand_dimsEdnn/input_from_feature_columns/input_from_feature_columns/concat/axis*

Tidx0*
T0*
_output_shapes

:@8*
N
�
Adnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"8   2   *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *�s�*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *�s>*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
Idnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/shape*
seed2 *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
dtype0*
T0*
_output_shapes

:82*

seed 
�
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/sub*
T0*
_output_shapes

:82*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
;dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes

:82*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
 dnn/hiddenlayer_0/weights/part_0
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
dtype0*
_output_shapes

:82*
shape
:82*
shared_name 
�
'dnn/hiddenlayer_0/weights/part_0/AssignAssign dnn/hiddenlayer_0/weights/part_0;dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform*
T0*
_output_shapes

:82*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
%dnn/hiddenlayer_0/weights/part_0/readIdentity dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes

:82*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
1dnn/hiddenlayer_0/biases/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:2*
valueB2*    *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
dnn/hiddenlayer_0/biases/part_0
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
dtype0*
_output_shapes
:2*
shape:2*
shared_name 
�
&dnn/hiddenlayer_0/biases/part_0/AssignAssigndnn/hiddenlayer_0/biases/part_01dnn/hiddenlayer_0/biases/part_0/Initializer/zeros*
T0*
_output_shapes
:2*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
$dnn/hiddenlayer_0/biases/part_0/readIdentitydnn/hiddenlayer_0/biases/part_0*
T0*
_output_shapes
:2*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
u
dnn/hiddenlayer_0/weightsIdentity%dnn/hiddenlayer_0/weights/part_0/read*
T0*
_output_shapes

:82
�
dnn/hiddenlayer_0/MatMulMatMul@dnn/input_from_feature_columns/input_from_feature_columns/concatdnn/hiddenlayer_0/weights*
T0*
_output_shapes

:@2*
transpose_a( *
transpose_b( 
o
dnn/hiddenlayer_0/biasesIdentity$dnn/hiddenlayer_0/biases/part_0/read*
T0*
_output_shapes
:2
�
dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/biases*
T0*
_output_shapes

:@2*
data_formatNHWC
p
$dnn/hiddenlayer_0/hiddenlayer_0/ReluReludnn/hiddenlayer_0/BiasAdd*
T0*
_output_shapes

:@2
[
dnn/zero_fraction/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
dnn/zero_fraction/EqualEqual$dnn/hiddenlayer_0/hiddenlayer_0/Reludnn/zero_fraction/zero*
T0*
_output_shapes

:@2
o
dnn/zero_fraction/CastCastdnn/zero_fraction/Equal*

SrcT0
*
_output_shapes

:@2*

DstT0
h
dnn/zero_fraction/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
dnn/zero_fraction/MeanMeandnn/zero_fraction/Castdnn/zero_fraction/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
2dnn/dnn/hiddenlayer_0_fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *>
value5B3 B-dnn/dnn/hiddenlayer_0_fraction_of_zero_values
�
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0_fraction_of_zero_values/tagsdnn/zero_fraction/Mean*
T0*
_output_shapes
: 
�
$dnn/dnn/hiddenlayer_0_activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_0_activation
�
 dnn/dnn/hiddenlayer_0_activationHistogramSummary$dnn/dnn/hiddenlayer_0_activation/tag$dnn/hiddenlayer_0/hiddenlayer_0/Relu*
T0*
_output_shapes
: 
�
Adnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"2      *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *�7��*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *�7�>*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
Idnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/shape*
seed2 *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
dtype0*
T0*
_output_shapes

:2*

seed 
�
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/sub*
T0*
_output_shapes

:2*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
;dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes

:2*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
 dnn/hiddenlayer_1/weights/part_0
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
'dnn/hiddenlayer_1/weights/part_0/AssignAssign dnn/hiddenlayer_1/weights/part_0;dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
%dnn/hiddenlayer_1/weights/part_0/readIdentity dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes

:2*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
1dnn/hiddenlayer_1/biases/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
dnn/hiddenlayer_1/biases/part_0
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
&dnn/hiddenlayer_1/biases/part_0/AssignAssigndnn/hiddenlayer_1/biases/part_01dnn/hiddenlayer_1/biases/part_0/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
$dnn/hiddenlayer_1/biases/part_0/readIdentitydnn/hiddenlayer_1/biases/part_0*
T0*
_output_shapes
:*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
u
dnn/hiddenlayer_1/weightsIdentity%dnn/hiddenlayer_1/weights/part_0/read*
T0*
_output_shapes

:2
�
dnn/hiddenlayer_1/MatMulMatMul$dnn/hiddenlayer_0/hiddenlayer_0/Reludnn/hiddenlayer_1/weights*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
o
dnn/hiddenlayer_1/biasesIdentity$dnn/hiddenlayer_1/biases/part_0/read*
T0*
_output_shapes
:
�
dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMuldnn/hiddenlayer_1/biases*
T0*
_output_shapes

:@*
data_formatNHWC
p
$dnn/hiddenlayer_1/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*
T0*
_output_shapes

:@
]
dnn/zero_fraction_1/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
dnn/zero_fraction_1/EqualEqual$dnn/hiddenlayer_1/hiddenlayer_1/Reludnn/zero_fraction_1/zero*
T0*
_output_shapes

:@
s
dnn/zero_fraction_1/CastCastdnn/zero_fraction_1/Equal*

SrcT0
*
_output_shapes

:@*

DstT0
j
dnn/zero_fraction_1/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
dnn/zero_fraction_1/MeanMeandnn/zero_fraction_1/Castdnn/zero_fraction_1/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
2dnn/dnn/hiddenlayer_1_fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *>
value5B3 B-dnn/dnn/hiddenlayer_1_fraction_of_zero_values
�
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_1_fraction_of_zero_values/tagsdnn/zero_fraction_1/Mean*
T0*
_output_shapes
: 
�
$dnn/dnn/hiddenlayer_1_activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_1_activation
�
 dnn/dnn/hiddenlayer_1_activationHistogramSummary$dnn/dnn/hiddenlayer_1_activation/tag$dnn/hiddenlayer_1/hiddenlayer_1/Relu*
T0*
_output_shapes
: 
�
Adnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"   
   *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *�Kƾ*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *�K�>*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
Idnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/shape*
seed2 *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
dtype0*
T0*
_output_shapes

:
*

seed 
�
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/sub*
T0*
_output_shapes

:
*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
;dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes

:
*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
 dnn/hiddenlayer_2/weights/part_0
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
dtype0*
_output_shapes

:
*
shape
:
*
shared_name 
�
'dnn/hiddenlayer_2/weights/part_0/AssignAssign dnn/hiddenlayer_2/weights/part_0;dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
%dnn/hiddenlayer_2/weights/part_0/readIdentity dnn/hiddenlayer_2/weights/part_0*
T0*
_output_shapes

:
*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
1dnn/hiddenlayer_2/biases/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:
*
valueB
*    *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
dnn/hiddenlayer_2/biases/part_0
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
dtype0*
_output_shapes
:
*
shape:
*
shared_name 
�
&dnn/hiddenlayer_2/biases/part_0/AssignAssigndnn/hiddenlayer_2/biases/part_01dnn/hiddenlayer_2/biases/part_0/Initializer/zeros*
T0*
_output_shapes
:
*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
$dnn/hiddenlayer_2/biases/part_0/readIdentitydnn/hiddenlayer_2/biases/part_0*
T0*
_output_shapes
:
*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
u
dnn/hiddenlayer_2/weightsIdentity%dnn/hiddenlayer_2/weights/part_0/read*
T0*
_output_shapes

:

�
dnn/hiddenlayer_2/MatMulMatMul$dnn/hiddenlayer_1/hiddenlayer_1/Reludnn/hiddenlayer_2/weights*
T0*
_output_shapes

:@
*
transpose_a( *
transpose_b( 
o
dnn/hiddenlayer_2/biasesIdentity$dnn/hiddenlayer_2/biases/part_0/read*
T0*
_output_shapes
:

�
dnn/hiddenlayer_2/BiasAddBiasAdddnn/hiddenlayer_2/MatMuldnn/hiddenlayer_2/biases*
T0*
_output_shapes

:@
*
data_formatNHWC
p
$dnn/hiddenlayer_2/hiddenlayer_2/ReluReludnn/hiddenlayer_2/BiasAdd*
T0*
_output_shapes

:@

]
dnn/zero_fraction_2/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
dnn/zero_fraction_2/EqualEqual$dnn/hiddenlayer_2/hiddenlayer_2/Reludnn/zero_fraction_2/zero*
T0*
_output_shapes

:@

s
dnn/zero_fraction_2/CastCastdnn/zero_fraction_2/Equal*

SrcT0
*
_output_shapes

:@
*

DstT0
j
dnn/zero_fraction_2/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
dnn/zero_fraction_2/MeanMeandnn/zero_fraction_2/Castdnn/zero_fraction_2/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
2dnn/dnn/hiddenlayer_2_fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *>
value5B3 B-dnn/dnn/hiddenlayer_2_fraction_of_zero_values
�
-dnn/dnn/hiddenlayer_2_fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_2_fraction_of_zero_values/tagsdnn/zero_fraction_2/Mean*
T0*
_output_shapes
: 
�
$dnn/dnn/hiddenlayer_2_activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_2_activation
�
 dnn/dnn/hiddenlayer_2_activationHistogramSummary$dnn/dnn/hiddenlayer_2_activation/tag$dnn/hiddenlayer_2/hiddenlayer_2/Relu*
T0*
_output_shapes
: 
�
:dnn/logits/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"
      *,
_class"
 loc:@dnn/logits/weights/part_0
�
8dnn/logits/weights/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *�=�*,
_class"
 loc:@dnn/logits/weights/part_0
�
8dnn/logits/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *�=?*,
_class"
 loc:@dnn/logits/weights/part_0
�
Bdnn/logits/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniform:dnn/logits/weights/part_0/Initializer/random_uniform/shape*
seed2 *,
_class"
 loc:@dnn/logits/weights/part_0*
dtype0*
T0*
_output_shapes

:
*

seed 
�
8dnn/logits/weights/part_0/Initializer/random_uniform/subSub8dnn/logits/weights/part_0/Initializer/random_uniform/max8dnn/logits/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes
: *,
_class"
 loc:@dnn/logits/weights/part_0
�
8dnn/logits/weights/part_0/Initializer/random_uniform/mulMulBdnn/logits/weights/part_0/Initializer/random_uniform/RandomUniform8dnn/logits/weights/part_0/Initializer/random_uniform/sub*
T0*
_output_shapes

:
*,
_class"
 loc:@dnn/logits/weights/part_0
�
4dnn/logits/weights/part_0/Initializer/random_uniformAdd8dnn/logits/weights/part_0/Initializer/random_uniform/mul8dnn/logits/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes

:
*,
_class"
 loc:@dnn/logits/weights/part_0
�
dnn/logits/weights/part_0
VariableV2*
	container *,
_class"
 loc:@dnn/logits/weights/part_0*
dtype0*
_output_shapes

:
*
shape
:
*
shared_name 
�
 dnn/logits/weights/part_0/AssignAssigndnn/logits/weights/part_04dnn/logits/weights/part_0/Initializer/random_uniform*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*,
_class"
 loc:@dnn/logits/weights/part_0
�
dnn/logits/weights/part_0/readIdentitydnn/logits/weights/part_0*
T0*
_output_shapes

:
*,
_class"
 loc:@dnn/logits/weights/part_0
�
*dnn/logits/biases/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *+
_class!
loc:@dnn/logits/biases/part_0
�
dnn/logits/biases/part_0
VariableV2*
	container *+
_class!
loc:@dnn/logits/biases/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
dnn/logits/biases/part_0/AssignAssigndnn/logits/biases/part_0*dnn/logits/biases/part_0/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*+
_class!
loc:@dnn/logits/biases/part_0
�
dnn/logits/biases/part_0/readIdentitydnn/logits/biases/part_0*
T0*
_output_shapes
:*+
_class!
loc:@dnn/logits/biases/part_0
g
dnn/logits/weightsIdentitydnn/logits/weights/part_0/read*
T0*
_output_shapes

:

�
dnn/logits/MatMulMatMul$dnn/hiddenlayer_2/hiddenlayer_2/Reludnn/logits/weights*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
a
dnn/logits/biasesIdentitydnn/logits/biases/part_0/read*
T0*
_output_shapes
:
�
dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/biases*
T0*
_output_shapes

:@*
data_formatNHWC
]
dnn/zero_fraction_3/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
y
dnn/zero_fraction_3/EqualEqualdnn/logits/BiasAdddnn/zero_fraction_3/zero*
T0*
_output_shapes

:@
s
dnn/zero_fraction_3/CastCastdnn/zero_fraction_3/Equal*

SrcT0
*
_output_shapes

:@*

DstT0
j
dnn/zero_fraction_3/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
dnn/zero_fraction_3/MeanMeandnn/zero_fraction_3/Castdnn/zero_fraction_3/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
+dnn/dnn/logits_fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *7
value.B, B&dnn/dnn/logits_fraction_of_zero_values
�
&dnn/dnn/logits_fraction_of_zero_valuesScalarSummary+dnn/dnn/logits_fraction_of_zero_values/tagsdnn/zero_fraction_3/Mean*
T0*
_output_shapes
: 
w
dnn/dnn/logits_activation/tagConst*
dtype0*
_output_shapes
: **
value!B Bdnn/dnn/logits_activation
�
dnn/dnn/logits_activationHistogramSummarydnn/dnn/logits_activation/tagdnn/logits/BiasAdd*
T0*
_output_shapes
: 
�
&dnn/regression_head/predictions/scoresSqueezednn/logits/BiasAdd*
T0*
_output_shapes
:@*
squeeze_dims

�
(dnn/regression_head/predictions/IdentityIdentity&dnn/regression_head/predictions/scores*
T0*
_output_shapes
:@
~
4dnn/regression_head/mean_squared_loss/ExpandDims/dimConst*
dtype0*
_output_shapes
:*
valueB:
�
0dnn/regression_head/mean_squared_loss/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:84dnn/regression_head/mean_squared_loss/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
)dnn/regression_head/mean_squared_loss/subSubdnn/logits/BiasAdd0dnn/regression_head/mean_squared_loss/ExpandDims*
T0*
_output_shapes

:@
�
%dnn/regression_head/mean_squared_lossSquare)dnn/regression_head/mean_squared_loss/sub*
T0*
_output_shapes

:@
�
0dnn/regression_head/mean_squared_loss/loss/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
*dnn/regression_head/mean_squared_loss/lossMean%dnn/regression_head/mean_squared_loss0dnn/regression_head/mean_squared_loss/loss/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
k
&dnn/regression_head/ScalarSummary/tagsConst*
dtype0*
_output_shapes
: *
valueB
 Bloss
�
!dnn/regression_head/ScalarSummaryScalarSummary&dnn/regression_head/ScalarSummary/tags*dnn/regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: 
j
dnn/regression_head/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
q
'dnn/regression_head/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
s
)dnn/regression_head/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
s
)dnn/regression_head/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
!dnn/regression_head/strided_sliceStridedSlicednn/regression_head/Shape'dnn/regression_head/strided_slice/stack)dnn/regression_head/strided_slice/stack_1)dnn/regression_head/strided_slice/stack_2*
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
7dnn/regression_head/dnn/learning_rate/Initializer/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *��L=*8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
�
%dnn/regression_head/dnn/learning_rate
VariableV2*
	container *8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate*
dtype0*
_output_shapes
: *
shape: *
shared_name 
�
,dnn/regression_head/dnn/learning_rate/AssignAssign%dnn/regression_head/dnn/learning_rate7dnn/regression_head/dnn/learning_rate/Initializer/Const*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
�
*dnn/regression_head/dnn/learning_rate/readIdentity%dnn/regression_head/dnn/learning_rate*
T0*
_output_shapes
: *8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
s
0dnn/regression_head/train_op/dnn/gradients/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
u
0dnn/regression_head/train_op/dnn/gradients/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
/dnn/regression_head/train_op/dnn/gradients/FillFill0dnn/regression_head/train_op/dnn/gradients/Shape0dnn/regression_head/train_op/dnn/gradients/Const*
T0*
_output_shapes
: 
�
hdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"      
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/ReshapeReshape/dnn/regression_head/train_op/dnn/gradients/Fillhdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Reshape/shape*
T0*
_output_shapes

:*
Tshape0
�
idnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Tile/multiplesConst*
dtype0*
_output_shapes
:*
valueB"@      
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/TileTilebdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Reshapeidnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Tile/multiples*
T0*
_output_shapes

:@*

Tmultiples0
�
`dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Shape_1Const*
dtype0*
_output_shapes
: *
valueB 
�
`dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/ProdProd`dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Shape`dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
adnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Prod_1Prodbdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Shape_1bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Const_1*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
ddnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Maximum/yConst*
dtype0*
_output_shapes
: *
value	B :
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/MaximumMaximumadnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Prod_1ddnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Maximum/y*
T0*
_output_shapes
: 
�
cdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/floordivFloorDiv_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Prodbdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Maximum*
T0*
_output_shapes
: 
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/CastCastcdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/truedivRealDiv_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Tile_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Cast*
T0*
_output_shapes

:@
�
[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul/xConstc^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/truediv*
dtype0*
_output_shapes
: *
valueB
 *   @
�
Ydnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mulMul[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul/x)dnn/regression_head/mean_squared_loss/sub*
T0*
_output_shapes

:@
�
[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul_1Mulbdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/truedivYdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul*
T0*
_output_shapes

:@
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
adnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB"@      
�
odnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgsBroadcastGradientArgs_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shapeadnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
]dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/SumSum[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul_1odnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgs*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
�
adnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/ReshapeReshape]dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Sum_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Sum_1Sum[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul_1qdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
�
]dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/NegNeg_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Sum_1*
T0*
_output_shapes
:
�
cdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape_1Reshape]dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Negadnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shape_1*
T0*
_output_shapes

:@*
Tshape0
�
jdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/group_depsNoOpb^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshaped^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape_1
�
rdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependencyIdentityadnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshapek^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/group_deps*
T0*
_output_shapes

:@*t
_classj
hfloc:@dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape
�
tdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependency_1Identitycdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape_1k^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/group_deps*
T0*
_output_shapes

:@*v
_classl
jhloc:@dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape_1
�
Ndnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/BiasAddGradBiasAddGradrdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependency*
T0*
_output_shapes
:*
data_formatNHWC
�
Sdnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/group_depsNoOps^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependencyO^dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/BiasAddGrad
�
[dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependencyIdentityrdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependencyT^dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes

:@*t
_classj
hfloc:@dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape
�
]dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependency_1IdentityNdnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/BiasAddGradT^dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:*a
_classW
USloc:@dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/BiasAddGrad
�
Hdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMulMatMul[dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependencydnn/logits/weights*
T0*
_output_shapes

:@
*
transpose_a( *
transpose_b(
�
Jdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul_1MatMul$dnn/hiddenlayer_2/hiddenlayer_2/Relu[dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes

:
*
transpose_a(*
transpose_b( 
�
Rdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/group_depsNoOpI^dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMulK^dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul_1
�
Zdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/control_dependencyIdentityHdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMulS^dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:@
*[
_classQ
OMloc:@dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul
�
\dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/control_dependency_1IdentityJdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul_1S^dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:
*]
_classS
QOloc:@dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul_1
�
]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGradReluGradZdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/control_dependency$dnn/hiddenlayer_2/hiddenlayer_2/Relu*
T0*
_output_shapes

:@

�
Udnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/BiasAddGradBiasAddGrad]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGrad*
T0*
_output_shapes
:
*
data_formatNHWC
�
Zdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/group_depsNoOp^^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGradV^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/BiasAddGrad
�
bdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependencyIdentity]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes

:@
*p
_classf
dbloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGrad
�
ddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependency_1IdentityUdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/BiasAddGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:
*h
_class^
\Zloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/BiasAddGrad
�
Odnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMulMatMulbdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependencydnn/hiddenlayer_2/weights*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Qdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul_1MatMul$dnn/hiddenlayer_1/hiddenlayer_1/Relubdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes

:
*
transpose_a(*
transpose_b( 
�
Ydnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/group_depsNoOpP^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMulR^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul_1
�
adnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/control_dependencyIdentityOdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMulZ^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:@*b
_classX
VTloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul
�
cdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/control_dependency_1IdentityQdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul_1Z^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:
*d
_classZ
XVloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul_1
�
]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGradReluGradadnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/control_dependency$dnn/hiddenlayer_1/hiddenlayer_1/Relu*
T0*
_output_shapes

:@
�
Udnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/BiasAddGradBiasAddGrad]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGrad*
T0*
_output_shapes
:*
data_formatNHWC
�
Zdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/group_depsNoOp^^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGradV^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/BiasAddGrad
�
bdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependencyIdentity]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes

:@*p
_classf
dbloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGrad
�
ddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependency_1IdentityUdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/BiasAddGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:*h
_class^
\Zloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/BiasAddGrad
�
Odnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMulMatMulbdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependencydnn/hiddenlayer_1/weights*
T0*
_output_shapes

:@2*
transpose_a( *
transpose_b(
�
Qdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul_1MatMul$dnn/hiddenlayer_0/hiddenlayer_0/Relubdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes

:2*
transpose_a(*
transpose_b( 
�
Ydnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/group_depsNoOpP^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMulR^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul_1
�
adnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/control_dependencyIdentityOdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMulZ^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:@2*b
_classX
VTloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul
�
cdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/control_dependency_1IdentityQdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul_1Z^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:2*d
_classZ
XVloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul_1
�
]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGradReluGradadnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/control_dependency$dnn/hiddenlayer_0/hiddenlayer_0/Relu*
T0*
_output_shapes

:@2
�
Udnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/BiasAddGradBiasAddGrad]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGrad*
T0*
_output_shapes
:2*
data_formatNHWC
�
Zdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/group_depsNoOp^^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGradV^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/BiasAddGrad
�
bdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependencyIdentity]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes

:@2*p
_classf
dbloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGrad
�
ddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependency_1IdentityUdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/BiasAddGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:2*h
_class^
\Zloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/BiasAddGrad
�
Odnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMulMatMulbdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependencydnn/hiddenlayer_0/weights*
T0*
_output_shapes

:@8*
transpose_a( *
transpose_b(
�
Qdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul_1MatMul@dnn/input_from_feature_columns/input_from_feature_columns/concatbdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes

:82*
transpose_a(*
transpose_b( 
�
Ydnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/group_depsNoOpP^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMulR^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul_1
�
adnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/control_dependencyIdentityOdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMulZ^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:@8*b
_classX
VTloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul
�
cdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/control_dependency_1IdentityQdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul_1Z^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:82*d
_classZ
XVloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul_1
�
Rdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes

:82*
valueB82*���=*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
dtype0*
_output_shapes

:82*
shape
:82*
shared_name 
�
Gdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/AssignAssign@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/AdagradRdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes

:82*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
Ednn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/readIdentity@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad*
T0*
_output_shapes

:82*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
Qdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes
:2*
valueB2*���=*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
dtype0*
_output_shapes
:2*
shape:2*
shared_name 
�
Fdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/AssignAssign?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/AdagradQdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes
:2*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
Ddnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/readIdentity?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad*
T0*
_output_shapes
:2*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
Rdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes

:2*
valueB2*���=*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
Gdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/AssignAssign@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/AdagradRdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
Ednn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/readIdentity@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad*
T0*
_output_shapes

:2*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
Qdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes
:*
valueB*���=*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
Fdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/AssignAssign?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/AdagradQdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
Ddnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/readIdentity?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad*
T0*
_output_shapes
:*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
Rdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes

:
*
valueB
*���=*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
dtype0*
_output_shapes

:
*
shape
:
*
shared_name 
�
Gdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/AssignAssign@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/AdagradRdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
Ednn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/readIdentity@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad*
T0*
_output_shapes

:
*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
Qdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes
:
*
valueB
*���=*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
dtype0*
_output_shapes
:
*
shape:
*
shared_name 
�
Fdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/AssignAssign?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/AdagradQdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes
:
*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
Ddnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/readIdentity?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad*
T0*
_output_shapes
:
*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
Kdnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes

:
*
valueB
*���=*,
_class"
 loc:@dnn/logits/weights/part_0
�
9dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad
VariableV2*
	container *,
_class"
 loc:@dnn/logits/weights/part_0*
dtype0*
_output_shapes

:
*
shape
:
*
shared_name 
�
@dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/AssignAssign9dnn/regression_head/dnn/dnn/logits/weights/part_0/AdagradKdnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*,
_class"
 loc:@dnn/logits/weights/part_0
�
>dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/readIdentity9dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad*
T0*
_output_shapes

:
*,
_class"
 loc:@dnn/logits/weights/part_0
�
Jdnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes
:*
valueB*���=*+
_class!
loc:@dnn/logits/biases/part_0
�
8dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad
VariableV2*
	container *+
_class!
loc:@dnn/logits/biases/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
?dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/AssignAssign8dnn/regression_head/dnn/dnn/logits/biases/part_0/AdagradJdnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*+
_class!
loc:@dnn/logits/biases/part_0
�
=dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/readIdentity8dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad*
T0*
_output_shapes
:*+
_class!
loc:@dnn/logits/biases/part_0
�
[dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_0/weights/part_0/ApplyAdagradApplyAdagrad dnn/hiddenlayer_0/weights/part_0@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readcdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:82*
use_locking( *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
Zdnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_0/biases/part_0/ApplyAdagradApplyAdagraddnn/hiddenlayer_0/biases/part_0?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:2*
use_locking( *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
[dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_1/weights/part_0/ApplyAdagradApplyAdagrad dnn/hiddenlayer_1/weights/part_0@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readcdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:2*
use_locking( *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
Zdnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_1/biases/part_0/ApplyAdagradApplyAdagraddnn/hiddenlayer_1/biases/part_0?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:*
use_locking( *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
[dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_2/weights/part_0/ApplyAdagradApplyAdagrad dnn/hiddenlayer_2/weights/part_0@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readcdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:
*
use_locking( *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
Zdnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_2/biases/part_0/ApplyAdagradApplyAdagraddnn/hiddenlayer_2/biases/part_0?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:
*
use_locking( *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
Tdnn/regression_head/train_op/dnn/train/update_dnn/logits/weights/part_0/ApplyAdagradApplyAdagraddnn/logits/weights/part_09dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/read\dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:
*
use_locking( *,
_class"
 loc:@dnn/logits/weights/part_0
�
Sdnn/regression_head/train_op/dnn/train/update_dnn/logits/biases/part_0/ApplyAdagradApplyAdagraddnn/logits/biases/part_08dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/read]dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:*
use_locking( *+
_class!
loc:@dnn/logits/biases/part_0
�
-dnn/regression_head/train_op/dnn/train/updateNoOp\^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_0/weights/part_0/ApplyAdagrad[^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_0/biases/part_0/ApplyAdagrad\^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_1/weights/part_0/ApplyAdagrad[^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_1/biases/part_0/ApplyAdagrad\^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_2/weights/part_0/ApplyAdagrad[^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_2/biases/part_0/ApplyAdagradU^dnn/regression_head/train_op/dnn/train/update_dnn/logits/weights/part_0/ApplyAdagradT^dnn/regression_head/train_op/dnn/train/update_dnn/logits/biases/part_0/ApplyAdagrad
�
,dnn/regression_head/train_op/dnn/train/valueConst.^dnn/regression_head/train_op/dnn/train/update*
dtype0	*
_output_shapes
: *
value	B	 R*
_class
loc:@global_step
�
&dnn/regression_head/train_op/dnn/train	AssignAddglobal_step,dnn/regression_head/train_op/dnn/train/value*
T0	*
_output_shapes
: *
use_locking( *
_class
loc:@global_step
�
3dnn/regression_head/train_op/dnn/control_dependencyIdentity*dnn/regression_head/mean_squared_loss/loss'^dnn/regression_head/train_op/dnn/train*
T0*
_output_shapes
: *=
_class3
1/loc:@dnn/regression_head/mean_squared_loss/loss
k
&dnn/regression_head/metrics/mean/zerosConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
&dnn/regression_head/metrics/mean/total
VariableV2*
dtype0*
	container *
_output_shapes
: *
shape: *
shared_name 
�
-dnn/regression_head/metrics/mean/total/AssignAssign&dnn/regression_head/metrics/mean/total&dnn/regression_head/metrics/mean/zeros*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*9
_class/
-+loc:@dnn/regression_head/metrics/mean/total
�
+dnn/regression_head/metrics/mean/total/readIdentity&dnn/regression_head/metrics/mean/total*
T0*
_output_shapes
: *9
_class/
-+loc:@dnn/regression_head/metrics/mean/total
m
(dnn/regression_head/metrics/mean/zeros_1Const*
dtype0*
_output_shapes
: *
valueB
 *    
�
&dnn/regression_head/metrics/mean/count
VariableV2*
dtype0*
	container *
_output_shapes
: *
shape: *
shared_name 
�
-dnn/regression_head/metrics/mean/count/AssignAssign&dnn/regression_head/metrics/mean/count(dnn/regression_head/metrics/mean/zeros_1*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*9
_class/
-+loc:@dnn/regression_head/metrics/mean/count
�
+dnn/regression_head/metrics/mean/count/readIdentity&dnn/regression_head/metrics/mean/count*
T0*
_output_shapes
: *9
_class/
-+loc:@dnn/regression_head/metrics/mean/count
g
%dnn/regression_head/metrics/mean/SizeConst*
dtype0*
_output_shapes
: *
value	B :
�
*dnn/regression_head/metrics/mean/ToFloat_1Cast%dnn/regression_head/metrics/mean/Size*

SrcT0*
_output_shapes
: *

DstT0
i
&dnn/regression_head/metrics/mean/ConstConst*
dtype0*
_output_shapes
: *
valueB 
�
$dnn/regression_head/metrics/mean/SumSum*dnn/regression_head/mean_squared_loss/loss&dnn/regression_head/metrics/mean/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
*dnn/regression_head/metrics/mean/AssignAdd	AssignAdd&dnn/regression_head/metrics/mean/total$dnn/regression_head/metrics/mean/Sum*
T0*
_output_shapes
: *
use_locking( *9
_class/
-+loc:@dnn/regression_head/metrics/mean/total
�
,dnn/regression_head/metrics/mean/AssignAdd_1	AssignAdd&dnn/regression_head/metrics/mean/count*dnn/regression_head/metrics/mean/ToFloat_1+^dnn/regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: *
use_locking( *9
_class/
-+loc:@dnn/regression_head/metrics/mean/count
o
*dnn/regression_head/metrics/mean/Greater/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
(dnn/regression_head/metrics/mean/GreaterGreater+dnn/regression_head/metrics/mean/count/read*dnn/regression_head/metrics/mean/Greater/y*
T0*
_output_shapes
: 
�
(dnn/regression_head/metrics/mean/truedivRealDiv+dnn/regression_head/metrics/mean/total/read+dnn/regression_head/metrics/mean/count/read*
T0*
_output_shapes
: 
m
(dnn/regression_head/metrics/mean/value/eConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
&dnn/regression_head/metrics/mean/valueSelect(dnn/regression_head/metrics/mean/Greater(dnn/regression_head/metrics/mean/truediv(dnn/regression_head/metrics/mean/value/e*
T0*
_output_shapes
: 
q
,dnn/regression_head/metrics/mean/Greater_1/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
*dnn/regression_head/metrics/mean/Greater_1Greater,dnn/regression_head/metrics/mean/AssignAdd_1,dnn/regression_head/metrics/mean/Greater_1/y*
T0*
_output_shapes
: 
�
*dnn/regression_head/metrics/mean/truediv_1RealDiv*dnn/regression_head/metrics/mean/AssignAdd,dnn/regression_head/metrics/mean/AssignAdd_1*
T0*
_output_shapes
: 
q
,dnn/regression_head/metrics/mean/update_op/eConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
*dnn/regression_head/metrics/mean/update_opSelect*dnn/regression_head/metrics/mean/Greater_1*dnn/regression_head/metrics/mean/truediv_1,dnn/regression_head/metrics/mean/update_op/e*
T0*
_output_shapes
: ""i
local_variablesV
T
(dnn/regression_head/metrics/mean/total:0
(dnn/regression_head/metrics/mean/count:0"�
queue_runners��
�
"enqueue_input/random_shuffle_queue.enqueue_input/random_shuffle_queue_EnqueueMany(enqueue_input/random_shuffle_queue_Close"*enqueue_input/random_shuffle_queue_Close_1*":
losses0
.
,dnn/regression_head/mean_squared_loss/loss:0"�	
trainable_variables�	�	
�
"dnn/hiddenlayer_0/weights/part_0:0'dnn/hiddenlayer_0/weights/part_0/Assign'dnn/hiddenlayer_0/weights/part_0/read:0"'
dnn/hiddenlayer_0/weights82  "82
�
!dnn/hiddenlayer_0/biases/part_0:0&dnn/hiddenlayer_0/biases/part_0/Assign&dnn/hiddenlayer_0/biases/part_0/read:0"#
dnn/hiddenlayer_0/biases2 "2
�
"dnn/hiddenlayer_1/weights/part_0:0'dnn/hiddenlayer_1/weights/part_0/Assign'dnn/hiddenlayer_1/weights/part_0/read:0"'
dnn/hiddenlayer_1/weights2  "2
�
!dnn/hiddenlayer_1/biases/part_0:0&dnn/hiddenlayer_1/biases/part_0/Assign&dnn/hiddenlayer_1/biases/part_0/read:0"#
dnn/hiddenlayer_1/biases "
�
"dnn/hiddenlayer_2/weights/part_0:0'dnn/hiddenlayer_2/weights/part_0/Assign'dnn/hiddenlayer_2/weights/part_0/read:0"'
dnn/hiddenlayer_2/weights
  "

�
!dnn/hiddenlayer_2/biases/part_0:0&dnn/hiddenlayer_2/biases/part_0/Assign&dnn/hiddenlayer_2/biases/part_0/read:0"#
dnn/hiddenlayer_2/biases
 "

�
dnn/logits/weights/part_0:0 dnn/logits/weights/part_0/Assign dnn/logits/weights/part_0/read:0" 
dnn/logits/weights
  "

|
dnn/logits/biases/part_0:0dnn/logits/biases/part_0/Assigndnn/logits/biases/part_0/read:0"
dnn/logits/biases "" 
global_step

global_step:0"

savers "�
table_initializero
m
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table/table_init"�
dnn�
�
"dnn/hiddenlayer_0/weights/part_0:0
!dnn/hiddenlayer_0/biases/part_0:0
"dnn/hiddenlayer_1/weights/part_0:0
!dnn/hiddenlayer_1/biases/part_0:0
"dnn/hiddenlayer_2/weights/part_0:0
!dnn/hiddenlayer_2/biases/part_0:0
dnn/logits/weights/part_0:0
dnn/logits/biases/part_0:0"�
model_variables�
�
"dnn/hiddenlayer_0/weights/part_0:0
!dnn/hiddenlayer_0/biases/part_0:0
"dnn/hiddenlayer_1/weights/part_0:0
!dnn/hiddenlayer_1/biases/part_0:0
"dnn/hiddenlayer_2/weights/part_0:0
!dnn/hiddenlayer_2/biases/part_0:0
dnn/logits/weights/part_0:0
dnn/logits/biases/part_0:0"�
	variables��
7
global_step:0global_step/Assignglobal_step/read:0
�
"dnn/hiddenlayer_0/weights/part_0:0'dnn/hiddenlayer_0/weights/part_0/Assign'dnn/hiddenlayer_0/weights/part_0/read:0"'
dnn/hiddenlayer_0/weights82  "82
�
!dnn/hiddenlayer_0/biases/part_0:0&dnn/hiddenlayer_0/biases/part_0/Assign&dnn/hiddenlayer_0/biases/part_0/read:0"#
dnn/hiddenlayer_0/biases2 "2
�
"dnn/hiddenlayer_1/weights/part_0:0'dnn/hiddenlayer_1/weights/part_0/Assign'dnn/hiddenlayer_1/weights/part_0/read:0"'
dnn/hiddenlayer_1/weights2  "2
�
!dnn/hiddenlayer_1/biases/part_0:0&dnn/hiddenlayer_1/biases/part_0/Assign&dnn/hiddenlayer_1/biases/part_0/read:0"#
dnn/hiddenlayer_1/biases "
�
"dnn/hiddenlayer_2/weights/part_0:0'dnn/hiddenlayer_2/weights/part_0/Assign'dnn/hiddenlayer_2/weights/part_0/read:0"'
dnn/hiddenlayer_2/weights
  "

�
!dnn/hiddenlayer_2/biases/part_0:0&dnn/hiddenlayer_2/biases/part_0/Assign&dnn/hiddenlayer_2/biases/part_0/read:0"#
dnn/hiddenlayer_2/biases
 "

�
dnn/logits/weights/part_0:0 dnn/logits/weights/part_0/Assign dnn/logits/weights/part_0/read:0" 
dnn/logits/weights
  "

|
dnn/logits/biases/part_0:0dnn/logits/biases/part_0/Assigndnn/logits/biases/part_0/read:0"
dnn/logits/biases "
�
'dnn/regression_head/dnn/learning_rate:0,dnn/regression_head/dnn/learning_rate/Assign,dnn/regression_head/dnn/learning_rate/read:0
�
Bdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad:0Gdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/AssignGdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/read:0"G
9dnn/hiddenlayer_0/weights/nlayer_0/weights/part_0/Adagrad82  "82
�
Adnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad:0Fdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/AssignFdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/read:0"C
8dnn/hiddenlayer_0/biases/enlayer_0/biases/part_0/Adagrad2 "2
�
Bdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad:0Gdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/AssignGdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/read:0"G
9dnn/hiddenlayer_1/weights/nlayer_1/weights/part_0/Adagrad2  "2
�
Adnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad:0Fdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/AssignFdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/read:0"C
8dnn/hiddenlayer_1/biases/enlayer_1/biases/part_0/Adagrad "
�
Bdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad:0Gdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/AssignGdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/read:0"G
9dnn/hiddenlayer_2/weights/nlayer_2/weights/part_0/Adagrad
  "

�
Adnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad:0Fdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/AssignFdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/read:0"C
8dnn/hiddenlayer_2/biases/enlayer_2/biases/part_0/Adagrad
 "

�
;dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad:0@dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/Assign@dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/read:0"@
2dnn/logits/weights/n/logits/weights/part_0/Adagrad
  "

�
:dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad:0?dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/Assign?dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/read:0"<
1dnn/logits/biases/nn/logits/biases/part_0/Adagrad ""�
	summaries�
�
Uenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full:0
/dnn/dnn/hiddenlayer_0_fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_0_activation:0
/dnn/dnn/hiddenlayer_1_fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_1_activation:0
/dnn/dnn/hiddenlayer_2_fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_2_activation:0
(dnn/dnn/logits_fraction_of_zero_values:0
dnn/dnn/logits_activation:0
#dnn/regression_head/ScalarSummary:0"6
train_op*
(
&dnn/regression_head/train_op/dnn/trainJ/V��&     ���	b���P�A"��
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
�
Vdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Rdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:4Vdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/CastCast`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Shape*

SrcT0*
_output_shapes
:*

DstT0	
�
cdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
cdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/NotEqualNotEqualRdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dimscdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Cast_1/x*
T0*
_output_shapes

:@
�
`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/WhereWherecdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/NotEqual*'
_output_shapes
:���������
�
hdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
bdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/ReshapeReshapeRdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dimshdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
ndnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
hdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_sliceStridedSlice`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Wherendnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stackpdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stack_1pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stack_2*
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
pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
rdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
rdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1StridedSlice`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Wherepdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stackrdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stack_1rdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
bdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/unstackUnpack_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/stackPackddnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/MulMuljdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/stack*
T0	*'
_output_shapes
:���������
�
pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/SumSum^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Mulpdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/AddAddhdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Sum*
T0	*#
_output_shapes
:���������
�
adnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/GatherGatherbdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Reshape^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
�
Mdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/lookupStringToHashBucketFastadnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Gather*
num_buckets2*#
_output_shapes
:���������
�
gdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
idnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
idnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
adnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_sliceStridedSlice_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Castgdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stackidnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stack_1idnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*
_output_shapes
:*

begin_mask*
Index0
�
idnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
kdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
kdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
cdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1StridedSlice_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Castidnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stackkdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stack_1kdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*
_output_shapes
:*

begin_mask *
Index0
�
Ydnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
Xdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/ProdProdcdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1Ydnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
�
cdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat/values_1PackXdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/Prod*
T0	*
_output_shapes
:*
N*

axis 
�
_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Zdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concatConcatV2adnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slicecdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat/values_1_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat/axis*

Tidx0*
T0	*
_output_shapes
:*
N
�
adnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshapeSparseReshape`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Where_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/CastZdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat*-
_output_shapes
:���������:
�
jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshape/IdentityIdentityMdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/lookup*
T0	*#
_output_shapes
:���������
�
bdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SparseToDense/default_valueConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
Tdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SparseToDenseSparseToDenseadnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshapecdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshape:1jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshape/Identitybdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SparseToDense/default_value*
T0	*0
_output_shapes
:������������������*
validate_indices(*
Tindices0	
�
Tdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
Vdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/Const_1Const*
dtype0*
_output_shapes
: *
valueB
 *    
�
Tdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/depthConst*
dtype0*
_output_shapes
: *
value	B :2
�
Wdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/on_valueConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
Xdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/off_valueConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
Ndnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hotOneHotTdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SparseToDenseTdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/depthWdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/on_valueXdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/off_value*
axis���������*
TI0	*4
_output_shapes"
 :������������������2*
T0
�
\dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
Jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SumSumNdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot\dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/Sum/reduction_indices*

Tidx0*
T0*'
_output_shapes
:���������2*
	keep_dims( 
�
^dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:1^dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
hdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
gdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/CastCasthdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Shape*

SrcT0*
_output_shapes
:*

DstT0	
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/NotEqualNotEqualZdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dimskdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Cast_1/x*
T0*
_output_shapes

:@
�
hdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/WhereWherekdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/NotEqual*'
_output_shapes
:���������
�
pdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
jdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/ReshapeReshapeZdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dimspdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
vdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
pdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_sliceStridedSlicehdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Wherevdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stackxdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stack_1xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stack_2*
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
xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
rdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1StridedSlicehdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Wherexdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stackzdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stack_1zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
jdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/unstackUnpackgdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
hdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/stackPackldnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
fdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/MulMulrdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1hdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/stack*
T0	*'
_output_shapes
:���������
�
xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
fdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/SumSumfdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Mulxdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
fdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/AddAddpdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slicefdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Sum*
T0	*#
_output_shapes
:���������
�
idnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/GatherGatherjdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Reshapefdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
�
[dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/ConstConst*
dtype0*
_output_shapes
:*
valueBBtwoBfour
�
Zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/SizeConst*
dtype0*
_output_shapes
: *
value	B :
�
adnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
adnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
[dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/rangeRangeadnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range/startZdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/Sizeadnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range/delta*

Tidx0*
_output_shapes
:
�
]dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/ToInt64Cast[dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range*

SrcT0*
_output_shapes
:*

DstT0	
�
`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table	HashTable*
	container *
	key_dtype0*
use_node_name_sharing( *
_output_shapes
:*
value_dtype0	*
shared_name 
�
fdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table/ConstConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table/table_initInitializeTable`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table[dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/Const]dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/ToInt64*

Tval0	*

Tkey0*s
_classi
geloc:@dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table
�
`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/hash_table_LookupLookupTableFind`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_tableidnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Gatherfdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table/Const*#
_output_shapes
:���������*

Tout0	*	
Tin0*s
_classi
geloc:@dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table
�
odnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
qdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
qdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
idnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_sliceStridedSlicegdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Castodnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stackqdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stack_1qdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*
_output_shapes
:*

begin_mask*
Index0
�
qdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
sdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
sdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1StridedSlicegdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Castqdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stacksdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stack_1sdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*
_output_shapes
:*

begin_mask *
Index0
�
adnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/ProdProdkdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1adnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat/values_1Pack`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/Prod*
T0	*
_output_shapes
:*
N*

axis 
�
gdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
bdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concatConcatV2idnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slicekdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat/values_1gdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat/axis*

Tidx0*
T0	*
_output_shapes
:*
N
�
idnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshapeSparseReshapehdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Wheregdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Castbdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat*-
_output_shapes
:���������:
�
rdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshape/IdentityIdentity`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/hash_table_Lookup*
T0	*#
_output_shapes
:���������
�
jdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SparseToDense/default_valueConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SparseToDenseSparseToDenseidnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshapekdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshape:1rdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshape/Identityjdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SparseToDense/default_value*
T0	*0
_output_shapes
:������������������*
validate_indices(*
Tindices0	
�
\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
^dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/Const_1Const*
dtype0*
_output_shapes
: *
valueB
 *    
�
\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/depthConst*
dtype0*
_output_shapes
: *
value	B :
�
_dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/on_valueConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/off_valueConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
Vdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hotOneHot\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SparseToDense\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/depth_dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/on_value`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/off_value*
axis���������*
TI0	*4
_output_shapes"
 :������������������*
T0
�
ddnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
Rdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SumSumVdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hotddnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/Sum/reduction_indices*

Tidx0*
T0*'
_output_shapes
:���������*
	keep_dims( 
�
Pdnn/input_from_feature_columns/input_from_feature_columns/height/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Ldnn/input_from_feature_columns/input_from_feature_columns/height/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:6Pdnn/input_from_feature_columns/input_from_feature_columns/height/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
Tdnn/input_from_feature_columns/input_from_feature_columns/horsepower/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Pdnn/input_from_feature_columns/input_from_feature_columns/horsepower/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:3Tdnn/input_from_feature_columns/input_from_feature_columns/horsepower/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
Pdnn/input_from_feature_columns/input_from_feature_columns/length/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Ldnn/input_from_feature_columns/input_from_feature_columns/length/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:5Pdnn/input_from_feature_columns/input_from_feature_columns/length/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
Odnn/input_from_feature_columns/input_from_feature_columns/width/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Kdnn/input_from_feature_columns/input_from_feature_columns/width/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:7Odnn/input_from_feature_columns/input_from_feature_columns/width/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
Ednn/input_from_feature_columns/input_from_feature_columns/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
�
@dnn/input_from_feature_columns/input_from_feature_columns/concatConcatV2Jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SumRdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SumLdnn/input_from_feature_columns/input_from_feature_columns/height/expand_dimsPdnn/input_from_feature_columns/input_from_feature_columns/horsepower/expand_dimsLdnn/input_from_feature_columns/input_from_feature_columns/length/expand_dimsKdnn/input_from_feature_columns/input_from_feature_columns/width/expand_dimsEdnn/input_from_feature_columns/input_from_feature_columns/concat/axis*

Tidx0*
T0*
_output_shapes

:@8*
N
�
Adnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"8   2   *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *�s�*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *�s>*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
Idnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/shape*
seed2 *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
dtype0*
T0*
_output_shapes

:82*

seed 
�
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/sub*
T0*
_output_shapes

:82*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
;dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes

:82*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
 dnn/hiddenlayer_0/weights/part_0
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
dtype0*
_output_shapes

:82*
shape
:82*
shared_name 
�
'dnn/hiddenlayer_0/weights/part_0/AssignAssign dnn/hiddenlayer_0/weights/part_0;dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform*
T0*
_output_shapes

:82*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
%dnn/hiddenlayer_0/weights/part_0/readIdentity dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes

:82*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
1dnn/hiddenlayer_0/biases/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:2*
valueB2*    *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
dnn/hiddenlayer_0/biases/part_0
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
dtype0*
_output_shapes
:2*
shape:2*
shared_name 
�
&dnn/hiddenlayer_0/biases/part_0/AssignAssigndnn/hiddenlayer_0/biases/part_01dnn/hiddenlayer_0/biases/part_0/Initializer/zeros*
T0*
_output_shapes
:2*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
$dnn/hiddenlayer_0/biases/part_0/readIdentitydnn/hiddenlayer_0/biases/part_0*
T0*
_output_shapes
:2*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
u
dnn/hiddenlayer_0/weightsIdentity%dnn/hiddenlayer_0/weights/part_0/read*
T0*
_output_shapes

:82
�
dnn/hiddenlayer_0/MatMulMatMul@dnn/input_from_feature_columns/input_from_feature_columns/concatdnn/hiddenlayer_0/weights*
T0*
_output_shapes

:@2*
transpose_a( *
transpose_b( 
o
dnn/hiddenlayer_0/biasesIdentity$dnn/hiddenlayer_0/biases/part_0/read*
T0*
_output_shapes
:2
�
dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/biases*
T0*
_output_shapes

:@2*
data_formatNHWC
p
$dnn/hiddenlayer_0/hiddenlayer_0/ReluReludnn/hiddenlayer_0/BiasAdd*
T0*
_output_shapes

:@2
[
dnn/zero_fraction/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
dnn/zero_fraction/EqualEqual$dnn/hiddenlayer_0/hiddenlayer_0/Reludnn/zero_fraction/zero*
T0*
_output_shapes

:@2
o
dnn/zero_fraction/CastCastdnn/zero_fraction/Equal*

SrcT0
*
_output_shapes

:@2*

DstT0
h
dnn/zero_fraction/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
dnn/zero_fraction/MeanMeandnn/zero_fraction/Castdnn/zero_fraction/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
2dnn/dnn/hiddenlayer_0_fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *>
value5B3 B-dnn/dnn/hiddenlayer_0_fraction_of_zero_values
�
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0_fraction_of_zero_values/tagsdnn/zero_fraction/Mean*
T0*
_output_shapes
: 
�
$dnn/dnn/hiddenlayer_0_activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_0_activation
�
 dnn/dnn/hiddenlayer_0_activationHistogramSummary$dnn/dnn/hiddenlayer_0_activation/tag$dnn/hiddenlayer_0/hiddenlayer_0/Relu*
T0*
_output_shapes
: 
�
Adnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"2      *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *�7��*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *�7�>*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
Idnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/shape*
seed2 *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
dtype0*
T0*
_output_shapes

:2*

seed 
�
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/sub*
T0*
_output_shapes

:2*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
;dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes

:2*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
 dnn/hiddenlayer_1/weights/part_0
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
'dnn/hiddenlayer_1/weights/part_0/AssignAssign dnn/hiddenlayer_1/weights/part_0;dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
%dnn/hiddenlayer_1/weights/part_0/readIdentity dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes

:2*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
1dnn/hiddenlayer_1/biases/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
dnn/hiddenlayer_1/biases/part_0
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
&dnn/hiddenlayer_1/biases/part_0/AssignAssigndnn/hiddenlayer_1/biases/part_01dnn/hiddenlayer_1/biases/part_0/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
$dnn/hiddenlayer_1/biases/part_0/readIdentitydnn/hiddenlayer_1/biases/part_0*
T0*
_output_shapes
:*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
u
dnn/hiddenlayer_1/weightsIdentity%dnn/hiddenlayer_1/weights/part_0/read*
T0*
_output_shapes

:2
�
dnn/hiddenlayer_1/MatMulMatMul$dnn/hiddenlayer_0/hiddenlayer_0/Reludnn/hiddenlayer_1/weights*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
o
dnn/hiddenlayer_1/biasesIdentity$dnn/hiddenlayer_1/biases/part_0/read*
T0*
_output_shapes
:
�
dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMuldnn/hiddenlayer_1/biases*
T0*
_output_shapes

:@*
data_formatNHWC
p
$dnn/hiddenlayer_1/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*
T0*
_output_shapes

:@
]
dnn/zero_fraction_1/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
dnn/zero_fraction_1/EqualEqual$dnn/hiddenlayer_1/hiddenlayer_1/Reludnn/zero_fraction_1/zero*
T0*
_output_shapes

:@
s
dnn/zero_fraction_1/CastCastdnn/zero_fraction_1/Equal*

SrcT0
*
_output_shapes

:@*

DstT0
j
dnn/zero_fraction_1/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
dnn/zero_fraction_1/MeanMeandnn/zero_fraction_1/Castdnn/zero_fraction_1/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
2dnn/dnn/hiddenlayer_1_fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *>
value5B3 B-dnn/dnn/hiddenlayer_1_fraction_of_zero_values
�
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_1_fraction_of_zero_values/tagsdnn/zero_fraction_1/Mean*
T0*
_output_shapes
: 
�
$dnn/dnn/hiddenlayer_1_activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_1_activation
�
 dnn/dnn/hiddenlayer_1_activationHistogramSummary$dnn/dnn/hiddenlayer_1_activation/tag$dnn/hiddenlayer_1/hiddenlayer_1/Relu*
T0*
_output_shapes
: 
�
Adnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"   
   *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *�Kƾ*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *�K�>*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
Idnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/shape*
seed2 *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
dtype0*
T0*
_output_shapes

:
*

seed 
�
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/sub*
T0*
_output_shapes

:
*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
;dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes

:
*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
 dnn/hiddenlayer_2/weights/part_0
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
dtype0*
_output_shapes

:
*
shape
:
*
shared_name 
�
'dnn/hiddenlayer_2/weights/part_0/AssignAssign dnn/hiddenlayer_2/weights/part_0;dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
%dnn/hiddenlayer_2/weights/part_0/readIdentity dnn/hiddenlayer_2/weights/part_0*
T0*
_output_shapes

:
*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
1dnn/hiddenlayer_2/biases/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:
*
valueB
*    *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
dnn/hiddenlayer_2/biases/part_0
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
dtype0*
_output_shapes
:
*
shape:
*
shared_name 
�
&dnn/hiddenlayer_2/biases/part_0/AssignAssigndnn/hiddenlayer_2/biases/part_01dnn/hiddenlayer_2/biases/part_0/Initializer/zeros*
T0*
_output_shapes
:
*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
$dnn/hiddenlayer_2/biases/part_0/readIdentitydnn/hiddenlayer_2/biases/part_0*
T0*
_output_shapes
:
*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
u
dnn/hiddenlayer_2/weightsIdentity%dnn/hiddenlayer_2/weights/part_0/read*
T0*
_output_shapes

:

�
dnn/hiddenlayer_2/MatMulMatMul$dnn/hiddenlayer_1/hiddenlayer_1/Reludnn/hiddenlayer_2/weights*
T0*
_output_shapes

:@
*
transpose_a( *
transpose_b( 
o
dnn/hiddenlayer_2/biasesIdentity$dnn/hiddenlayer_2/biases/part_0/read*
T0*
_output_shapes
:

�
dnn/hiddenlayer_2/BiasAddBiasAdddnn/hiddenlayer_2/MatMuldnn/hiddenlayer_2/biases*
T0*
_output_shapes

:@
*
data_formatNHWC
p
$dnn/hiddenlayer_2/hiddenlayer_2/ReluReludnn/hiddenlayer_2/BiasAdd*
T0*
_output_shapes

:@

]
dnn/zero_fraction_2/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
dnn/zero_fraction_2/EqualEqual$dnn/hiddenlayer_2/hiddenlayer_2/Reludnn/zero_fraction_2/zero*
T0*
_output_shapes

:@

s
dnn/zero_fraction_2/CastCastdnn/zero_fraction_2/Equal*

SrcT0
*
_output_shapes

:@
*

DstT0
j
dnn/zero_fraction_2/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
dnn/zero_fraction_2/MeanMeandnn/zero_fraction_2/Castdnn/zero_fraction_2/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
2dnn/dnn/hiddenlayer_2_fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *>
value5B3 B-dnn/dnn/hiddenlayer_2_fraction_of_zero_values
�
-dnn/dnn/hiddenlayer_2_fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_2_fraction_of_zero_values/tagsdnn/zero_fraction_2/Mean*
T0*
_output_shapes
: 
�
$dnn/dnn/hiddenlayer_2_activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_2_activation
�
 dnn/dnn/hiddenlayer_2_activationHistogramSummary$dnn/dnn/hiddenlayer_2_activation/tag$dnn/hiddenlayer_2/hiddenlayer_2/Relu*
T0*
_output_shapes
: 
�
:dnn/logits/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"
      *,
_class"
 loc:@dnn/logits/weights/part_0
�
8dnn/logits/weights/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *�=�*,
_class"
 loc:@dnn/logits/weights/part_0
�
8dnn/logits/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *�=?*,
_class"
 loc:@dnn/logits/weights/part_0
�
Bdnn/logits/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniform:dnn/logits/weights/part_0/Initializer/random_uniform/shape*
seed2 *,
_class"
 loc:@dnn/logits/weights/part_0*
dtype0*
T0*
_output_shapes

:
*

seed 
�
8dnn/logits/weights/part_0/Initializer/random_uniform/subSub8dnn/logits/weights/part_0/Initializer/random_uniform/max8dnn/logits/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes
: *,
_class"
 loc:@dnn/logits/weights/part_0
�
8dnn/logits/weights/part_0/Initializer/random_uniform/mulMulBdnn/logits/weights/part_0/Initializer/random_uniform/RandomUniform8dnn/logits/weights/part_0/Initializer/random_uniform/sub*
T0*
_output_shapes

:
*,
_class"
 loc:@dnn/logits/weights/part_0
�
4dnn/logits/weights/part_0/Initializer/random_uniformAdd8dnn/logits/weights/part_0/Initializer/random_uniform/mul8dnn/logits/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes

:
*,
_class"
 loc:@dnn/logits/weights/part_0
�
dnn/logits/weights/part_0
VariableV2*
	container *,
_class"
 loc:@dnn/logits/weights/part_0*
dtype0*
_output_shapes

:
*
shape
:
*
shared_name 
�
 dnn/logits/weights/part_0/AssignAssigndnn/logits/weights/part_04dnn/logits/weights/part_0/Initializer/random_uniform*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*,
_class"
 loc:@dnn/logits/weights/part_0
�
dnn/logits/weights/part_0/readIdentitydnn/logits/weights/part_0*
T0*
_output_shapes

:
*,
_class"
 loc:@dnn/logits/weights/part_0
�
*dnn/logits/biases/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *+
_class!
loc:@dnn/logits/biases/part_0
�
dnn/logits/biases/part_0
VariableV2*
	container *+
_class!
loc:@dnn/logits/biases/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
dnn/logits/biases/part_0/AssignAssigndnn/logits/biases/part_0*dnn/logits/biases/part_0/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*+
_class!
loc:@dnn/logits/biases/part_0
�
dnn/logits/biases/part_0/readIdentitydnn/logits/biases/part_0*
T0*
_output_shapes
:*+
_class!
loc:@dnn/logits/biases/part_0
g
dnn/logits/weightsIdentitydnn/logits/weights/part_0/read*
T0*
_output_shapes

:

�
dnn/logits/MatMulMatMul$dnn/hiddenlayer_2/hiddenlayer_2/Reludnn/logits/weights*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
a
dnn/logits/biasesIdentitydnn/logits/biases/part_0/read*
T0*
_output_shapes
:
�
dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/biases*
T0*
_output_shapes

:@*
data_formatNHWC
]
dnn/zero_fraction_3/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
y
dnn/zero_fraction_3/EqualEqualdnn/logits/BiasAdddnn/zero_fraction_3/zero*
T0*
_output_shapes

:@
s
dnn/zero_fraction_3/CastCastdnn/zero_fraction_3/Equal*

SrcT0
*
_output_shapes

:@*

DstT0
j
dnn/zero_fraction_3/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
dnn/zero_fraction_3/MeanMeandnn/zero_fraction_3/Castdnn/zero_fraction_3/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
+dnn/dnn/logits_fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *7
value.B, B&dnn/dnn/logits_fraction_of_zero_values
�
&dnn/dnn/logits_fraction_of_zero_valuesScalarSummary+dnn/dnn/logits_fraction_of_zero_values/tagsdnn/zero_fraction_3/Mean*
T0*
_output_shapes
: 
w
dnn/dnn/logits_activation/tagConst*
dtype0*
_output_shapes
: **
value!B Bdnn/dnn/logits_activation
�
dnn/dnn/logits_activationHistogramSummarydnn/dnn/logits_activation/tagdnn/logits/BiasAdd*
T0*
_output_shapes
: 
�
&dnn/regression_head/predictions/scoresSqueezednn/logits/BiasAdd*
T0*
_output_shapes
:@*
squeeze_dims

�
(dnn/regression_head/predictions/IdentityIdentity&dnn/regression_head/predictions/scores*
T0*
_output_shapes
:@
~
4dnn/regression_head/mean_squared_loss/ExpandDims/dimConst*
dtype0*
_output_shapes
:*
valueB:
�
0dnn/regression_head/mean_squared_loss/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:84dnn/regression_head/mean_squared_loss/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
)dnn/regression_head/mean_squared_loss/subSubdnn/logits/BiasAdd0dnn/regression_head/mean_squared_loss/ExpandDims*
T0*
_output_shapes

:@
�
%dnn/regression_head/mean_squared_lossSquare)dnn/regression_head/mean_squared_loss/sub*
T0*
_output_shapes

:@
�
0dnn/regression_head/mean_squared_loss/loss/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
*dnn/regression_head/mean_squared_loss/lossMean%dnn/regression_head/mean_squared_loss0dnn/regression_head/mean_squared_loss/loss/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
k
&dnn/regression_head/ScalarSummary/tagsConst*
dtype0*
_output_shapes
: *
valueB
 Bloss
�
!dnn/regression_head/ScalarSummaryScalarSummary&dnn/regression_head/ScalarSummary/tags*dnn/regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: 
j
dnn/regression_head/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
q
'dnn/regression_head/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
s
)dnn/regression_head/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
s
)dnn/regression_head/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
!dnn/regression_head/strided_sliceStridedSlicednn/regression_head/Shape'dnn/regression_head/strided_slice/stack)dnn/regression_head/strided_slice/stack_1)dnn/regression_head/strided_slice/stack_2*
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
7dnn/regression_head/dnn/learning_rate/Initializer/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *��L=*8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
�
%dnn/regression_head/dnn/learning_rate
VariableV2*
	container *8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate*
dtype0*
_output_shapes
: *
shape: *
shared_name 
�
,dnn/regression_head/dnn/learning_rate/AssignAssign%dnn/regression_head/dnn/learning_rate7dnn/regression_head/dnn/learning_rate/Initializer/Const*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
�
*dnn/regression_head/dnn/learning_rate/readIdentity%dnn/regression_head/dnn/learning_rate*
T0*
_output_shapes
: *8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
s
0dnn/regression_head/train_op/dnn/gradients/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
u
0dnn/regression_head/train_op/dnn/gradients/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
/dnn/regression_head/train_op/dnn/gradients/FillFill0dnn/regression_head/train_op/dnn/gradients/Shape0dnn/regression_head/train_op/dnn/gradients/Const*
T0*
_output_shapes
: 
�
hdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"      
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/ReshapeReshape/dnn/regression_head/train_op/dnn/gradients/Fillhdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Reshape/shape*
T0*
_output_shapes

:*
Tshape0
�
idnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Tile/multiplesConst*
dtype0*
_output_shapes
:*
valueB"@      
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/TileTilebdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Reshapeidnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Tile/multiples*
T0*
_output_shapes

:@*

Tmultiples0
�
`dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Shape_1Const*
dtype0*
_output_shapes
: *
valueB 
�
`dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/ProdProd`dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Shape`dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
adnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Prod_1Prodbdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Shape_1bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Const_1*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
ddnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Maximum/yConst*
dtype0*
_output_shapes
: *
value	B :
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/MaximumMaximumadnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Prod_1ddnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Maximum/y*
T0*
_output_shapes
: 
�
cdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/floordivFloorDiv_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Prodbdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Maximum*
T0*
_output_shapes
: 
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/CastCastcdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/truedivRealDiv_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Tile_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Cast*
T0*
_output_shapes

:@
�
[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul/xConstc^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/truediv*
dtype0*
_output_shapes
: *
valueB
 *   @
�
Ydnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mulMul[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul/x)dnn/regression_head/mean_squared_loss/sub*
T0*
_output_shapes

:@
�
[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul_1Mulbdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/truedivYdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul*
T0*
_output_shapes

:@
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
adnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB"@      
�
odnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgsBroadcastGradientArgs_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shapeadnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
]dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/SumSum[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul_1odnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgs*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
�
adnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/ReshapeReshape]dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Sum_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Sum_1Sum[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul_1qdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
�
]dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/NegNeg_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Sum_1*
T0*
_output_shapes
:
�
cdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape_1Reshape]dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Negadnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shape_1*
T0*
_output_shapes

:@*
Tshape0
�
jdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/group_depsNoOpb^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshaped^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape_1
�
rdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependencyIdentityadnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshapek^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/group_deps*
T0*
_output_shapes

:@*t
_classj
hfloc:@dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape
�
tdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependency_1Identitycdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape_1k^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/group_deps*
T0*
_output_shapes

:@*v
_classl
jhloc:@dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape_1
�
Ndnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/BiasAddGradBiasAddGradrdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependency*
T0*
_output_shapes
:*
data_formatNHWC
�
Sdnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/group_depsNoOps^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependencyO^dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/BiasAddGrad
�
[dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependencyIdentityrdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependencyT^dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes

:@*t
_classj
hfloc:@dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape
�
]dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependency_1IdentityNdnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/BiasAddGradT^dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:*a
_classW
USloc:@dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/BiasAddGrad
�
Hdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMulMatMul[dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependencydnn/logits/weights*
T0*
_output_shapes

:@
*
transpose_a( *
transpose_b(
�
Jdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul_1MatMul$dnn/hiddenlayer_2/hiddenlayer_2/Relu[dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes

:
*
transpose_a(*
transpose_b( 
�
Rdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/group_depsNoOpI^dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMulK^dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul_1
�
Zdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/control_dependencyIdentityHdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMulS^dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:@
*[
_classQ
OMloc:@dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul
�
\dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/control_dependency_1IdentityJdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul_1S^dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:
*]
_classS
QOloc:@dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul_1
�
]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGradReluGradZdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/control_dependency$dnn/hiddenlayer_2/hiddenlayer_2/Relu*
T0*
_output_shapes

:@

�
Udnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/BiasAddGradBiasAddGrad]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGrad*
T0*
_output_shapes
:
*
data_formatNHWC
�
Zdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/group_depsNoOp^^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGradV^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/BiasAddGrad
�
bdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependencyIdentity]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes

:@
*p
_classf
dbloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGrad
�
ddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependency_1IdentityUdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/BiasAddGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:
*h
_class^
\Zloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/BiasAddGrad
�
Odnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMulMatMulbdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependencydnn/hiddenlayer_2/weights*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Qdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul_1MatMul$dnn/hiddenlayer_1/hiddenlayer_1/Relubdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes

:
*
transpose_a(*
transpose_b( 
�
Ydnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/group_depsNoOpP^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMulR^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul_1
�
adnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/control_dependencyIdentityOdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMulZ^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:@*b
_classX
VTloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul
�
cdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/control_dependency_1IdentityQdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul_1Z^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:
*d
_classZ
XVloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul_1
�
]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGradReluGradadnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/control_dependency$dnn/hiddenlayer_1/hiddenlayer_1/Relu*
T0*
_output_shapes

:@
�
Udnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/BiasAddGradBiasAddGrad]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGrad*
T0*
_output_shapes
:*
data_formatNHWC
�
Zdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/group_depsNoOp^^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGradV^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/BiasAddGrad
�
bdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependencyIdentity]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes

:@*p
_classf
dbloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGrad
�
ddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependency_1IdentityUdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/BiasAddGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:*h
_class^
\Zloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/BiasAddGrad
�
Odnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMulMatMulbdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependencydnn/hiddenlayer_1/weights*
T0*
_output_shapes

:@2*
transpose_a( *
transpose_b(
�
Qdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul_1MatMul$dnn/hiddenlayer_0/hiddenlayer_0/Relubdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes

:2*
transpose_a(*
transpose_b( 
�
Ydnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/group_depsNoOpP^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMulR^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul_1
�
adnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/control_dependencyIdentityOdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMulZ^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:@2*b
_classX
VTloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul
�
cdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/control_dependency_1IdentityQdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul_1Z^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:2*d
_classZ
XVloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul_1
�
]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGradReluGradadnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/control_dependency$dnn/hiddenlayer_0/hiddenlayer_0/Relu*
T0*
_output_shapes

:@2
�
Udnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/BiasAddGradBiasAddGrad]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGrad*
T0*
_output_shapes
:2*
data_formatNHWC
�
Zdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/group_depsNoOp^^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGradV^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/BiasAddGrad
�
bdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependencyIdentity]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes

:@2*p
_classf
dbloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGrad
�
ddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependency_1IdentityUdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/BiasAddGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:2*h
_class^
\Zloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/BiasAddGrad
�
Odnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMulMatMulbdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependencydnn/hiddenlayer_0/weights*
T0*
_output_shapes

:@8*
transpose_a( *
transpose_b(
�
Qdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul_1MatMul@dnn/input_from_feature_columns/input_from_feature_columns/concatbdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes

:82*
transpose_a(*
transpose_b( 
�
Ydnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/group_depsNoOpP^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMulR^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul_1
�
adnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/control_dependencyIdentityOdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMulZ^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:@8*b
_classX
VTloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul
�
cdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/control_dependency_1IdentityQdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul_1Z^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:82*d
_classZ
XVloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul_1
�
Rdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes

:82*
valueB82*���=*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
dtype0*
_output_shapes

:82*
shape
:82*
shared_name 
�
Gdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/AssignAssign@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/AdagradRdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes

:82*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
Ednn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/readIdentity@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad*
T0*
_output_shapes

:82*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
Qdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes
:2*
valueB2*���=*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
dtype0*
_output_shapes
:2*
shape:2*
shared_name 
�
Fdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/AssignAssign?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/AdagradQdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes
:2*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
Ddnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/readIdentity?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad*
T0*
_output_shapes
:2*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
Rdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes

:2*
valueB2*���=*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
Gdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/AssignAssign@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/AdagradRdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
Ednn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/readIdentity@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad*
T0*
_output_shapes

:2*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
Qdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes
:*
valueB*���=*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
Fdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/AssignAssign?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/AdagradQdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
Ddnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/readIdentity?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad*
T0*
_output_shapes
:*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
Rdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes

:
*
valueB
*���=*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
dtype0*
_output_shapes

:
*
shape
:
*
shared_name 
�
Gdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/AssignAssign@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/AdagradRdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
Ednn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/readIdentity@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad*
T0*
_output_shapes

:
*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
Qdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes
:
*
valueB
*���=*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
dtype0*
_output_shapes
:
*
shape:
*
shared_name 
�
Fdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/AssignAssign?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/AdagradQdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes
:
*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
Ddnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/readIdentity?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad*
T0*
_output_shapes
:
*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
Kdnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes

:
*
valueB
*���=*,
_class"
 loc:@dnn/logits/weights/part_0
�
9dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad
VariableV2*
	container *,
_class"
 loc:@dnn/logits/weights/part_0*
dtype0*
_output_shapes

:
*
shape
:
*
shared_name 
�
@dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/AssignAssign9dnn/regression_head/dnn/dnn/logits/weights/part_0/AdagradKdnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*,
_class"
 loc:@dnn/logits/weights/part_0
�
>dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/readIdentity9dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad*
T0*
_output_shapes

:
*,
_class"
 loc:@dnn/logits/weights/part_0
�
Jdnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes
:*
valueB*���=*+
_class!
loc:@dnn/logits/biases/part_0
�
8dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad
VariableV2*
	container *+
_class!
loc:@dnn/logits/biases/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
?dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/AssignAssign8dnn/regression_head/dnn/dnn/logits/biases/part_0/AdagradJdnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*+
_class!
loc:@dnn/logits/biases/part_0
�
=dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/readIdentity8dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad*
T0*
_output_shapes
:*+
_class!
loc:@dnn/logits/biases/part_0
�
[dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_0/weights/part_0/ApplyAdagradApplyAdagrad dnn/hiddenlayer_0/weights/part_0@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readcdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:82*
use_locking( *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
Zdnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_0/biases/part_0/ApplyAdagradApplyAdagraddnn/hiddenlayer_0/biases/part_0?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:2*
use_locking( *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
[dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_1/weights/part_0/ApplyAdagradApplyAdagrad dnn/hiddenlayer_1/weights/part_0@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readcdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:2*
use_locking( *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
Zdnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_1/biases/part_0/ApplyAdagradApplyAdagraddnn/hiddenlayer_1/biases/part_0?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:*
use_locking( *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
[dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_2/weights/part_0/ApplyAdagradApplyAdagrad dnn/hiddenlayer_2/weights/part_0@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readcdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:
*
use_locking( *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
Zdnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_2/biases/part_0/ApplyAdagradApplyAdagraddnn/hiddenlayer_2/biases/part_0?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:
*
use_locking( *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
Tdnn/regression_head/train_op/dnn/train/update_dnn/logits/weights/part_0/ApplyAdagradApplyAdagraddnn/logits/weights/part_09dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/read\dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:
*
use_locking( *,
_class"
 loc:@dnn/logits/weights/part_0
�
Sdnn/regression_head/train_op/dnn/train/update_dnn/logits/biases/part_0/ApplyAdagradApplyAdagraddnn/logits/biases/part_08dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/read]dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:*
use_locking( *+
_class!
loc:@dnn/logits/biases/part_0
�
-dnn/regression_head/train_op/dnn/train/updateNoOp\^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_0/weights/part_0/ApplyAdagrad[^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_0/biases/part_0/ApplyAdagrad\^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_1/weights/part_0/ApplyAdagrad[^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_1/biases/part_0/ApplyAdagrad\^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_2/weights/part_0/ApplyAdagrad[^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_2/biases/part_0/ApplyAdagradU^dnn/regression_head/train_op/dnn/train/update_dnn/logits/weights/part_0/ApplyAdagradT^dnn/regression_head/train_op/dnn/train/update_dnn/logits/biases/part_0/ApplyAdagrad
�
,dnn/regression_head/train_op/dnn/train/valueConst.^dnn/regression_head/train_op/dnn/train/update*
dtype0	*
_output_shapes
: *
value	B	 R*
_class
loc:@global_step
�
&dnn/regression_head/train_op/dnn/train	AssignAddglobal_step,dnn/regression_head/train_op/dnn/train/value*
T0	*
_output_shapes
: *
use_locking( *
_class
loc:@global_step
�
3dnn/regression_head/train_op/dnn/control_dependencyIdentity*dnn/regression_head/mean_squared_loss/loss'^dnn/regression_head/train_op/dnn/train*
T0*
_output_shapes
: *=
_class3
1/loc:@dnn/regression_head/mean_squared_loss/loss
k
&dnn/regression_head/metrics/mean/zerosConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
&dnn/regression_head/metrics/mean/total
VariableV2*
dtype0*
	container *
_output_shapes
: *
shape: *
shared_name 
�
-dnn/regression_head/metrics/mean/total/AssignAssign&dnn/regression_head/metrics/mean/total&dnn/regression_head/metrics/mean/zeros*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*9
_class/
-+loc:@dnn/regression_head/metrics/mean/total
�
+dnn/regression_head/metrics/mean/total/readIdentity&dnn/regression_head/metrics/mean/total*
T0*
_output_shapes
: *9
_class/
-+loc:@dnn/regression_head/metrics/mean/total
m
(dnn/regression_head/metrics/mean/zeros_1Const*
dtype0*
_output_shapes
: *
valueB
 *    
�
&dnn/regression_head/metrics/mean/count
VariableV2*
dtype0*
	container *
_output_shapes
: *
shape: *
shared_name 
�
-dnn/regression_head/metrics/mean/count/AssignAssign&dnn/regression_head/metrics/mean/count(dnn/regression_head/metrics/mean/zeros_1*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*9
_class/
-+loc:@dnn/regression_head/metrics/mean/count
�
+dnn/regression_head/metrics/mean/count/readIdentity&dnn/regression_head/metrics/mean/count*
T0*
_output_shapes
: *9
_class/
-+loc:@dnn/regression_head/metrics/mean/count
g
%dnn/regression_head/metrics/mean/SizeConst*
dtype0*
_output_shapes
: *
value	B :
�
*dnn/regression_head/metrics/mean/ToFloat_1Cast%dnn/regression_head/metrics/mean/Size*

SrcT0*
_output_shapes
: *

DstT0
i
&dnn/regression_head/metrics/mean/ConstConst*
dtype0*
_output_shapes
: *
valueB 
�
$dnn/regression_head/metrics/mean/SumSum*dnn/regression_head/mean_squared_loss/loss&dnn/regression_head/metrics/mean/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
*dnn/regression_head/metrics/mean/AssignAdd	AssignAdd&dnn/regression_head/metrics/mean/total$dnn/regression_head/metrics/mean/Sum*
T0*
_output_shapes
: *
use_locking( *9
_class/
-+loc:@dnn/regression_head/metrics/mean/total
�
,dnn/regression_head/metrics/mean/AssignAdd_1	AssignAdd&dnn/regression_head/metrics/mean/count*dnn/regression_head/metrics/mean/ToFloat_1+^dnn/regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: *
use_locking( *9
_class/
-+loc:@dnn/regression_head/metrics/mean/count
o
*dnn/regression_head/metrics/mean/Greater/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
(dnn/regression_head/metrics/mean/GreaterGreater+dnn/regression_head/metrics/mean/count/read*dnn/regression_head/metrics/mean/Greater/y*
T0*
_output_shapes
: 
�
(dnn/regression_head/metrics/mean/truedivRealDiv+dnn/regression_head/metrics/mean/total/read+dnn/regression_head/metrics/mean/count/read*
T0*
_output_shapes
: 
m
(dnn/regression_head/metrics/mean/value/eConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
&dnn/regression_head/metrics/mean/valueSelect(dnn/regression_head/metrics/mean/Greater(dnn/regression_head/metrics/mean/truediv(dnn/regression_head/metrics/mean/value/e*
T0*
_output_shapes
: 
q
,dnn/regression_head/metrics/mean/Greater_1/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
*dnn/regression_head/metrics/mean/Greater_1Greater,dnn/regression_head/metrics/mean/AssignAdd_1,dnn/regression_head/metrics/mean/Greater_1/y*
T0*
_output_shapes
: 
�
*dnn/regression_head/metrics/mean/truediv_1RealDiv*dnn/regression_head/metrics/mean/AssignAdd,dnn/regression_head/metrics/mean/AssignAdd_1*
T0*
_output_shapes
: 
q
,dnn/regression_head/metrics/mean/update_op/eConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
*dnn/regression_head/metrics/mean/update_opSelect*dnn/regression_head/metrics/mean/Greater_1*dnn/regression_head/metrics/mean/truediv_1,dnn/regression_head/metrics/mean/update_op/e*
T0*
_output_shapes
: 
�
initNoOp^global_step/Assign(^dnn/hiddenlayer_0/weights/part_0/Assign'^dnn/hiddenlayer_0/biases/part_0/Assign(^dnn/hiddenlayer_1/weights/part_0/Assign'^dnn/hiddenlayer_1/biases/part_0/Assign(^dnn/hiddenlayer_2/weights/part_0/Assign'^dnn/hiddenlayer_2/biases/part_0/Assign!^dnn/logits/weights/part_0/Assign ^dnn/logits/biases/part_0/Assign-^dnn/regression_head/dnn/learning_rate/AssignH^dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/AssignG^dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/AssignH^dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/AssignG^dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/AssignH^dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/AssignG^dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/AssignA^dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/Assign@^dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/Assign
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
6report_uninitialized_variables/IsVariableInitialized_1IsVariableInitialized dnn/hiddenlayer_0/weights/part_0*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
6report_uninitialized_variables/IsVariableInitialized_2IsVariableInitializeddnn/hiddenlayer_0/biases/part_0*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
6report_uninitialized_variables/IsVariableInitialized_3IsVariableInitialized dnn/hiddenlayer_1/weights/part_0*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
6report_uninitialized_variables/IsVariableInitialized_4IsVariableInitializeddnn/hiddenlayer_1/biases/part_0*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
6report_uninitialized_variables/IsVariableInitialized_5IsVariableInitialized dnn/hiddenlayer_2/weights/part_0*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
6report_uninitialized_variables/IsVariableInitialized_6IsVariableInitializeddnn/hiddenlayer_2/biases/part_0*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
6report_uninitialized_variables/IsVariableInitialized_7IsVariableInitializeddnn/logits/weights/part_0*
dtype0*
_output_shapes
: *,
_class"
 loc:@dnn/logits/weights/part_0
�
6report_uninitialized_variables/IsVariableInitialized_8IsVariableInitializeddnn/logits/biases/part_0*
dtype0*
_output_shapes
: *+
_class!
loc:@dnn/logits/biases/part_0
�
6report_uninitialized_variables/IsVariableInitialized_9IsVariableInitialized%dnn/regression_head/dnn/learning_rate*
dtype0*
_output_shapes
: *8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
�
7report_uninitialized_variables/IsVariableInitialized_10IsVariableInitialized@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_11IsVariableInitialized?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
7report_uninitialized_variables/IsVariableInitialized_12IsVariableInitialized@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_13IsVariableInitialized?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
7report_uninitialized_variables/IsVariableInitialized_14IsVariableInitialized@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_15IsVariableInitialized?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
7report_uninitialized_variables/IsVariableInitialized_16IsVariableInitialized9dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad*
dtype0*
_output_shapes
: *,
_class"
 loc:@dnn/logits/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_17IsVariableInitialized8dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad*
dtype0*
_output_shapes
: *+
_class!
loc:@dnn/logits/biases/part_0
�
7report_uninitialized_variables/IsVariableInitialized_18IsVariableInitialized&dnn/regression_head/metrics/mean/total*
dtype0*
_output_shapes
: *9
_class/
-+loc:@dnn/regression_head/metrics/mean/total
�
7report_uninitialized_variables/IsVariableInitialized_19IsVariableInitialized&dnn/regression_head/metrics/mean/count*
dtype0*
_output_shapes
: *9
_class/
-+loc:@dnn/regression_head/metrics/mean/count
�	
$report_uninitialized_variables/stackPack4report_uninitialized_variables/IsVariableInitialized6report_uninitialized_variables/IsVariableInitialized_16report_uninitialized_variables/IsVariableInitialized_26report_uninitialized_variables/IsVariableInitialized_36report_uninitialized_variables/IsVariableInitialized_46report_uninitialized_variables/IsVariableInitialized_56report_uninitialized_variables/IsVariableInitialized_66report_uninitialized_variables/IsVariableInitialized_76report_uninitialized_variables/IsVariableInitialized_86report_uninitialized_variables/IsVariableInitialized_97report_uninitialized_variables/IsVariableInitialized_107report_uninitialized_variables/IsVariableInitialized_117report_uninitialized_variables/IsVariableInitialized_127report_uninitialized_variables/IsVariableInitialized_137report_uninitialized_variables/IsVariableInitialized_147report_uninitialized_variables/IsVariableInitialized_157report_uninitialized_variables/IsVariableInitialized_167report_uninitialized_variables/IsVariableInitialized_177report_uninitialized_variables/IsVariableInitialized_187report_uninitialized_variables/IsVariableInitialized_19*
T0
*
_output_shapes
:*
N*

axis 
y
)report_uninitialized_variables/LogicalNot
LogicalNot$report_uninitialized_variables/stack*
_output_shapes
:
�
$report_uninitialized_variables/ConstConst*
dtype0*
_output_shapes
:*�
value�B�Bglobal_stepB dnn/hiddenlayer_0/weights/part_0Bdnn/hiddenlayer_0/biases/part_0B dnn/hiddenlayer_1/weights/part_0Bdnn/hiddenlayer_1/biases/part_0B dnn/hiddenlayer_2/weights/part_0Bdnn/hiddenlayer_2/biases/part_0Bdnn/logits/weights/part_0Bdnn/logits/biases/part_0B%dnn/regression_head/dnn/learning_rateB@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/AdagradB?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/AdagradB@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/AdagradB?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/AdagradB@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/AdagradB?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/AdagradB9dnn/regression_head/dnn/dnn/logits/weights/part_0/AdagradB8dnn/regression_head/dnn/dnn/logits/biases/part_0/AdagradB&dnn/regression_head/metrics/mean/totalB&dnn/regression_head/metrics/mean/count
{
1report_uninitialized_variables/boolean_mask/ShapeConst*
dtype0*
_output_shapes
:*
valueB:
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
valueB:
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
:*
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
:*
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
8report_uninitialized_variables_1/IsVariableInitialized_1IsVariableInitialized dnn/hiddenlayer_0/weights/part_0*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_2IsVariableInitializeddnn/hiddenlayer_0/biases/part_0*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_3IsVariableInitialized dnn/hiddenlayer_1/weights/part_0*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_4IsVariableInitializeddnn/hiddenlayer_1/biases/part_0*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_5IsVariableInitialized dnn/hiddenlayer_2/weights/part_0*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_6IsVariableInitializeddnn/hiddenlayer_2/biases/part_0*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_7IsVariableInitializeddnn/logits/weights/part_0*
dtype0*
_output_shapes
: *,
_class"
 loc:@dnn/logits/weights/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_8IsVariableInitializeddnn/logits/biases/part_0*
dtype0*
_output_shapes
: *+
_class!
loc:@dnn/logits/biases/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_9IsVariableInitialized%dnn/regression_head/dnn/learning_rate*
dtype0*
_output_shapes
: *8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
�
9report_uninitialized_variables_1/IsVariableInitialized_10IsVariableInitialized@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_11IsVariableInitialized?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_12IsVariableInitialized@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_13IsVariableInitialized?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_14IsVariableInitialized@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_15IsVariableInitialized?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_16IsVariableInitialized9dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad*
dtype0*
_output_shapes
: *,
_class"
 loc:@dnn/logits/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_17IsVariableInitialized8dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad*
dtype0*
_output_shapes
: *+
_class!
loc:@dnn/logits/biases/part_0
�	
&report_uninitialized_variables_1/stackPack6report_uninitialized_variables_1/IsVariableInitialized8report_uninitialized_variables_1/IsVariableInitialized_18report_uninitialized_variables_1/IsVariableInitialized_28report_uninitialized_variables_1/IsVariableInitialized_38report_uninitialized_variables_1/IsVariableInitialized_48report_uninitialized_variables_1/IsVariableInitialized_58report_uninitialized_variables_1/IsVariableInitialized_68report_uninitialized_variables_1/IsVariableInitialized_78report_uninitialized_variables_1/IsVariableInitialized_88report_uninitialized_variables_1/IsVariableInitialized_99report_uninitialized_variables_1/IsVariableInitialized_109report_uninitialized_variables_1/IsVariableInitialized_119report_uninitialized_variables_1/IsVariableInitialized_129report_uninitialized_variables_1/IsVariableInitialized_139report_uninitialized_variables_1/IsVariableInitialized_149report_uninitialized_variables_1/IsVariableInitialized_159report_uninitialized_variables_1/IsVariableInitialized_169report_uninitialized_variables_1/IsVariableInitialized_17*
T0
*
_output_shapes
:*
N*

axis 
}
+report_uninitialized_variables_1/LogicalNot
LogicalNot&report_uninitialized_variables_1/stack*
_output_shapes
:
�
&report_uninitialized_variables_1/ConstConst*
dtype0*
_output_shapes
:*�
value�B�Bglobal_stepB dnn/hiddenlayer_0/weights/part_0Bdnn/hiddenlayer_0/biases/part_0B dnn/hiddenlayer_1/weights/part_0Bdnn/hiddenlayer_1/biases/part_0B dnn/hiddenlayer_2/weights/part_0Bdnn/hiddenlayer_2/biases/part_0Bdnn/logits/weights/part_0Bdnn/logits/biases/part_0B%dnn/regression_head/dnn/learning_rateB@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/AdagradB?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/AdagradB@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/AdagradB?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/AdagradB@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/AdagradB?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/AdagradB9dnn/regression_head/dnn/dnn/logits/weights/part_0/AdagradB8dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad
}
3report_uninitialized_variables_1/boolean_mask/ShapeConst*
dtype0*
_output_shapes
:*
valueB:
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
valueB:
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
:*
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
:*
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
n
init_2NoOp.^dnn/regression_head/metrics/mean/total/Assign.^dnn/regression_head/metrics/mean/count/Assign
�
init_all_tablesNoOpl^dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table/table_init
/
group_deps_1NoOp^init_2^init_all_tables
�
Merge/MergeSummaryMergeSummarySenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full-dnn/dnn/hiddenlayer_0_fraction_of_zero_values dnn/dnn/hiddenlayer_0_activation-dnn/dnn/hiddenlayer_1_fraction_of_zero_values dnn/dnn/hiddenlayer_1_activation-dnn/dnn/hiddenlayer_2_fraction_of_zero_values dnn/dnn/hiddenlayer_2_activation&dnn/dnn/logits_fraction_of_zero_valuesdnn/dnn/logits_activation!dnn/regression_head/ScalarSummary*
_output_shapes
: *
N

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
value3B1 B+_temp_b90256be6bfe4c959e44e86b3a62b1e9/part
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
�
save/SaveV2/tensor_namesConst*
dtype0*
_output_shapes
:*�
value�B�Bdnn/hiddenlayer_0/biasesB8dnn/hiddenlayer_0/biases/enlayer_0/biases/part_0/AdagradBdnn/hiddenlayer_0/weightsB9dnn/hiddenlayer_0/weights/nlayer_0/weights/part_0/AdagradBdnn/hiddenlayer_1/biasesB8dnn/hiddenlayer_1/biases/enlayer_1/biases/part_0/AdagradBdnn/hiddenlayer_1/weightsB9dnn/hiddenlayer_1/weights/nlayer_1/weights/part_0/AdagradBdnn/hiddenlayer_2/biasesB8dnn/hiddenlayer_2/biases/enlayer_2/biases/part_0/AdagradBdnn/hiddenlayer_2/weightsB9dnn/hiddenlayer_2/weights/nlayer_2/weights/part_0/AdagradBdnn/logits/biasesB1dnn/logits/biases/nn/logits/biases/part_0/AdagradBdnn/logits/weightsB2dnn/logits/weights/n/logits/weights/part_0/AdagradB%dnn/regression_head/dnn/learning_rateBglobal_step
�
save/SaveV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*�
value�B�B50 0,50B50 0,50B56 50 0,56:0,50B56 50 0,56:0,50B30 0,30B30 0,30B50 30 0,50:0,30B50 30 0,50:0,30B10 0,10B10 0,10B30 10 0,30:0,10B30 10 0,30:0,10B1 0,1B1 0,1B10 1 0,10:0,1B10 1 0,10:0,1B B 
�
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slices$dnn/hiddenlayer_0/biases/part_0/readDdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/read%dnn/hiddenlayer_0/weights/part_0/readEdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/read$dnn/hiddenlayer_1/biases/part_0/readDdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/read%dnn/hiddenlayer_1/weights/part_0/readEdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/read$dnn/hiddenlayer_2/biases/part_0/readDdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/read%dnn/hiddenlayer_2/weights/part_0/readEdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/readdnn/logits/biases/part_0/read=dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/readdnn/logits/weights/part_0/read>dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/read%dnn/regression_head/dnn/learning_rateglobal_step* 
dtypes
2	
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
|
save/RestoreV2/tensor_namesConst*
dtype0*
_output_shapes
:*-
value$B"Bdnn/hiddenlayer_0/biases
o
save/RestoreV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB50 0,50
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/AssignAssigndnn/hiddenlayer_0/biases/part_0save/RestoreV2*
T0*
_output_shapes
:2*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
save/RestoreV2_1/tensor_namesConst*
dtype0*
_output_shapes
:*M
valueDBBB8dnn/hiddenlayer_0/biases/enlayer_0/biases/part_0/Adagrad
q
!save/RestoreV2_1/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB50 0,50
�
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_1Assign?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagradsave/RestoreV2_1*
T0*
_output_shapes
:2*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0

save/RestoreV2_2/tensor_namesConst*
dtype0*
_output_shapes
:*.
value%B#Bdnn/hiddenlayer_0/weights
y
!save/RestoreV2_2/shape_and_slicesConst*
dtype0*
_output_shapes
:*$
valueBB56 50 0,56:0,50
�
save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_2Assign dnn/hiddenlayer_0/weights/part_0save/RestoreV2_2*
T0*
_output_shapes

:82*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
save/RestoreV2_3/tensor_namesConst*
dtype0*
_output_shapes
:*N
valueEBCB9dnn/hiddenlayer_0/weights/nlayer_0/weights/part_0/Adagrad
y
!save/RestoreV2_3/shape_and_slicesConst*
dtype0*
_output_shapes
:*$
valueBB56 50 0,56:0,50
�
save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_3Assign@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagradsave/RestoreV2_3*
T0*
_output_shapes

:82*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
~
save/RestoreV2_4/tensor_namesConst*
dtype0*
_output_shapes
:*-
value$B"Bdnn/hiddenlayer_1/biases
q
!save/RestoreV2_4/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB30 0,30
�
save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_4Assigndnn/hiddenlayer_1/biases/part_0save/RestoreV2_4*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
save/RestoreV2_5/tensor_namesConst*
dtype0*
_output_shapes
:*M
valueDBBB8dnn/hiddenlayer_1/biases/enlayer_1/biases/part_0/Adagrad
q
!save/RestoreV2_5/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB30 0,30
�
save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_5Assign?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagradsave/RestoreV2_5*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0

save/RestoreV2_6/tensor_namesConst*
dtype0*
_output_shapes
:*.
value%B#Bdnn/hiddenlayer_1/weights
y
!save/RestoreV2_6/shape_and_slicesConst*
dtype0*
_output_shapes
:*$
valueBB50 30 0,50:0,30
�
save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_6Assign dnn/hiddenlayer_1/weights/part_0save/RestoreV2_6*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
save/RestoreV2_7/tensor_namesConst*
dtype0*
_output_shapes
:*N
valueEBCB9dnn/hiddenlayer_1/weights/nlayer_1/weights/part_0/Adagrad
y
!save/RestoreV2_7/shape_and_slicesConst*
dtype0*
_output_shapes
:*$
valueBB50 30 0,50:0,30
�
save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_7Assign@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagradsave/RestoreV2_7*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
~
save/RestoreV2_8/tensor_namesConst*
dtype0*
_output_shapes
:*-
value$B"Bdnn/hiddenlayer_2/biases
q
!save/RestoreV2_8/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB10 0,10
�
save/RestoreV2_8	RestoreV2
save/Constsave/RestoreV2_8/tensor_names!save/RestoreV2_8/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_8Assigndnn/hiddenlayer_2/biases/part_0save/RestoreV2_8*
T0*
_output_shapes
:
*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
save/RestoreV2_9/tensor_namesConst*
dtype0*
_output_shapes
:*M
valueDBBB8dnn/hiddenlayer_2/biases/enlayer_2/biases/part_0/Adagrad
q
!save/RestoreV2_9/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB10 0,10
�
save/RestoreV2_9	RestoreV2
save/Constsave/RestoreV2_9/tensor_names!save/RestoreV2_9/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_9Assign?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagradsave/RestoreV2_9*
T0*
_output_shapes
:
*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
save/RestoreV2_10/tensor_namesConst*
dtype0*
_output_shapes
:*.
value%B#Bdnn/hiddenlayer_2/weights
z
"save/RestoreV2_10/shape_and_slicesConst*
dtype0*
_output_shapes
:*$
valueBB30 10 0,30:0,10
�
save/RestoreV2_10	RestoreV2
save/Constsave/RestoreV2_10/tensor_names"save/RestoreV2_10/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_10Assign dnn/hiddenlayer_2/weights/part_0save/RestoreV2_10*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
save/RestoreV2_11/tensor_namesConst*
dtype0*
_output_shapes
:*N
valueEBCB9dnn/hiddenlayer_2/weights/nlayer_2/weights/part_0/Adagrad
z
"save/RestoreV2_11/shape_and_slicesConst*
dtype0*
_output_shapes
:*$
valueBB30 10 0,30:0,10
�
save/RestoreV2_11	RestoreV2
save/Constsave/RestoreV2_11/tensor_names"save/RestoreV2_11/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_11Assign@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagradsave/RestoreV2_11*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
x
save/RestoreV2_12/tensor_namesConst*
dtype0*
_output_shapes
:*&
valueBBdnn/logits/biases
p
"save/RestoreV2_12/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB1 0,1
�
save/RestoreV2_12	RestoreV2
save/Constsave/RestoreV2_12/tensor_names"save/RestoreV2_12/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_12Assigndnn/logits/biases/part_0save/RestoreV2_12*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*+
_class!
loc:@dnn/logits/biases/part_0
�
save/RestoreV2_13/tensor_namesConst*
dtype0*
_output_shapes
:*F
value=B;B1dnn/logits/biases/nn/logits/biases/part_0/Adagrad
p
"save/RestoreV2_13/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB1 0,1
�
save/RestoreV2_13	RestoreV2
save/Constsave/RestoreV2_13/tensor_names"save/RestoreV2_13/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_13Assign8dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagradsave/RestoreV2_13*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*+
_class!
loc:@dnn/logits/biases/part_0
y
save/RestoreV2_14/tensor_namesConst*
dtype0*
_output_shapes
:*'
valueBBdnn/logits/weights
x
"save/RestoreV2_14/shape_and_slicesConst*
dtype0*
_output_shapes
:*"
valueBB10 1 0,10:0,1
�
save/RestoreV2_14	RestoreV2
save/Constsave/RestoreV2_14/tensor_names"save/RestoreV2_14/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_14Assigndnn/logits/weights/part_0save/RestoreV2_14*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*,
_class"
 loc:@dnn/logits/weights/part_0
�
save/RestoreV2_15/tensor_namesConst*
dtype0*
_output_shapes
:*G
value>B<B2dnn/logits/weights/n/logits/weights/part_0/Adagrad
x
"save/RestoreV2_15/shape_and_slicesConst*
dtype0*
_output_shapes
:*"
valueBB10 1 0,10:0,1
�
save/RestoreV2_15	RestoreV2
save/Constsave/RestoreV2_15/tensor_names"save/RestoreV2_15/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_15Assign9dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagradsave/RestoreV2_15*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*,
_class"
 loc:@dnn/logits/weights/part_0
�
save/RestoreV2_16/tensor_namesConst*
dtype0*
_output_shapes
:*:
value1B/B%dnn/regression_head/dnn/learning_rate
k
"save/RestoreV2_16/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
�
save/RestoreV2_16	RestoreV2
save/Constsave/RestoreV2_16/tensor_names"save/RestoreV2_16/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_16Assign%dnn/regression_head/dnn/learning_ratesave/RestoreV2_16*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
r
save/RestoreV2_17/tensor_namesConst*
dtype0*
_output_shapes
:* 
valueBBglobal_step
k
"save/RestoreV2_17/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
�
save/RestoreV2_17	RestoreV2
save/Constsave/RestoreV2_17/tensor_names"save/RestoreV2_17/shape_and_slices*
_output_shapes
:*
dtypes
2	
�
save/Assign_17Assignglobal_stepsave/RestoreV2_17*
T0	*
_output_shapes
: *
validate_shape(*
use_locking(*
_class
loc:@global_step
�
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17
-
save/restore_allNoOp^save/restore_shard"�~��Y     �~V	���P�AJ��	
�0�/
9
Add
x"T
y"T
z"T"
Ttype:
2	
�
ApplyAdagrad
var"T�
accum"T�
lr"T	
grad"T
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
A
Equal
x"T
y"T
z
"
Ttype:
2	
�
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
�
	HashTable
table_handle�"
	containerstring "
shared_namestring "!
use_node_name_sharingbool( "
	key_dtypetype"
value_dtypetype�
S
HistogramSummary
tag
values"T
summary"
Ttype0:
2		
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
�
OneHot
indices"TI	
depth
on_value"T
	off_value"T
output"T"
axisint���������"	
Ttype"
TItype0	:
2	
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
}
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	�
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
A
Relu
features"T
activations"T"
Ttype:
2		
S
ReluGrad
	gradients"T
features"T
	backprops"T"
Ttype:
2		
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
H
ShardedFilename
basename	
shard

num_shards
filename
h
SparseReshape
input_indices	
input_shape	
	new_shape	
output_indices	
output_shape	
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
Unpack

value"T
output"T*num"
numint("	
Ttype"
axisint 
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
index	*	1.2.0-rc12v1.2.0-rc0-24-g94484aa��
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
�
Vdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Rdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:4Vdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/CastCast`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Shape*

SrcT0*
_output_shapes
:*

DstT0	
�
cdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
cdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/NotEqualNotEqualRdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dimscdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Cast_1/x*
T0*
_output_shapes

:@
�
`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/WhereWherecdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/NotEqual*'
_output_shapes
:���������
�
hdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
bdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/ReshapeReshapeRdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/expand_dimshdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
ndnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
hdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_sliceStridedSlice`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Wherendnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stackpdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stack_1pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice/stack_2*
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
pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
rdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
rdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1StridedSlice`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Wherepdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stackrdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stack_1rdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
bdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/unstackUnpack_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/stackPackddnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/MulMuljdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice_1`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/stack*
T0	*'
_output_shapes
:���������
�
pdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/SumSum^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Mulpdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/AddAddhdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/strided_slice^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Sum*
T0	*#
_output_shapes
:���������
�
adnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/GatherGatherbdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Reshape^dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
�
Mdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/lookupStringToHashBucketFastadnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Gather*
num_buckets2*#
_output_shapes
:���������
�
gdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
idnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
idnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
adnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_sliceStridedSlice_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Castgdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stackidnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stack_1idnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*
_output_shapes
:*

begin_mask*
Index0
�
idnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
kdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
kdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
cdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1StridedSlice_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Castidnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stackkdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stack_1kdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*
_output_shapes
:*

begin_mask *
Index0
�
Ydnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
Xdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/ProdProdcdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slice_1Ydnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
�
cdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat/values_1PackXdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/Prod*
T0	*
_output_shapes
:*
N*

axis 
�
_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
Zdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concatConcatV2adnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/strided_slicecdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat/values_1_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat/axis*

Tidx0*
T0	*
_output_shapes
:*
N
�
adnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshapeSparseReshape`dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/Where_dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/DenseToSparseTensor/CastZdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/concat*-
_output_shapes
:���������:
�
jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshape/IdentityIdentityMdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/lookup*
T0	*#
_output_shapes
:���������
�
bdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SparseToDense/default_valueConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
Tdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SparseToDenseSparseToDenseadnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshapecdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshape:1jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/InnerFlatten/SparseReshape/Identitybdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SparseToDense/default_value*
T0	*0
_output_shapes
:������������������*
validate_indices(*
Tindices0	
�
Tdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
Vdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/Const_1Const*
dtype0*
_output_shapes
: *
valueB
 *    
�
Tdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/depthConst*
dtype0*
_output_shapes
: *
value	B :2
�
Wdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/on_valueConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
Xdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/off_valueConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
Ndnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hotOneHotTdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SparseToDenseTdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/depthWdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/on_valueXdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot/off_value*
axis���������*
TI0	*4
_output_shapes"
 :������������������2*
T0
�
\dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
Jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SumSumNdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/one_hot\dnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/Sum/reduction_indices*

Tidx0*
T0*'
_output_shapes
:���������2*
	keep_dims( 
�
^dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:1^dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
hdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
gdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/CastCasthdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Shape*

SrcT0*
_output_shapes
:*

DstT0	
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Cast_1/xConst*
dtype0*
_output_shapes
: *
valueB B 
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/NotEqualNotEqualZdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dimskdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Cast_1/x*
T0*
_output_shapes

:@
�
hdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/WhereWherekdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/NotEqual*'
_output_shapes
:���������
�
pdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
���������
�
jdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/ReshapeReshapeZdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/expand_dimspdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Reshape/shape*
T0*
_output_shapes
:@*
Tshape0
�
vdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB"       
�
xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
pdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_sliceStridedSlicehdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Wherevdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stackxdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stack_1xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice/stack_2*
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
xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB"        
�
zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB"       
�
zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB"      
�
rdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1StridedSlicehdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Wherexdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stackzdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stack_1zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*'
_output_shapes
:���������*

begin_mask*
Index0
�
jdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/unstackUnpackgdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Cast*
T0	*	
num*
_output_shapes
: : *

axis 
�
hdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/stackPackldnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/unstack:1*
T0	*
_output_shapes
:*
N*

axis 
�
fdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/MulMulrdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slice_1hdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/stack*
T0	*'
_output_shapes
:���������
�
xdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
fdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/SumSumfdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Mulxdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Sum/reduction_indices*

Tidx0*
T0	*#
_output_shapes
:���������*
	keep_dims( 
�
fdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/AddAddpdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/strided_slicefdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Sum*
T0	*#
_output_shapes
:���������
�
idnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/GatherGatherjdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Reshapefdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Add*#
_output_shapes
:���������*
validate_indices(*
Tparams0*
Tindices0	
�
[dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/ConstConst*
dtype0*
_output_shapes
:*
valueBBtwoBfour
�
Zdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/SizeConst*
dtype0*
_output_shapes
: *
value	B :
�
adnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
�
adnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
�
[dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/rangeRangeadnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range/startZdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/Sizeadnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range/delta*

Tidx0*
_output_shapes
:
�
]dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/ToInt64Cast[dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/range*

SrcT0*
_output_shapes
:*

DstT0	
�
`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table	HashTable*
	container *
	key_dtype0*
use_node_name_sharing( *
_output_shapes
:*
shared_name *
value_dtype0	
�
fdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table/ConstConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table/table_initInitializeTable`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table[dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/Const]dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/ToInt64*

Tval0	*

Tkey0*s
_classi
geloc:@dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table
�
`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/hash_table_LookupLookupTableFind`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_tableidnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Gatherfdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table/Const*#
_output_shapes
:���������*

Tout0	*	
Tin0*s
_classi
geloc:@dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table
�
odnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
�
qdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
�
qdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
idnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_sliceStridedSlicegdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Castodnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stackqdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stack_1qdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice/stack_2*
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*
_output_shapes
:*

begin_mask*
Index0
�
qdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
�
sdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
sdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1StridedSlicegdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Castqdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stacksdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stack_1sdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1/stack_2*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask *
T0	*
_output_shapes
:*

begin_mask *
Index0
�
adnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/ProdProdkdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slice_1adnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/Const*

Tidx0*
T0	*
_output_shapes
: *
	keep_dims( 
�
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat/values_1Pack`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/Prod*
T0	*
_output_shapes
:*
N*

axis 
�
gdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
�
bdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concatConcatV2idnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/strided_slicekdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat/values_1gdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat/axis*

Tidx0*
T0	*
_output_shapes
:*
N
�
idnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshapeSparseReshapehdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Wheregdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/DenseToSparseTensor/Castbdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/concat*-
_output_shapes
:���������:
�
rdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshape/IdentityIdentity`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/hash_table_Lookup*
T0	*#
_output_shapes
:���������
�
jdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SparseToDense/default_valueConst*
dtype0	*
_output_shapes
: *
valueB	 R
���������
�
\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SparseToDenseSparseToDenseidnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshapekdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshape:1rdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/InnerFlatten/SparseReshape/Identityjdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SparseToDense/default_value*
T0	*0
_output_shapes
:������������������*
validate_indices(*
Tindices0	
�
\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
^dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/Const_1Const*
dtype0*
_output_shapes
: *
valueB
 *    
�
\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/depthConst*
dtype0*
_output_shapes
: *
value	B :
�
_dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/on_valueConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/off_valueConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
Vdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hotOneHot\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SparseToDense\dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/depth_dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/on_value`dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hot/off_value*
axis���������*
TI0	*4
_output_shapes"
 :������������������*
T0
�
ddnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/Sum/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
�
Rdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SumSumVdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/one_hotddnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/Sum/reduction_indices*

Tidx0*
T0*'
_output_shapes
:���������*
	keep_dims( 
�
Pdnn/input_from_feature_columns/input_from_feature_columns/height/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Ldnn/input_from_feature_columns/input_from_feature_columns/height/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:6Pdnn/input_from_feature_columns/input_from_feature_columns/height/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
Tdnn/input_from_feature_columns/input_from_feature_columns/horsepower/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Pdnn/input_from_feature_columns/input_from_feature_columns/horsepower/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:3Tdnn/input_from_feature_columns/input_from_feature_columns/horsepower/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
Pdnn/input_from_feature_columns/input_from_feature_columns/length/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Ldnn/input_from_feature_columns/input_from_feature_columns/length/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:5Pdnn/input_from_feature_columns/input_from_feature_columns/length/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
Odnn/input_from_feature_columns/input_from_feature_columns/width/expand_dims/dimConst*
dtype0*
_output_shapes
: *
valueB :
���������
�
Kdnn/input_from_feature_columns/input_from_feature_columns/width/expand_dims
ExpandDims"random_shuffle_queue_DequeueMany:7Odnn/input_from_feature_columns/input_from_feature_columns/width/expand_dims/dim*
T0*
_output_shapes

:@*

Tdim0
�
Ednn/input_from_feature_columns/input_from_feature_columns/concat/axisConst*
dtype0*
_output_shapes
: *
value	B :
�
@dnn/input_from_feature_columns/input_from_feature_columns/concatConcatV2Jdnn/input_from_feature_columns/input_from_feature_columns/make_one_hot/SumRdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/SumLdnn/input_from_feature_columns/input_from_feature_columns/height/expand_dimsPdnn/input_from_feature_columns/input_from_feature_columns/horsepower/expand_dimsLdnn/input_from_feature_columns/input_from_feature_columns/length/expand_dimsKdnn/input_from_feature_columns/input_from_feature_columns/width/expand_dimsEdnn/input_from_feature_columns/input_from_feature_columns/concat/axis*

Tidx0*
T0*
_output_shapes

:@8*
N
�
Adnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"8   2   *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *�s�*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *�s>*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
Idnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/shape*
seed2 *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
dtype0*
T0*
_output_shapes

:82*

seed 
�
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/sub*
T0*
_output_shapes

:82*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
;dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes

:82*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
 dnn/hiddenlayer_0/weights/part_0
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
dtype0*
_output_shapes

:82*
shape
:82*
shared_name 
�
'dnn/hiddenlayer_0/weights/part_0/AssignAssign dnn/hiddenlayer_0/weights/part_0;dnn/hiddenlayer_0/weights/part_0/Initializer/random_uniform*
T0*
_output_shapes

:82*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
%dnn/hiddenlayer_0/weights/part_0/readIdentity dnn/hiddenlayer_0/weights/part_0*
T0*
_output_shapes

:82*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
1dnn/hiddenlayer_0/biases/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:2*
valueB2*    *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
dnn/hiddenlayer_0/biases/part_0
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
dtype0*
_output_shapes
:2*
shape:2*
shared_name 
�
&dnn/hiddenlayer_0/biases/part_0/AssignAssigndnn/hiddenlayer_0/biases/part_01dnn/hiddenlayer_0/biases/part_0/Initializer/zeros*
T0*
_output_shapes
:2*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
$dnn/hiddenlayer_0/biases/part_0/readIdentitydnn/hiddenlayer_0/biases/part_0*
T0*
_output_shapes
:2*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
u
dnn/hiddenlayer_0/weightsIdentity%dnn/hiddenlayer_0/weights/part_0/read*
T0*
_output_shapes

:82
�
dnn/hiddenlayer_0/MatMulMatMul@dnn/input_from_feature_columns/input_from_feature_columns/concatdnn/hiddenlayer_0/weights*
T0*
_output_shapes

:@2*
transpose_a( *
transpose_b( 
o
dnn/hiddenlayer_0/biasesIdentity$dnn/hiddenlayer_0/biases/part_0/read*
T0*
_output_shapes
:2
�
dnn/hiddenlayer_0/BiasAddBiasAdddnn/hiddenlayer_0/MatMuldnn/hiddenlayer_0/biases*
T0*
_output_shapes

:@2*
data_formatNHWC
p
$dnn/hiddenlayer_0/hiddenlayer_0/ReluReludnn/hiddenlayer_0/BiasAdd*
T0*
_output_shapes

:@2
[
dnn/zero_fraction/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
dnn/zero_fraction/EqualEqual$dnn/hiddenlayer_0/hiddenlayer_0/Reludnn/zero_fraction/zero*
T0*
_output_shapes

:@2
o
dnn/zero_fraction/CastCastdnn/zero_fraction/Equal*

SrcT0
*
_output_shapes

:@2*

DstT0
h
dnn/zero_fraction/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
dnn/zero_fraction/MeanMeandnn/zero_fraction/Castdnn/zero_fraction/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
2dnn/dnn/hiddenlayer_0_fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *>
value5B3 B-dnn/dnn/hiddenlayer_0_fraction_of_zero_values
�
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_0_fraction_of_zero_values/tagsdnn/zero_fraction/Mean*
T0*
_output_shapes
: 
�
$dnn/dnn/hiddenlayer_0_activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_0_activation
�
 dnn/dnn/hiddenlayer_0_activationHistogramSummary$dnn/dnn/hiddenlayer_0_activation/tag$dnn/hiddenlayer_0/hiddenlayer_0/Relu*
T0*
_output_shapes
: 
�
Adnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"2      *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *�7��*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *�7�>*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
Idnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/shape*
seed2 *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
dtype0*
T0*
_output_shapes

:2*

seed 
�
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/sub*
T0*
_output_shapes

:2*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
;dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes

:2*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
 dnn/hiddenlayer_1/weights/part_0
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
'dnn/hiddenlayer_1/weights/part_0/AssignAssign dnn/hiddenlayer_1/weights/part_0;dnn/hiddenlayer_1/weights/part_0/Initializer/random_uniform*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
%dnn/hiddenlayer_1/weights/part_0/readIdentity dnn/hiddenlayer_1/weights/part_0*
T0*
_output_shapes

:2*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
1dnn/hiddenlayer_1/biases/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
dnn/hiddenlayer_1/biases/part_0
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
&dnn/hiddenlayer_1/biases/part_0/AssignAssigndnn/hiddenlayer_1/biases/part_01dnn/hiddenlayer_1/biases/part_0/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
$dnn/hiddenlayer_1/biases/part_0/readIdentitydnn/hiddenlayer_1/biases/part_0*
T0*
_output_shapes
:*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
u
dnn/hiddenlayer_1/weightsIdentity%dnn/hiddenlayer_1/weights/part_0/read*
T0*
_output_shapes

:2
�
dnn/hiddenlayer_1/MatMulMatMul$dnn/hiddenlayer_0/hiddenlayer_0/Reludnn/hiddenlayer_1/weights*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
o
dnn/hiddenlayer_1/biasesIdentity$dnn/hiddenlayer_1/biases/part_0/read*
T0*
_output_shapes
:
�
dnn/hiddenlayer_1/BiasAddBiasAdddnn/hiddenlayer_1/MatMuldnn/hiddenlayer_1/biases*
T0*
_output_shapes

:@*
data_formatNHWC
p
$dnn/hiddenlayer_1/hiddenlayer_1/ReluReludnn/hiddenlayer_1/BiasAdd*
T0*
_output_shapes

:@
]
dnn/zero_fraction_1/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
dnn/zero_fraction_1/EqualEqual$dnn/hiddenlayer_1/hiddenlayer_1/Reludnn/zero_fraction_1/zero*
T0*
_output_shapes

:@
s
dnn/zero_fraction_1/CastCastdnn/zero_fraction_1/Equal*

SrcT0
*
_output_shapes

:@*

DstT0
j
dnn/zero_fraction_1/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
dnn/zero_fraction_1/MeanMeandnn/zero_fraction_1/Castdnn/zero_fraction_1/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
2dnn/dnn/hiddenlayer_1_fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *>
value5B3 B-dnn/dnn/hiddenlayer_1_fraction_of_zero_values
�
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_1_fraction_of_zero_values/tagsdnn/zero_fraction_1/Mean*
T0*
_output_shapes
: 
�
$dnn/dnn/hiddenlayer_1_activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_1_activation
�
 dnn/dnn/hiddenlayer_1_activationHistogramSummary$dnn/dnn/hiddenlayer_1_activation/tag$dnn/hiddenlayer_1/hiddenlayer_1/Relu*
T0*
_output_shapes
: 
�
Adnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"   
   *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *�Kƾ*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *�K�>*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
Idnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniformAdnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/shape*
seed2 *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
dtype0*
T0*
_output_shapes

:
*

seed 
�
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/subSub?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/max?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/mulMulIdnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/RandomUniform?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/sub*
T0*
_output_shapes

:
*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
;dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniformAdd?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/mul?dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes

:
*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
 dnn/hiddenlayer_2/weights/part_0
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
dtype0*
_output_shapes

:
*
shape
:
*
shared_name 
�
'dnn/hiddenlayer_2/weights/part_0/AssignAssign dnn/hiddenlayer_2/weights/part_0;dnn/hiddenlayer_2/weights/part_0/Initializer/random_uniform*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
%dnn/hiddenlayer_2/weights/part_0/readIdentity dnn/hiddenlayer_2/weights/part_0*
T0*
_output_shapes

:
*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
1dnn/hiddenlayer_2/biases/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:
*
valueB
*    *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
dnn/hiddenlayer_2/biases/part_0
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
dtype0*
_output_shapes
:
*
shape:
*
shared_name 
�
&dnn/hiddenlayer_2/biases/part_0/AssignAssigndnn/hiddenlayer_2/biases/part_01dnn/hiddenlayer_2/biases/part_0/Initializer/zeros*
T0*
_output_shapes
:
*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
$dnn/hiddenlayer_2/biases/part_0/readIdentitydnn/hiddenlayer_2/biases/part_0*
T0*
_output_shapes
:
*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
u
dnn/hiddenlayer_2/weightsIdentity%dnn/hiddenlayer_2/weights/part_0/read*
T0*
_output_shapes

:

�
dnn/hiddenlayer_2/MatMulMatMul$dnn/hiddenlayer_1/hiddenlayer_1/Reludnn/hiddenlayer_2/weights*
T0*
_output_shapes

:@
*
transpose_a( *
transpose_b( 
o
dnn/hiddenlayer_2/biasesIdentity$dnn/hiddenlayer_2/biases/part_0/read*
T0*
_output_shapes
:

�
dnn/hiddenlayer_2/BiasAddBiasAdddnn/hiddenlayer_2/MatMuldnn/hiddenlayer_2/biases*
T0*
_output_shapes

:@
*
data_formatNHWC
p
$dnn/hiddenlayer_2/hiddenlayer_2/ReluReludnn/hiddenlayer_2/BiasAdd*
T0*
_output_shapes

:@

]
dnn/zero_fraction_2/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
dnn/zero_fraction_2/EqualEqual$dnn/hiddenlayer_2/hiddenlayer_2/Reludnn/zero_fraction_2/zero*
T0*
_output_shapes

:@

s
dnn/zero_fraction_2/CastCastdnn/zero_fraction_2/Equal*

SrcT0
*
_output_shapes

:@
*

DstT0
j
dnn/zero_fraction_2/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
dnn/zero_fraction_2/MeanMeandnn/zero_fraction_2/Castdnn/zero_fraction_2/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
2dnn/dnn/hiddenlayer_2_fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *>
value5B3 B-dnn/dnn/hiddenlayer_2_fraction_of_zero_values
�
-dnn/dnn/hiddenlayer_2_fraction_of_zero_valuesScalarSummary2dnn/dnn/hiddenlayer_2_fraction_of_zero_values/tagsdnn/zero_fraction_2/Mean*
T0*
_output_shapes
: 
�
$dnn/dnn/hiddenlayer_2_activation/tagConst*
dtype0*
_output_shapes
: *1
value(B& B dnn/dnn/hiddenlayer_2_activation
�
 dnn/dnn/hiddenlayer_2_activationHistogramSummary$dnn/dnn/hiddenlayer_2_activation/tag$dnn/hiddenlayer_2/hiddenlayer_2/Relu*
T0*
_output_shapes
: 
�
:dnn/logits/weights/part_0/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"
      *,
_class"
 loc:@dnn/logits/weights/part_0
�
8dnn/logits/weights/part_0/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *�=�*,
_class"
 loc:@dnn/logits/weights/part_0
�
8dnn/logits/weights/part_0/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *�=?*,
_class"
 loc:@dnn/logits/weights/part_0
�
Bdnn/logits/weights/part_0/Initializer/random_uniform/RandomUniformRandomUniform:dnn/logits/weights/part_0/Initializer/random_uniform/shape*
seed2 *,
_class"
 loc:@dnn/logits/weights/part_0*
dtype0*
T0*
_output_shapes

:
*

seed 
�
8dnn/logits/weights/part_0/Initializer/random_uniform/subSub8dnn/logits/weights/part_0/Initializer/random_uniform/max8dnn/logits/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes
: *,
_class"
 loc:@dnn/logits/weights/part_0
�
8dnn/logits/weights/part_0/Initializer/random_uniform/mulMulBdnn/logits/weights/part_0/Initializer/random_uniform/RandomUniform8dnn/logits/weights/part_0/Initializer/random_uniform/sub*
T0*
_output_shapes

:
*,
_class"
 loc:@dnn/logits/weights/part_0
�
4dnn/logits/weights/part_0/Initializer/random_uniformAdd8dnn/logits/weights/part_0/Initializer/random_uniform/mul8dnn/logits/weights/part_0/Initializer/random_uniform/min*
T0*
_output_shapes

:
*,
_class"
 loc:@dnn/logits/weights/part_0
�
dnn/logits/weights/part_0
VariableV2*
	container *,
_class"
 loc:@dnn/logits/weights/part_0*
dtype0*
_output_shapes

:
*
shape
:
*
shared_name 
�
 dnn/logits/weights/part_0/AssignAssigndnn/logits/weights/part_04dnn/logits/weights/part_0/Initializer/random_uniform*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*,
_class"
 loc:@dnn/logits/weights/part_0
�
dnn/logits/weights/part_0/readIdentitydnn/logits/weights/part_0*
T0*
_output_shapes

:
*,
_class"
 loc:@dnn/logits/weights/part_0
�
*dnn/logits/biases/part_0/Initializer/zerosConst*
dtype0*
_output_shapes
:*
valueB*    *+
_class!
loc:@dnn/logits/biases/part_0
�
dnn/logits/biases/part_0
VariableV2*
	container *+
_class!
loc:@dnn/logits/biases/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
dnn/logits/biases/part_0/AssignAssigndnn/logits/biases/part_0*dnn/logits/biases/part_0/Initializer/zeros*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*+
_class!
loc:@dnn/logits/biases/part_0
�
dnn/logits/biases/part_0/readIdentitydnn/logits/biases/part_0*
T0*
_output_shapes
:*+
_class!
loc:@dnn/logits/biases/part_0
g
dnn/logits/weightsIdentitydnn/logits/weights/part_0/read*
T0*
_output_shapes

:

�
dnn/logits/MatMulMatMul$dnn/hiddenlayer_2/hiddenlayer_2/Reludnn/logits/weights*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b( 
a
dnn/logits/biasesIdentitydnn/logits/biases/part_0/read*
T0*
_output_shapes
:
�
dnn/logits/BiasAddBiasAdddnn/logits/MatMuldnn/logits/biases*
T0*
_output_shapes

:@*
data_formatNHWC
]
dnn/zero_fraction_3/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
y
dnn/zero_fraction_3/EqualEqualdnn/logits/BiasAdddnn/zero_fraction_3/zero*
T0*
_output_shapes

:@
s
dnn/zero_fraction_3/CastCastdnn/zero_fraction_3/Equal*

SrcT0
*
_output_shapes

:@*

DstT0
j
dnn/zero_fraction_3/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
dnn/zero_fraction_3/MeanMeandnn/zero_fraction_3/Castdnn/zero_fraction_3/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
+dnn/dnn/logits_fraction_of_zero_values/tagsConst*
dtype0*
_output_shapes
: *7
value.B, B&dnn/dnn/logits_fraction_of_zero_values
�
&dnn/dnn/logits_fraction_of_zero_valuesScalarSummary+dnn/dnn/logits_fraction_of_zero_values/tagsdnn/zero_fraction_3/Mean*
T0*
_output_shapes
: 
w
dnn/dnn/logits_activation/tagConst*
dtype0*
_output_shapes
: **
value!B Bdnn/dnn/logits_activation
�
dnn/dnn/logits_activationHistogramSummarydnn/dnn/logits_activation/tagdnn/logits/BiasAdd*
T0*
_output_shapes
: 
�
&dnn/regression_head/predictions/scoresSqueezednn/logits/BiasAdd*
T0*
_output_shapes
:@*
squeeze_dims

�
(dnn/regression_head/predictions/IdentityIdentity&dnn/regression_head/predictions/scores*
T0*
_output_shapes
:@
~
4dnn/regression_head/mean_squared_loss/ExpandDims/dimConst*
dtype0*
_output_shapes
:*
valueB:
�
0dnn/regression_head/mean_squared_loss/ExpandDims
ExpandDims"random_shuffle_queue_DequeueMany:84dnn/regression_head/mean_squared_loss/ExpandDims/dim*
T0*
_output_shapes

:@*

Tdim0
�
)dnn/regression_head/mean_squared_loss/subSubdnn/logits/BiasAdd0dnn/regression_head/mean_squared_loss/ExpandDims*
T0*
_output_shapes

:@
�
%dnn/regression_head/mean_squared_lossSquare)dnn/regression_head/mean_squared_loss/sub*
T0*
_output_shapes

:@
�
0dnn/regression_head/mean_squared_loss/loss/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
�
*dnn/regression_head/mean_squared_loss/lossMean%dnn/regression_head/mean_squared_loss0dnn/regression_head/mean_squared_loss/loss/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
k
&dnn/regression_head/ScalarSummary/tagsConst*
dtype0*
_output_shapes
: *
valueB
 Bloss
�
!dnn/regression_head/ScalarSummaryScalarSummary&dnn/regression_head/ScalarSummary/tags*dnn/regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: 
j
dnn/regression_head/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
q
'dnn/regression_head/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
s
)dnn/regression_head/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
s
)dnn/regression_head/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
�
!dnn/regression_head/strided_sliceStridedSlicednn/regression_head/Shape'dnn/regression_head/strided_slice/stack)dnn/regression_head/strided_slice/stack_1)dnn/regression_head/strided_slice/stack_2*
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
7dnn/regression_head/dnn/learning_rate/Initializer/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *��L=*8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
�
%dnn/regression_head/dnn/learning_rate
VariableV2*
	container *8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate*
dtype0*
_output_shapes
: *
shape: *
shared_name 
�
,dnn/regression_head/dnn/learning_rate/AssignAssign%dnn/regression_head/dnn/learning_rate7dnn/regression_head/dnn/learning_rate/Initializer/Const*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
�
*dnn/regression_head/dnn/learning_rate/readIdentity%dnn/regression_head/dnn/learning_rate*
T0*
_output_shapes
: *8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
s
0dnn/regression_head/train_op/dnn/gradients/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
u
0dnn/regression_head/train_op/dnn/gradients/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  �?
�
/dnn/regression_head/train_op/dnn/gradients/FillFill0dnn/regression_head/train_op/dnn/gradients/Shape0dnn/regression_head/train_op/dnn/gradients/Const*
T0*
_output_shapes
: 
�
hdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"      
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/ReshapeReshape/dnn/regression_head/train_op/dnn/gradients/Fillhdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Reshape/shape*
T0*
_output_shapes

:*
Tshape0
�
idnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Tile/multiplesConst*
dtype0*
_output_shapes
:*
valueB"@      
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/TileTilebdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Reshapeidnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Tile/multiples*
T0*
_output_shapes

:@*

Tmultiples0
�
`dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Shape_1Const*
dtype0*
_output_shapes
: *
valueB 
�
`dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/ProdProd`dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Shape`dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Const_1Const*
dtype0*
_output_shapes
:*
valueB: 
�
adnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Prod_1Prodbdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Shape_1bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Const_1*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
ddnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Maximum/yConst*
dtype0*
_output_shapes
: *
value	B :
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/MaximumMaximumadnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Prod_1ddnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Maximum/y*
T0*
_output_shapes
: 
�
cdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/floordivFloorDiv_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Prodbdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Maximum*
T0*
_output_shapes
: 
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/CastCastcdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0
�
bdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/truedivRealDiv_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Tile_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/Cast*
T0*
_output_shapes

:@
�
[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul/xConstc^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/truediv*
dtype0*
_output_shapes
: *
valueB
 *   @
�
Ydnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mulMul[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul/x)dnn/regression_head/mean_squared_loss/sub*
T0*
_output_shapes

:@
�
[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul_1Mulbdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/loss_grad/truedivYdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul*
T0*
_output_shapes

:@
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/ShapeConst*
dtype0*
_output_shapes
:*
valueB"@      
�
adnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB"@      
�
odnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgsBroadcastGradientArgs_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shapeadnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
]dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/SumSum[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul_1odnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgs*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
�
adnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/ReshapeReshape]dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Sum_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shape*
T0*
_output_shapes

:@*
Tshape0
�
_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Sum_1Sum[dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss_grad/mul_1qdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/BroadcastGradientArgs:1*

Tidx0*
T0*
_output_shapes
:*
	keep_dims( 
�
]dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/NegNeg_dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Sum_1*
T0*
_output_shapes
:
�
cdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape_1Reshape]dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Negadnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Shape_1*
T0*
_output_shapes

:@*
Tshape0
�
jdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/group_depsNoOpb^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshaped^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape_1
�
rdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependencyIdentityadnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshapek^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/group_deps*
T0*
_output_shapes

:@*t
_classj
hfloc:@dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape
�
tdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependency_1Identitycdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape_1k^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/group_deps*
T0*
_output_shapes

:@*v
_classl
jhloc:@dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape_1
�
Ndnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/BiasAddGradBiasAddGradrdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependency*
T0*
_output_shapes
:*
data_formatNHWC
�
Sdnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/group_depsNoOps^dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependencyO^dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/BiasAddGrad
�
[dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependencyIdentityrdnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/tuple/control_dependencyT^dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes

:@*t
_classj
hfloc:@dnn/regression_head/train_op/dnn/gradients/dnn/regression_head/mean_squared_loss/sub_grad/Reshape
�
]dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependency_1IdentityNdnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/BiasAddGradT^dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:*a
_classW
USloc:@dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/BiasAddGrad
�
Hdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMulMatMul[dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependencydnn/logits/weights*
T0*
_output_shapes

:@
*
transpose_a( *
transpose_b(
�
Jdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul_1MatMul$dnn/hiddenlayer_2/hiddenlayer_2/Relu[dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes

:
*
transpose_a(*
transpose_b( 
�
Rdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/group_depsNoOpI^dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMulK^dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul_1
�
Zdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/control_dependencyIdentityHdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMulS^dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:@
*[
_classQ
OMloc:@dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul
�
\dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/control_dependency_1IdentityJdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul_1S^dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:
*]
_classS
QOloc:@dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/MatMul_1
�
]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGradReluGradZdnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/control_dependency$dnn/hiddenlayer_2/hiddenlayer_2/Relu*
T0*
_output_shapes

:@

�
Udnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/BiasAddGradBiasAddGrad]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGrad*
T0*
_output_shapes
:
*
data_formatNHWC
�
Zdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/group_depsNoOp^^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGradV^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/BiasAddGrad
�
bdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependencyIdentity]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes

:@
*p
_classf
dbloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/hiddenlayer_2/Relu_grad/ReluGrad
�
ddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependency_1IdentityUdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/BiasAddGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:
*h
_class^
\Zloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/BiasAddGrad
�
Odnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMulMatMulbdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependencydnn/hiddenlayer_2/weights*
T0*
_output_shapes

:@*
transpose_a( *
transpose_b(
�
Qdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul_1MatMul$dnn/hiddenlayer_1/hiddenlayer_1/Relubdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes

:
*
transpose_a(*
transpose_b( 
�
Ydnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/group_depsNoOpP^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMulR^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul_1
�
adnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/control_dependencyIdentityOdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMulZ^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:@*b
_classX
VTloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul
�
cdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/control_dependency_1IdentityQdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul_1Z^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:
*d
_classZ
XVloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/MatMul_1
�
]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGradReluGradadnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/control_dependency$dnn/hiddenlayer_1/hiddenlayer_1/Relu*
T0*
_output_shapes

:@
�
Udnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/BiasAddGradBiasAddGrad]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGrad*
T0*
_output_shapes
:*
data_formatNHWC
�
Zdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/group_depsNoOp^^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGradV^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/BiasAddGrad
�
bdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependencyIdentity]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes

:@*p
_classf
dbloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/hiddenlayer_1/Relu_grad/ReluGrad
�
ddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependency_1IdentityUdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/BiasAddGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:*h
_class^
\Zloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/BiasAddGrad
�
Odnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMulMatMulbdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependencydnn/hiddenlayer_1/weights*
T0*
_output_shapes

:@2*
transpose_a( *
transpose_b(
�
Qdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul_1MatMul$dnn/hiddenlayer_0/hiddenlayer_0/Relubdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes

:2*
transpose_a(*
transpose_b( 
�
Ydnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/group_depsNoOpP^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMulR^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul_1
�
adnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/control_dependencyIdentityOdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMulZ^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:@2*b
_classX
VTloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul
�
cdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/control_dependency_1IdentityQdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul_1Z^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:2*d
_classZ
XVloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/MatMul_1
�
]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGradReluGradadnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/control_dependency$dnn/hiddenlayer_0/hiddenlayer_0/Relu*
T0*
_output_shapes

:@2
�
Udnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/BiasAddGradBiasAddGrad]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGrad*
T0*
_output_shapes
:2*
data_formatNHWC
�
Zdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/group_depsNoOp^^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGradV^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/BiasAddGrad
�
bdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependencyIdentity]dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes

:@2*p
_classf
dbloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/hiddenlayer_0/Relu_grad/ReluGrad
�
ddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependency_1IdentityUdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/BiasAddGrad[^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/group_deps*
T0*
_output_shapes
:2*h
_class^
\Zloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/BiasAddGrad
�
Odnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMulMatMulbdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependencydnn/hiddenlayer_0/weights*
T0*
_output_shapes

:@8*
transpose_a( *
transpose_b(
�
Qdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul_1MatMul@dnn/input_from_feature_columns/input_from_feature_columns/concatbdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependency*
T0*
_output_shapes

:82*
transpose_a(*
transpose_b( 
�
Ydnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/group_depsNoOpP^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMulR^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul_1
�
adnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/control_dependencyIdentityOdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMulZ^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:@8*b
_classX
VTloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul
�
cdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/control_dependency_1IdentityQdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul_1Z^dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/group_deps*
T0*
_output_shapes

:82*d
_classZ
XVloc:@dnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/MatMul_1
�
Rdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes

:82*
valueB82*���=*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0*
dtype0*
_output_shapes

:82*
shape
:82*
shared_name 
�
Gdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/AssignAssign@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/AdagradRdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes

:82*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
Ednn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/readIdentity@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad*
T0*
_output_shapes

:82*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
Qdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes
:2*
valueB2*���=*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0*
dtype0*
_output_shapes
:2*
shape:2*
shared_name 
�
Fdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/AssignAssign?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/AdagradQdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes
:2*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
Ddnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/readIdentity?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad*
T0*
_output_shapes
:2*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
Rdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes

:2*
valueB2*���=*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0*
dtype0*
_output_shapes

:2*
shape
:2*
shared_name 
�
Gdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/AssignAssign@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/AdagradRdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
Ednn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/readIdentity@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad*
T0*
_output_shapes

:2*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
Qdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes
:*
valueB*���=*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
Fdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/AssignAssign?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/AdagradQdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
Ddnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/readIdentity?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad*
T0*
_output_shapes
:*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
Rdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes

:
*
valueB
*���=*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad
VariableV2*
	container *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0*
dtype0*
_output_shapes

:
*
shape
:
*
shared_name 
�
Gdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/AssignAssign@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/AdagradRdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
Ednn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/readIdentity@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad*
T0*
_output_shapes

:
*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
Qdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes
:
*
valueB
*���=*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad
VariableV2*
	container *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0*
dtype0*
_output_shapes
:
*
shape:
*
shared_name 
�
Fdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/AssignAssign?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/AdagradQdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes
:
*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
Ddnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/readIdentity?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad*
T0*
_output_shapes
:
*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
Kdnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes

:
*
valueB
*���=*,
_class"
 loc:@dnn/logits/weights/part_0
�
9dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad
VariableV2*
	container *,
_class"
 loc:@dnn/logits/weights/part_0*
dtype0*
_output_shapes

:
*
shape
:
*
shared_name 
�
@dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/AssignAssign9dnn/regression_head/dnn/dnn/logits/weights/part_0/AdagradKdnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*,
_class"
 loc:@dnn/logits/weights/part_0
�
>dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/readIdentity9dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad*
T0*
_output_shapes

:
*,
_class"
 loc:@dnn/logits/weights/part_0
�
Jdnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/Initializer/ConstConst*
dtype0*
_output_shapes
:*
valueB*���=*+
_class!
loc:@dnn/logits/biases/part_0
�
8dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad
VariableV2*
	container *+
_class!
loc:@dnn/logits/biases/part_0*
dtype0*
_output_shapes
:*
shape:*
shared_name 
�
?dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/AssignAssign8dnn/regression_head/dnn/dnn/logits/biases/part_0/AdagradJdnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/Initializer/Const*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*+
_class!
loc:@dnn/logits/biases/part_0
�
=dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/readIdentity8dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad*
T0*
_output_shapes
:*+
_class!
loc:@dnn/logits/biases/part_0
�
[dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_0/weights/part_0/ApplyAdagradApplyAdagrad dnn/hiddenlayer_0/weights/part_0@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readcdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:82*
use_locking( *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
Zdnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_0/biases/part_0/ApplyAdagradApplyAdagraddnn/hiddenlayer_0/biases/part_0?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_0/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:2*
use_locking( *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
[dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_1/weights/part_0/ApplyAdagradApplyAdagrad dnn/hiddenlayer_1/weights/part_0@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readcdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:2*
use_locking( *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
Zdnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_1/biases/part_0/ApplyAdagradApplyAdagraddnn/hiddenlayer_1/biases/part_0?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_1/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:*
use_locking( *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
[dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_2/weights/part_0/ApplyAdagradApplyAdagrad dnn/hiddenlayer_2/weights/part_0@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readcdnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:
*
use_locking( *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
Zdnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_2/biases/part_0/ApplyAdagradApplyAdagraddnn/hiddenlayer_2/biases/part_0?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/readddnn/regression_head/train_op/dnn/gradients/dnn/hiddenlayer_2/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:
*
use_locking( *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
Tdnn/regression_head/train_op/dnn/train/update_dnn/logits/weights/part_0/ApplyAdagradApplyAdagraddnn/logits/weights/part_09dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/read\dnn/regression_head/train_op/dnn/gradients/dnn/logits/MatMul_grad/tuple/control_dependency_1*
T0*
_output_shapes

:
*
use_locking( *,
_class"
 loc:@dnn/logits/weights/part_0
�
Sdnn/regression_head/train_op/dnn/train/update_dnn/logits/biases/part_0/ApplyAdagradApplyAdagraddnn/logits/biases/part_08dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad*dnn/regression_head/dnn/learning_rate/read]dnn/regression_head/train_op/dnn/gradients/dnn/logits/BiasAdd_grad/tuple/control_dependency_1*
T0*
_output_shapes
:*
use_locking( *+
_class!
loc:@dnn/logits/biases/part_0
�
-dnn/regression_head/train_op/dnn/train/updateNoOp\^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_0/weights/part_0/ApplyAdagrad[^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_0/biases/part_0/ApplyAdagrad\^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_1/weights/part_0/ApplyAdagrad[^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_1/biases/part_0/ApplyAdagrad\^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_2/weights/part_0/ApplyAdagrad[^dnn/regression_head/train_op/dnn/train/update_dnn/hiddenlayer_2/biases/part_0/ApplyAdagradU^dnn/regression_head/train_op/dnn/train/update_dnn/logits/weights/part_0/ApplyAdagradT^dnn/regression_head/train_op/dnn/train/update_dnn/logits/biases/part_0/ApplyAdagrad
�
,dnn/regression_head/train_op/dnn/train/valueConst.^dnn/regression_head/train_op/dnn/train/update*
dtype0	*
_output_shapes
: *
value	B	 R*
_class
loc:@global_step
�
&dnn/regression_head/train_op/dnn/train	AssignAddglobal_step,dnn/regression_head/train_op/dnn/train/value*
T0	*
_output_shapes
: *
use_locking( *
_class
loc:@global_step
�
3dnn/regression_head/train_op/dnn/control_dependencyIdentity*dnn/regression_head/mean_squared_loss/loss'^dnn/regression_head/train_op/dnn/train*
T0*
_output_shapes
: *=
_class3
1/loc:@dnn/regression_head/mean_squared_loss/loss
k
&dnn/regression_head/metrics/mean/zerosConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
&dnn/regression_head/metrics/mean/total
VariableV2*
dtype0*
	container *
_output_shapes
: *
shape: *
shared_name 
�
-dnn/regression_head/metrics/mean/total/AssignAssign&dnn/regression_head/metrics/mean/total&dnn/regression_head/metrics/mean/zeros*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*9
_class/
-+loc:@dnn/regression_head/metrics/mean/total
�
+dnn/regression_head/metrics/mean/total/readIdentity&dnn/regression_head/metrics/mean/total*
T0*
_output_shapes
: *9
_class/
-+loc:@dnn/regression_head/metrics/mean/total
m
(dnn/regression_head/metrics/mean/zeros_1Const*
dtype0*
_output_shapes
: *
valueB
 *    
�
&dnn/regression_head/metrics/mean/count
VariableV2*
dtype0*
	container *
_output_shapes
: *
shape: *
shared_name 
�
-dnn/regression_head/metrics/mean/count/AssignAssign&dnn/regression_head/metrics/mean/count(dnn/regression_head/metrics/mean/zeros_1*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*9
_class/
-+loc:@dnn/regression_head/metrics/mean/count
�
+dnn/regression_head/metrics/mean/count/readIdentity&dnn/regression_head/metrics/mean/count*
T0*
_output_shapes
: *9
_class/
-+loc:@dnn/regression_head/metrics/mean/count
g
%dnn/regression_head/metrics/mean/SizeConst*
dtype0*
_output_shapes
: *
value	B :
�
*dnn/regression_head/metrics/mean/ToFloat_1Cast%dnn/regression_head/metrics/mean/Size*

SrcT0*
_output_shapes
: *

DstT0
i
&dnn/regression_head/metrics/mean/ConstConst*
dtype0*
_output_shapes
: *
valueB 
�
$dnn/regression_head/metrics/mean/SumSum*dnn/regression_head/mean_squared_loss/loss&dnn/regression_head/metrics/mean/Const*

Tidx0*
T0*
_output_shapes
: *
	keep_dims( 
�
*dnn/regression_head/metrics/mean/AssignAdd	AssignAdd&dnn/regression_head/metrics/mean/total$dnn/regression_head/metrics/mean/Sum*
T0*
_output_shapes
: *
use_locking( *9
_class/
-+loc:@dnn/regression_head/metrics/mean/total
�
,dnn/regression_head/metrics/mean/AssignAdd_1	AssignAdd&dnn/regression_head/metrics/mean/count*dnn/regression_head/metrics/mean/ToFloat_1+^dnn/regression_head/mean_squared_loss/loss*
T0*
_output_shapes
: *
use_locking( *9
_class/
-+loc:@dnn/regression_head/metrics/mean/count
o
*dnn/regression_head/metrics/mean/Greater/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
(dnn/regression_head/metrics/mean/GreaterGreater+dnn/regression_head/metrics/mean/count/read*dnn/regression_head/metrics/mean/Greater/y*
T0*
_output_shapes
: 
�
(dnn/regression_head/metrics/mean/truedivRealDiv+dnn/regression_head/metrics/mean/total/read+dnn/regression_head/metrics/mean/count/read*
T0*
_output_shapes
: 
m
(dnn/regression_head/metrics/mean/value/eConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
&dnn/regression_head/metrics/mean/valueSelect(dnn/regression_head/metrics/mean/Greater(dnn/regression_head/metrics/mean/truediv(dnn/regression_head/metrics/mean/value/e*
T0*
_output_shapes
: 
q
,dnn/regression_head/metrics/mean/Greater_1/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
*dnn/regression_head/metrics/mean/Greater_1Greater,dnn/regression_head/metrics/mean/AssignAdd_1,dnn/regression_head/metrics/mean/Greater_1/y*
T0*
_output_shapes
: 
�
*dnn/regression_head/metrics/mean/truediv_1RealDiv*dnn/regression_head/metrics/mean/AssignAdd,dnn/regression_head/metrics/mean/AssignAdd_1*
T0*
_output_shapes
: 
q
,dnn/regression_head/metrics/mean/update_op/eConst*
dtype0*
_output_shapes
: *
valueB
 *    
�
*dnn/regression_head/metrics/mean/update_opSelect*dnn/regression_head/metrics/mean/Greater_1*dnn/regression_head/metrics/mean/truediv_1,dnn/regression_head/metrics/mean/update_op/e*
T0*
_output_shapes
: 
�
initNoOp^global_step/Assign(^dnn/hiddenlayer_0/weights/part_0/Assign'^dnn/hiddenlayer_0/biases/part_0/Assign(^dnn/hiddenlayer_1/weights/part_0/Assign'^dnn/hiddenlayer_1/biases/part_0/Assign(^dnn/hiddenlayer_2/weights/part_0/Assign'^dnn/hiddenlayer_2/biases/part_0/Assign!^dnn/logits/weights/part_0/Assign ^dnn/logits/biases/part_0/Assign-^dnn/regression_head/dnn/learning_rate/AssignH^dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/AssignG^dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/AssignH^dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/AssignG^dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/AssignH^dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/AssignG^dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/AssignA^dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/Assign@^dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/Assign
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
6report_uninitialized_variables/IsVariableInitialized_1IsVariableInitialized dnn/hiddenlayer_0/weights/part_0*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
6report_uninitialized_variables/IsVariableInitialized_2IsVariableInitializeddnn/hiddenlayer_0/biases/part_0*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
6report_uninitialized_variables/IsVariableInitialized_3IsVariableInitialized dnn/hiddenlayer_1/weights/part_0*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
6report_uninitialized_variables/IsVariableInitialized_4IsVariableInitializeddnn/hiddenlayer_1/biases/part_0*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
6report_uninitialized_variables/IsVariableInitialized_5IsVariableInitialized dnn/hiddenlayer_2/weights/part_0*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
6report_uninitialized_variables/IsVariableInitialized_6IsVariableInitializeddnn/hiddenlayer_2/biases/part_0*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
6report_uninitialized_variables/IsVariableInitialized_7IsVariableInitializeddnn/logits/weights/part_0*
dtype0*
_output_shapes
: *,
_class"
 loc:@dnn/logits/weights/part_0
�
6report_uninitialized_variables/IsVariableInitialized_8IsVariableInitializeddnn/logits/biases/part_0*
dtype0*
_output_shapes
: *+
_class!
loc:@dnn/logits/biases/part_0
�
6report_uninitialized_variables/IsVariableInitialized_9IsVariableInitialized%dnn/regression_head/dnn/learning_rate*
dtype0*
_output_shapes
: *8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
�
7report_uninitialized_variables/IsVariableInitialized_10IsVariableInitialized@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_11IsVariableInitialized?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
7report_uninitialized_variables/IsVariableInitialized_12IsVariableInitialized@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_13IsVariableInitialized?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
7report_uninitialized_variables/IsVariableInitialized_14IsVariableInitialized@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_15IsVariableInitialized?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
7report_uninitialized_variables/IsVariableInitialized_16IsVariableInitialized9dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad*
dtype0*
_output_shapes
: *,
_class"
 loc:@dnn/logits/weights/part_0
�
7report_uninitialized_variables/IsVariableInitialized_17IsVariableInitialized8dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad*
dtype0*
_output_shapes
: *+
_class!
loc:@dnn/logits/biases/part_0
�
7report_uninitialized_variables/IsVariableInitialized_18IsVariableInitialized&dnn/regression_head/metrics/mean/total*
dtype0*
_output_shapes
: *9
_class/
-+loc:@dnn/regression_head/metrics/mean/total
�
7report_uninitialized_variables/IsVariableInitialized_19IsVariableInitialized&dnn/regression_head/metrics/mean/count*
dtype0*
_output_shapes
: *9
_class/
-+loc:@dnn/regression_head/metrics/mean/count
�	
$report_uninitialized_variables/stackPack4report_uninitialized_variables/IsVariableInitialized6report_uninitialized_variables/IsVariableInitialized_16report_uninitialized_variables/IsVariableInitialized_26report_uninitialized_variables/IsVariableInitialized_36report_uninitialized_variables/IsVariableInitialized_46report_uninitialized_variables/IsVariableInitialized_56report_uninitialized_variables/IsVariableInitialized_66report_uninitialized_variables/IsVariableInitialized_76report_uninitialized_variables/IsVariableInitialized_86report_uninitialized_variables/IsVariableInitialized_97report_uninitialized_variables/IsVariableInitialized_107report_uninitialized_variables/IsVariableInitialized_117report_uninitialized_variables/IsVariableInitialized_127report_uninitialized_variables/IsVariableInitialized_137report_uninitialized_variables/IsVariableInitialized_147report_uninitialized_variables/IsVariableInitialized_157report_uninitialized_variables/IsVariableInitialized_167report_uninitialized_variables/IsVariableInitialized_177report_uninitialized_variables/IsVariableInitialized_187report_uninitialized_variables/IsVariableInitialized_19*
T0
*
_output_shapes
:*
N*

axis 
y
)report_uninitialized_variables/LogicalNot
LogicalNot$report_uninitialized_variables/stack*
_output_shapes
:
�
$report_uninitialized_variables/ConstConst*
dtype0*
_output_shapes
:*�
value�B�Bglobal_stepB dnn/hiddenlayer_0/weights/part_0Bdnn/hiddenlayer_0/biases/part_0B dnn/hiddenlayer_1/weights/part_0Bdnn/hiddenlayer_1/biases/part_0B dnn/hiddenlayer_2/weights/part_0Bdnn/hiddenlayer_2/biases/part_0Bdnn/logits/weights/part_0Bdnn/logits/biases/part_0B%dnn/regression_head/dnn/learning_rateB@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/AdagradB?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/AdagradB@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/AdagradB?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/AdagradB@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/AdagradB?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/AdagradB9dnn/regression_head/dnn/dnn/logits/weights/part_0/AdagradB8dnn/regression_head/dnn/dnn/logits/biases/part_0/AdagradB&dnn/regression_head/metrics/mean/totalB&dnn/regression_head/metrics/mean/count
{
1report_uninitialized_variables/boolean_mask/ShapeConst*
dtype0*
_output_shapes
:*
valueB:
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
valueB:
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
:*
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
:*
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
8report_uninitialized_variables_1/IsVariableInitialized_1IsVariableInitialized dnn/hiddenlayer_0/weights/part_0*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_2IsVariableInitializeddnn/hiddenlayer_0/biases/part_0*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_3IsVariableInitialized dnn/hiddenlayer_1/weights/part_0*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_4IsVariableInitializeddnn/hiddenlayer_1/biases/part_0*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_5IsVariableInitialized dnn/hiddenlayer_2/weights/part_0*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_6IsVariableInitializeddnn/hiddenlayer_2/biases/part_0*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_7IsVariableInitializeddnn/logits/weights/part_0*
dtype0*
_output_shapes
: *,
_class"
 loc:@dnn/logits/weights/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_8IsVariableInitializeddnn/logits/biases/part_0*
dtype0*
_output_shapes
: *+
_class!
loc:@dnn/logits/biases/part_0
�
8report_uninitialized_variables_1/IsVariableInitialized_9IsVariableInitialized%dnn/regression_head/dnn/learning_rate*
dtype0*
_output_shapes
: *8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
�
9report_uninitialized_variables_1/IsVariableInitialized_10IsVariableInitialized@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_11IsVariableInitialized?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_12IsVariableInitialized@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_13IsVariableInitialized?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_14IsVariableInitialized@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad*
dtype0*
_output_shapes
: *3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_15IsVariableInitialized?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad*
dtype0*
_output_shapes
: *2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_16IsVariableInitialized9dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad*
dtype0*
_output_shapes
: *,
_class"
 loc:@dnn/logits/weights/part_0
�
9report_uninitialized_variables_1/IsVariableInitialized_17IsVariableInitialized8dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad*
dtype0*
_output_shapes
: *+
_class!
loc:@dnn/logits/biases/part_0
�	
&report_uninitialized_variables_1/stackPack6report_uninitialized_variables_1/IsVariableInitialized8report_uninitialized_variables_1/IsVariableInitialized_18report_uninitialized_variables_1/IsVariableInitialized_28report_uninitialized_variables_1/IsVariableInitialized_38report_uninitialized_variables_1/IsVariableInitialized_48report_uninitialized_variables_1/IsVariableInitialized_58report_uninitialized_variables_1/IsVariableInitialized_68report_uninitialized_variables_1/IsVariableInitialized_78report_uninitialized_variables_1/IsVariableInitialized_88report_uninitialized_variables_1/IsVariableInitialized_99report_uninitialized_variables_1/IsVariableInitialized_109report_uninitialized_variables_1/IsVariableInitialized_119report_uninitialized_variables_1/IsVariableInitialized_129report_uninitialized_variables_1/IsVariableInitialized_139report_uninitialized_variables_1/IsVariableInitialized_149report_uninitialized_variables_1/IsVariableInitialized_159report_uninitialized_variables_1/IsVariableInitialized_169report_uninitialized_variables_1/IsVariableInitialized_17*
T0
*
_output_shapes
:*
N*

axis 
}
+report_uninitialized_variables_1/LogicalNot
LogicalNot&report_uninitialized_variables_1/stack*
_output_shapes
:
�
&report_uninitialized_variables_1/ConstConst*
dtype0*
_output_shapes
:*�
value�B�Bglobal_stepB dnn/hiddenlayer_0/weights/part_0Bdnn/hiddenlayer_0/biases/part_0B dnn/hiddenlayer_1/weights/part_0Bdnn/hiddenlayer_1/biases/part_0B dnn/hiddenlayer_2/weights/part_0Bdnn/hiddenlayer_2/biases/part_0Bdnn/logits/weights/part_0Bdnn/logits/biases/part_0B%dnn/regression_head/dnn/learning_rateB@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/AdagradB?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/AdagradB@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/AdagradB?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/AdagradB@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/AdagradB?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/AdagradB9dnn/regression_head/dnn/dnn/logits/weights/part_0/AdagradB8dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad
}
3report_uninitialized_variables_1/boolean_mask/ShapeConst*
dtype0*
_output_shapes
:*
valueB:
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
valueB:
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
:*
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
:*
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
n
init_2NoOp.^dnn/regression_head/metrics/mean/total/Assign.^dnn/regression_head/metrics/mean/count/Assign
�
init_all_tablesNoOpl^dnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table/table_init
/
group_deps_1NoOp^init_2^init_all_tables
�
Merge/MergeSummaryMergeSummarySenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full-dnn/dnn/hiddenlayer_0_fraction_of_zero_values dnn/dnn/hiddenlayer_0_activation-dnn/dnn/hiddenlayer_1_fraction_of_zero_values dnn/dnn/hiddenlayer_1_activation-dnn/dnn/hiddenlayer_2_fraction_of_zero_values dnn/dnn/hiddenlayer_2_activation&dnn/dnn/logits_fraction_of_zero_valuesdnn/dnn/logits_activation!dnn/regression_head/ScalarSummary*
_output_shapes
: *
N

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
value3B1 B+_temp_b90256be6bfe4c959e44e86b3a62b1e9/part
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
�
save/SaveV2/tensor_namesConst*
dtype0*
_output_shapes
:*�
value�B�Bdnn/hiddenlayer_0/biasesB8dnn/hiddenlayer_0/biases/enlayer_0/biases/part_0/AdagradBdnn/hiddenlayer_0/weightsB9dnn/hiddenlayer_0/weights/nlayer_0/weights/part_0/AdagradBdnn/hiddenlayer_1/biasesB8dnn/hiddenlayer_1/biases/enlayer_1/biases/part_0/AdagradBdnn/hiddenlayer_1/weightsB9dnn/hiddenlayer_1/weights/nlayer_1/weights/part_0/AdagradBdnn/hiddenlayer_2/biasesB8dnn/hiddenlayer_2/biases/enlayer_2/biases/part_0/AdagradBdnn/hiddenlayer_2/weightsB9dnn/hiddenlayer_2/weights/nlayer_2/weights/part_0/AdagradBdnn/logits/biasesB1dnn/logits/biases/nn/logits/biases/part_0/AdagradBdnn/logits/weightsB2dnn/logits/weights/n/logits/weights/part_0/AdagradB%dnn/regression_head/dnn/learning_rateBglobal_step
�
save/SaveV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*�
value�B�B50 0,50B50 0,50B56 50 0,56:0,50B56 50 0,56:0,50B30 0,30B30 0,30B50 30 0,50:0,30B50 30 0,50:0,30B10 0,10B10 0,10B30 10 0,30:0,10B30 10 0,30:0,10B1 0,1B1 0,1B10 1 0,10:0,1B10 1 0,10:0,1B B 
�
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slices$dnn/hiddenlayer_0/biases/part_0/readDdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/read%dnn/hiddenlayer_0/weights/part_0/readEdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/read$dnn/hiddenlayer_1/biases/part_0/readDdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/read%dnn/hiddenlayer_1/weights/part_0/readEdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/read$dnn/hiddenlayer_2/biases/part_0/readDdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/read%dnn/hiddenlayer_2/weights/part_0/readEdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/readdnn/logits/biases/part_0/read=dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/readdnn/logits/weights/part_0/read>dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/read%dnn/regression_head/dnn/learning_rateglobal_step* 
dtypes
2	
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
|
save/RestoreV2/tensor_namesConst*
dtype0*
_output_shapes
:*-
value$B"Bdnn/hiddenlayer_0/biases
o
save/RestoreV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB50 0,50
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/AssignAssigndnn/hiddenlayer_0/biases/part_0save/RestoreV2*
T0*
_output_shapes
:2*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0
�
save/RestoreV2_1/tensor_namesConst*
dtype0*
_output_shapes
:*M
valueDBBB8dnn/hiddenlayer_0/biases/enlayer_0/biases/part_0/Adagrad
q
!save/RestoreV2_1/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB50 0,50
�
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_1Assign?dnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagradsave/RestoreV2_1*
T0*
_output_shapes
:2*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_0/biases/part_0

save/RestoreV2_2/tensor_namesConst*
dtype0*
_output_shapes
:*.
value%B#Bdnn/hiddenlayer_0/weights
y
!save/RestoreV2_2/shape_and_slicesConst*
dtype0*
_output_shapes
:*$
valueBB56 50 0,56:0,50
�
save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_2Assign dnn/hiddenlayer_0/weights/part_0save/RestoreV2_2*
T0*
_output_shapes

:82*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
�
save/RestoreV2_3/tensor_namesConst*
dtype0*
_output_shapes
:*N
valueEBCB9dnn/hiddenlayer_0/weights/nlayer_0/weights/part_0/Adagrad
y
!save/RestoreV2_3/shape_and_slicesConst*
dtype0*
_output_shapes
:*$
valueBB56 50 0,56:0,50
�
save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_3Assign@dnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagradsave/RestoreV2_3*
T0*
_output_shapes

:82*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_0/weights/part_0
~
save/RestoreV2_4/tensor_namesConst*
dtype0*
_output_shapes
:*-
value$B"Bdnn/hiddenlayer_1/biases
q
!save/RestoreV2_4/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB30 0,30
�
save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_4Assigndnn/hiddenlayer_1/biases/part_0save/RestoreV2_4*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0
�
save/RestoreV2_5/tensor_namesConst*
dtype0*
_output_shapes
:*M
valueDBBB8dnn/hiddenlayer_1/biases/enlayer_1/biases/part_0/Adagrad
q
!save/RestoreV2_5/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB30 0,30
�
save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_5Assign?dnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagradsave/RestoreV2_5*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_1/biases/part_0

save/RestoreV2_6/tensor_namesConst*
dtype0*
_output_shapes
:*.
value%B#Bdnn/hiddenlayer_1/weights
y
!save/RestoreV2_6/shape_and_slicesConst*
dtype0*
_output_shapes
:*$
valueBB50 30 0,50:0,30
�
save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_6Assign dnn/hiddenlayer_1/weights/part_0save/RestoreV2_6*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
�
save/RestoreV2_7/tensor_namesConst*
dtype0*
_output_shapes
:*N
valueEBCB9dnn/hiddenlayer_1/weights/nlayer_1/weights/part_0/Adagrad
y
!save/RestoreV2_7/shape_and_slicesConst*
dtype0*
_output_shapes
:*$
valueBB50 30 0,50:0,30
�
save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_7Assign@dnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagradsave/RestoreV2_7*
T0*
_output_shapes

:2*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_1/weights/part_0
~
save/RestoreV2_8/tensor_namesConst*
dtype0*
_output_shapes
:*-
value$B"Bdnn/hiddenlayer_2/biases
q
!save/RestoreV2_8/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB10 0,10
�
save/RestoreV2_8	RestoreV2
save/Constsave/RestoreV2_8/tensor_names!save/RestoreV2_8/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_8Assigndnn/hiddenlayer_2/biases/part_0save/RestoreV2_8*
T0*
_output_shapes
:
*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
save/RestoreV2_9/tensor_namesConst*
dtype0*
_output_shapes
:*M
valueDBBB8dnn/hiddenlayer_2/biases/enlayer_2/biases/part_0/Adagrad
q
!save/RestoreV2_9/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB10 0,10
�
save/RestoreV2_9	RestoreV2
save/Constsave/RestoreV2_9/tensor_names!save/RestoreV2_9/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_9Assign?dnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagradsave/RestoreV2_9*
T0*
_output_shapes
:
*
validate_shape(*
use_locking(*2
_class(
&$loc:@dnn/hiddenlayer_2/biases/part_0
�
save/RestoreV2_10/tensor_namesConst*
dtype0*
_output_shapes
:*.
value%B#Bdnn/hiddenlayer_2/weights
z
"save/RestoreV2_10/shape_and_slicesConst*
dtype0*
_output_shapes
:*$
valueBB30 10 0,30:0,10
�
save/RestoreV2_10	RestoreV2
save/Constsave/RestoreV2_10/tensor_names"save/RestoreV2_10/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_10Assign dnn/hiddenlayer_2/weights/part_0save/RestoreV2_10*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
�
save/RestoreV2_11/tensor_namesConst*
dtype0*
_output_shapes
:*N
valueEBCB9dnn/hiddenlayer_2/weights/nlayer_2/weights/part_0/Adagrad
z
"save/RestoreV2_11/shape_and_slicesConst*
dtype0*
_output_shapes
:*$
valueBB30 10 0,30:0,10
�
save/RestoreV2_11	RestoreV2
save/Constsave/RestoreV2_11/tensor_names"save/RestoreV2_11/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_11Assign@dnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagradsave/RestoreV2_11*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*3
_class)
'%loc:@dnn/hiddenlayer_2/weights/part_0
x
save/RestoreV2_12/tensor_namesConst*
dtype0*
_output_shapes
:*&
valueBBdnn/logits/biases
p
"save/RestoreV2_12/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB1 0,1
�
save/RestoreV2_12	RestoreV2
save/Constsave/RestoreV2_12/tensor_names"save/RestoreV2_12/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_12Assigndnn/logits/biases/part_0save/RestoreV2_12*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*+
_class!
loc:@dnn/logits/biases/part_0
�
save/RestoreV2_13/tensor_namesConst*
dtype0*
_output_shapes
:*F
value=B;B1dnn/logits/biases/nn/logits/biases/part_0/Adagrad
p
"save/RestoreV2_13/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB1 0,1
�
save/RestoreV2_13	RestoreV2
save/Constsave/RestoreV2_13/tensor_names"save/RestoreV2_13/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_13Assign8dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagradsave/RestoreV2_13*
T0*
_output_shapes
:*
validate_shape(*
use_locking(*+
_class!
loc:@dnn/logits/biases/part_0
y
save/RestoreV2_14/tensor_namesConst*
dtype0*
_output_shapes
:*'
valueBBdnn/logits/weights
x
"save/RestoreV2_14/shape_and_slicesConst*
dtype0*
_output_shapes
:*"
valueBB10 1 0,10:0,1
�
save/RestoreV2_14	RestoreV2
save/Constsave/RestoreV2_14/tensor_names"save/RestoreV2_14/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_14Assigndnn/logits/weights/part_0save/RestoreV2_14*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*,
_class"
 loc:@dnn/logits/weights/part_0
�
save/RestoreV2_15/tensor_namesConst*
dtype0*
_output_shapes
:*G
value>B<B2dnn/logits/weights/n/logits/weights/part_0/Adagrad
x
"save/RestoreV2_15/shape_and_slicesConst*
dtype0*
_output_shapes
:*"
valueBB10 1 0,10:0,1
�
save/RestoreV2_15	RestoreV2
save/Constsave/RestoreV2_15/tensor_names"save/RestoreV2_15/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_15Assign9dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagradsave/RestoreV2_15*
T0*
_output_shapes

:
*
validate_shape(*
use_locking(*,
_class"
 loc:@dnn/logits/weights/part_0
�
save/RestoreV2_16/tensor_namesConst*
dtype0*
_output_shapes
:*:
value1B/B%dnn/regression_head/dnn/learning_rate
k
"save/RestoreV2_16/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
�
save/RestoreV2_16	RestoreV2
save/Constsave/RestoreV2_16/tensor_names"save/RestoreV2_16/shape_and_slices*
_output_shapes
:*
dtypes
2
�
save/Assign_16Assign%dnn/regression_head/dnn/learning_ratesave/RestoreV2_16*
T0*
_output_shapes
: *
validate_shape(*
use_locking(*8
_class.
,*loc:@dnn/regression_head/dnn/learning_rate
r
save/RestoreV2_17/tensor_namesConst*
dtype0*
_output_shapes
:* 
valueBBglobal_step
k
"save/RestoreV2_17/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
�
save/RestoreV2_17	RestoreV2
save/Constsave/RestoreV2_17/tensor_names"save/RestoreV2_17/shape_and_slices*
_output_shapes
:*
dtypes
2	
�
save/Assign_17Assignglobal_stepsave/RestoreV2_17*
T0	*
_output_shapes
: *
validate_shape(*
use_locking(*
_class
loc:@global_step
�
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17
-
save/restore_allNoOp^save/restore_shard"<
save/Const:0save/Identity:0save/restore_all (5 @F8"!
local_init_op

group_deps_1"i
local_variablesV
T
(dnn/regression_head/metrics/mean/total:0
(dnn/regression_head/metrics/mean/count:0"�
queue_runners��
�
"enqueue_input/random_shuffle_queue.enqueue_input/random_shuffle_queue_EnqueueMany(enqueue_input/random_shuffle_queue_Close"*enqueue_input/random_shuffle_queue_Close_1*":
losses0
.
,dnn/regression_head/mean_squared_loss/loss:0" 
global_step

global_step:0"�	
trainable_variables�	�	
�
"dnn/hiddenlayer_0/weights/part_0:0'dnn/hiddenlayer_0/weights/part_0/Assign'dnn/hiddenlayer_0/weights/part_0/read:0"'
dnn/hiddenlayer_0/weights82  "82
�
!dnn/hiddenlayer_0/biases/part_0:0&dnn/hiddenlayer_0/biases/part_0/Assign&dnn/hiddenlayer_0/biases/part_0/read:0"#
dnn/hiddenlayer_0/biases2 "2
�
"dnn/hiddenlayer_1/weights/part_0:0'dnn/hiddenlayer_1/weights/part_0/Assign'dnn/hiddenlayer_1/weights/part_0/read:0"'
dnn/hiddenlayer_1/weights2  "2
�
!dnn/hiddenlayer_1/biases/part_0:0&dnn/hiddenlayer_1/biases/part_0/Assign&dnn/hiddenlayer_1/biases/part_0/read:0"#
dnn/hiddenlayer_1/biases "
�
"dnn/hiddenlayer_2/weights/part_0:0'dnn/hiddenlayer_2/weights/part_0/Assign'dnn/hiddenlayer_2/weights/part_0/read:0"'
dnn/hiddenlayer_2/weights
  "

�
!dnn/hiddenlayer_2/biases/part_0:0&dnn/hiddenlayer_2/biases/part_0/Assign&dnn/hiddenlayer_2/biases/part_0/read:0"#
dnn/hiddenlayer_2/biases
 "

�
dnn/logits/weights/part_0:0 dnn/logits/weights/part_0/Assign dnn/logits/weights/part_0/read:0" 
dnn/logits/weights
  "

|
dnn/logits/biases/part_0:0dnn/logits/biases/part_0/Assigndnn/logits/biases/part_0/read:0"
dnn/logits/biases ""J
savers@>
<
save/Const:0save/Identity:0save/restore_all (5 @F8"&

summary_op

Merge/MergeSummary:0"�
table_initializero
m
kdnn/input_from_feature_columns/input_from_feature_columns/num-of-doors_one_hot/lookup/hash_table/table_init"�
dnn�
�
"dnn/hiddenlayer_0/weights/part_0:0
!dnn/hiddenlayer_0/biases/part_0:0
"dnn/hiddenlayer_1/weights/part_0:0
!dnn/hiddenlayer_1/biases/part_0:0
"dnn/hiddenlayer_2/weights/part_0:0
!dnn/hiddenlayer_2/biases/part_0:0
dnn/logits/weights/part_0:0
dnn/logits/biases/part_0:0"�
model_variables�
�
"dnn/hiddenlayer_0/weights/part_0:0
!dnn/hiddenlayer_0/biases/part_0:0
"dnn/hiddenlayer_1/weights/part_0:0
!dnn/hiddenlayer_1/biases/part_0:0
"dnn/hiddenlayer_2/weights/part_0:0
!dnn/hiddenlayer_2/biases/part_0:0
dnn/logits/weights/part_0:0
dnn/logits/biases/part_0:0"U
ready_for_local_init_op:
8
6report_uninitialized_variables_1/boolean_mask/Gather:0"
ready_op


concat:0"�
	variables��
7
global_step:0global_step/Assignglobal_step/read:0
�
"dnn/hiddenlayer_0/weights/part_0:0'dnn/hiddenlayer_0/weights/part_0/Assign'dnn/hiddenlayer_0/weights/part_0/read:0"'
dnn/hiddenlayer_0/weights82  "82
�
!dnn/hiddenlayer_0/biases/part_0:0&dnn/hiddenlayer_0/biases/part_0/Assign&dnn/hiddenlayer_0/biases/part_0/read:0"#
dnn/hiddenlayer_0/biases2 "2
�
"dnn/hiddenlayer_1/weights/part_0:0'dnn/hiddenlayer_1/weights/part_0/Assign'dnn/hiddenlayer_1/weights/part_0/read:0"'
dnn/hiddenlayer_1/weights2  "2
�
!dnn/hiddenlayer_1/biases/part_0:0&dnn/hiddenlayer_1/biases/part_0/Assign&dnn/hiddenlayer_1/biases/part_0/read:0"#
dnn/hiddenlayer_1/biases "
�
"dnn/hiddenlayer_2/weights/part_0:0'dnn/hiddenlayer_2/weights/part_0/Assign'dnn/hiddenlayer_2/weights/part_0/read:0"'
dnn/hiddenlayer_2/weights
  "

�
!dnn/hiddenlayer_2/biases/part_0:0&dnn/hiddenlayer_2/biases/part_0/Assign&dnn/hiddenlayer_2/biases/part_0/read:0"#
dnn/hiddenlayer_2/biases
 "

�
dnn/logits/weights/part_0:0 dnn/logits/weights/part_0/Assign dnn/logits/weights/part_0/read:0" 
dnn/logits/weights
  "

|
dnn/logits/biases/part_0:0dnn/logits/biases/part_0/Assigndnn/logits/biases/part_0/read:0"
dnn/logits/biases "
�
'dnn/regression_head/dnn/learning_rate:0,dnn/regression_head/dnn/learning_rate/Assign,dnn/regression_head/dnn/learning_rate/read:0
�
Bdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad:0Gdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/AssignGdnn/regression_head/dnn/dnn/hiddenlayer_0/weights/part_0/Adagrad/read:0"G
9dnn/hiddenlayer_0/weights/nlayer_0/weights/part_0/Adagrad82  "82
�
Adnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad:0Fdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/AssignFdnn/regression_head/dnn/dnn/hiddenlayer_0/biases/part_0/Adagrad/read:0"C
8dnn/hiddenlayer_0/biases/enlayer_0/biases/part_0/Adagrad2 "2
�
Bdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad:0Gdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/AssignGdnn/regression_head/dnn/dnn/hiddenlayer_1/weights/part_0/Adagrad/read:0"G
9dnn/hiddenlayer_1/weights/nlayer_1/weights/part_0/Adagrad2  "2
�
Adnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad:0Fdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/AssignFdnn/regression_head/dnn/dnn/hiddenlayer_1/biases/part_0/Adagrad/read:0"C
8dnn/hiddenlayer_1/biases/enlayer_1/biases/part_0/Adagrad "
�
Bdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad:0Gdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/AssignGdnn/regression_head/dnn/dnn/hiddenlayer_2/weights/part_0/Adagrad/read:0"G
9dnn/hiddenlayer_2/weights/nlayer_2/weights/part_0/Adagrad
  "

�
Adnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad:0Fdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/AssignFdnn/regression_head/dnn/dnn/hiddenlayer_2/biases/part_0/Adagrad/read:0"C
8dnn/hiddenlayer_2/biases/enlayer_2/biases/part_0/Adagrad
 "

�
;dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad:0@dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/Assign@dnn/regression_head/dnn/dnn/logits/weights/part_0/Adagrad/read:0"@
2dnn/logits/weights/n/logits/weights/part_0/Adagrad
  "

�
:dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad:0?dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/Assign?dnn/regression_head/dnn/dnn/logits/biases/part_0/Adagrad/read:0"<
1dnn/logits/biases/nn/logits/biases/part_0/Adagrad ""�
	summaries�
�
Uenqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full:0
/dnn/dnn/hiddenlayer_0_fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_0_activation:0
/dnn/dnn/hiddenlayer_1_fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_1_activation:0
/dnn/dnn/hiddenlayer_2_fraction_of_zero_values:0
"dnn/dnn/hiddenlayer_2_activation:0
(dnn/dnn/logits_fraction_of_zero_values:0
dnn/dnn/logits_activation:0
#dnn/regression_head/ScalarSummary:0"6
train_op*
(
&dnn/regression_head/train_op/dnn/train"
init_op


group_deps�S�6       OW��	Z��P�A�N:($tensorboard/DNN_regressor/model.ckpt��|T       ���	���P�A�N:� P       ���	Q��P�A�N*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values
ד>
�
 dnn/dnn/hiddenlayer_0_activation*�    ��"@      �@! @=����@)W���h�@2�        �-���q=��(���>a�Ϭ(�>�7Kaa+?��VlQ.?��bȬ�0?��82?��%>��:?d�\D�X=?���#@?�!�A?a�$��{E?
����G?P}���h?ߤ�(g%k?�N�W�m?;8�clp?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@�������:�             ��@              �?              �?              �?              �?               @               @              �?              �?              �?      �?      �?              �?      @      @      @      �?      �?      @               @              @       @              �?      @       @       @      @      @               @      �?      �?      @      @      @              (@      @      @      @      @      @      0@      .@      @      &@      *@       @      0@      (@      4@      >@      A@      >@      9@      5@      E@      D@      B@     �K@     �P@      M@     �M@     �S@     �N@     @T@     �P@     @U@     �X@      ]@     �`@     �W@     �^@     �_@     �]@     @R@      U@     �L@      @@      C@      <@     �C@      4@      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   �؍o@      �@! ��T���@)3�|�2�iA2�        �-���q=5Ucv0ed?Tw��Nof?�1%�?\l�9�?yL�����?S�Fi��?u�rʭ�@�DK��@{2�.��@S���߮@)����&@a/5L��@��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             x�@              �?               @              �?              �?      �?              �?      �?               @      @              @       @      @      @      @      @      �?      @      �?      @      9@      4@      &@      F@      ;@      P@      V@     �`@     �e@      d@      W@     �[@      N@      D@      @@      I@      @      @     �A@      K@      6@      <@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ����@      �@!  �B��#A)�\<>��A2�        �-���q=o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@               @      4@      9@      ;@     �@@      .@      *@      *@       @      9@     �A@      =@      9@      8@      *@      &@      (@      @              $@      3@      "@      @      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ��V�@    ���@      P@!  �(�.A)��+|�B2�1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              @      @      @      �?      @       @              @      @      @      @       @      @      �?      @              @       @       @        

loss�{7J��F&       sO� 	(���P�A�N*

global_step/sec�n�C���s      }�`	^��P�A�N*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values��>
�
 dnn/dnn/hiddenlayer_0_activation*�   �W�"@      �@! @�<e��@)b�E7��@2�        �-���q=�[^:��"?U�4@@�$?��%�V6?uܬ�@8?IcD���L?k�1^�sO?nK���LQ?�lDZrS?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?hyO�s?&b՞
�u?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@�������:�             ��@               @               @               @               @               @               @       @      @      �?      @              @              �?              @      �?      �?      �?      @              �?      @               @               @       @      @      @       @      �?       @      @              @       @      @      @      @      @       @      @      @       @      "@      $@      *@      ,@      4@       @       @      1@      2@      6@      (@      ?@      >@      ?@     �D@     �B@      @@      L@     �K@      D@     �J@      J@     �P@      O@     @S@      O@      R@     �O@     @S@      V@     @Z@     �V@     �Q@     �S@     �Y@      Y@     �M@     �F@     �G@     �A@     �A@      7@      <@      *@       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   �9�o@      �@! �"�W��@)��&׏dA2�        �-���q=�v��ab�?�/��?����?_&A�o��?+Se*8�?uo�p�?�E̟���?yL�����?�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             �@              �?              �?               @              �?              �?              �?               @               @              @      �?      �?      @      @      �?       @      @      @      @               @      @      @      @       @      ;@      6@      ,@      S@     @T@     @V@     �W@     @d@     �e@     �_@     @Y@      W@      L@     �J@      :@      *@      @      �?      ,@      @@      >@      ,@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   `_��@      �@!  ��ĵ A)��k��A2�        �-���q=o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              $@      >@     �A@     �A@      E@     �A@      :@      "@              @      :@      8@      6@      8@      2@      "@      @       @              @      (@      "@      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    �@   �E��@      P@!   ��L)A)�Li���B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�               @      &@      @       @      @      @      �?              �?       @      @       @      @       @      �?              �?      @      �?        

loss���If)�&       sO� 	�s��P�A�O*

global_step/sec��C��m�      ":o$	X���P�A�O*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesף�>
�
 dnn/dnn/hiddenlayer_0_activation*�   � q#@      �@! �q�ͱ@)^~���@2�        �-���q=I�I�)�(?�7Kaa+?��VlQ.?��82?�u�w74?�T���C?a�$��{E?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?eiS�m�?#�+(�ŉ?���&�?�Rc�ݒ?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@�������:�             �@              �?       @              �?              �?               @      �?      �?      @              �?      �?      �?              @              @      @      �?      �?      @               @      �?      �?       @      �?              �?              �?              �?               @              �?       @              �?       @      @      $@      �?       @      �?      @       @      @       @      @      @       @      @      @      @      &@       @      "@      .@      0@      3@      1@      3@      4@      8@      A@      A@      B@     �F@     �A@      @@     �K@      E@      D@      P@     �L@     �I@     �R@      R@     �L@      G@      Q@     �M@     @S@     @V@     �W@     �Q@     �M@     �P@     @U@      H@     �Q@     �R@      G@      ?@      6@      9@      @       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values��>
�
 dnn/dnn/hiddenlayer_1_activation*�    s�k@      �@! hM����@)�n�K�cA2�        �-���q=�Rc�ݒ?^�S���?%g�cE9�?��(!�ؼ?��7��?�^��h��?2g�G�A�?������?�iZ�?+�;$�?h�5�@�Š)U	@u�rʭ�@�DK��@زv�5f@��h:np@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             ��@               @              �?              �?               @              �?               @       @      �?              �?              @      �?      �?      �?      @      �?      �?       @      @      �?       @      @      @       @      @       @      =@      9@      @     �J@      S@     �V@      g@     �c@     �h@     �b@     @T@     �G@      &@      ;@     �@@      7@      2@      8@      A@     �@@      1@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �^H�@      �@!  ��>+ A)��_ ���A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              @       @      9@      7@     �C@     �L@     �I@      7@      0@       @      @      7@      6@      "@      @       @      ,@      @      @      @      (@      *@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �s��@   ��R�@      P@!  �*��(A)�7�$KB2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              @       @      @      "@      (@      @      @              �?              @       @              �?       @       @      �?      �?              @       @        

loss6�I$��&       sO� 	S���P�A�P*

global_step/sec���C剨rC      !(�	b%��P�A�P*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values  �>
�
 dnn/dnn/hiddenlayer_0_activation*�    ��$@      �@! �1��۳@)�}AZ���@2�        �-���q=ji6�9�?�S�F !?��bȬ�0?��82?d�\D�X=?���#@?�!�A?�T���C?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?<DKc��T?ܗ�SsW?���%��b?5Ucv0ed?P}���h?ߤ�(g%k?�N�W�m?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@               @               @              �?              �?               @       @      �?      �?              �?              �?              @      �?              �?      �?      @       @      @      @               @              �?              �?              @              @       @      @      @      @       @      @       @       @      �?      @      @      @      @      @      @      @      @      @       @      (@      .@      @      0@      (@      (@      0@      5@      1@      <@     �@@      A@      8@      A@      E@     �E@      K@      L@      P@      O@     �P@     @R@     �S@     @S@     @S@      Q@     �U@     @T@     �T@     @Q@     �O@     �P@      O@     �G@     �D@     �J@     �K@      I@      H@     �B@      =@      (@      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   ���n@      �@! �҇@�@)�7c,jhA2�        �-���q=����?_&A�o��?�E̟���?yL�����?S�Fi��?u�rʭ�@�DK��@!��v�@زv�5f@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ؀@              �?               @      �?              �?               @              @               @      �?      @      �?              @      �?      @       @       @       @      @       @      @      @       @      $@     �K@      K@      O@     @]@      g@      g@     @n@     �S@     �Q@      R@      "@       @      @      ,@      6@     �C@      6@      I@      0@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �l�@      �@!  (�!A)pގ1l�A2�        �-���q=o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              @      2@      D@      C@     �K@      >@      &@      @      ,@      .@     �@@      9@      .@      2@      @              @      @      &@      $@      .@      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   @���@   ����@      P@!  ����*A)tZ^H�B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?      @      "@      @       @               @       @      @      @      @      �?      @      �?              �?              @               @      @        

loss0?J��W&       sO� 	�c��P�A�Q*

global_step/secV��C&��g�      ":o$	���P�A�Q*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values��>
�
 dnn/dnn/hiddenlayer_0_activation*�   ��_&@      �@!  �c�ױ@)(<�)��@2�        �-���q=ji6�9�?�S�F !?���#@?�!�A?
����G?�qU���I?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?�m9�H�[?E��{��^?���%��b?5Ucv0ed?Tw��Nof?P}���h?�N�W�m?;8�clp?uWy��r?hyO�s?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@�������:�             ��@              �?              �?              @               @      �?      �?              �?              �?      �?      �?              �?              �?              �?              �?      �?       @              �?              �?      �?              �?      �?      �?      @      &@      @      @      @      �?      �?       @      @       @       @      @      @      @      @      &@      @      &@       @      4@      @      *@      ,@      (@      4@      9@      =@      ?@      9@      C@      :@      >@     �@@      F@     �D@     �H@     �K@      N@     �J@      J@     �S@     �P@     @Q@      X@     �S@     �\@     �_@     @`@     @W@      O@      R@     �Q@      H@     �G@      G@     �A@      9@      2@      ,@       @      @       @      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesDD�>
�
 dnn/dnn/hiddenlayer_1_activation*�   �|Zm@      �@! �'k��@)�z�%bA2�        �-���q=���&�?�Rc�ݒ?�v��ab�?�/��?I���?����iH�?_&A�o��?�Ca�G��?2g�G�A�?������?yL�����?S�Fi��?h�5�@�Š)U	@�DK��@{2�.��@زv�5f@��h:np@)����&@a/5L��@��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             `�@               @               @               @              �?              �?              �?              �?              �?              �?              @               @      @      �?              @       @      @              @      @      @      "@      @      .@      0@      $@     �R@     �R@     �K@     @d@     �h@     `b@     �e@     @U@     �P@      R@     �@@      4@      (@      .@      8@      6@      (@      ,@      �?        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    (M�@      �@!  ���A)>�g�P��A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?       @       @      6@      7@     �A@     @P@     �E@      .@       @      "@      @      D@      ;@      @      4@      1@      "@       @      @      @      "@      @      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   @��@   ��i�@      P@!   �<(A)l4���B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?      @      @      "@      &@               @      �?      �?      @       @      �?      @       @      �?      �?      �?      �?      �?      �?              �?        

loss��I��2@&       sO� 	@ �P�A�R*

global_step/secKN�C�;;3      |��	�@ �P�A�R*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values��>
�
 dnn/dnn/hiddenlayer_0_activation*�    v&@      �@! �9yoհ@)�r�N�B�@2�        �-���q=��d�r?�5�i}1?ji6�9�?�S�F !?U�4@@�$?+A�F�&?I�I�)�(?�7Kaa+?��VlQ.?d�\D�X=?���#@?�!�A?�T���C?a�$��{E?�qU���I?IcD���L?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?o��5sz?���T}?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�#�h/�?���&�?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@�������:�             �@              �?              �?              �?              �?       @              �?              @      �?               @              @      �?              �?      �?       @      @      @               @               @              �?              �?              �?      �?              @              @      �?      &@      @      @      �?      @      @      @      �?      @      @      @      @      "@       @      3@      3@      *@      (@       @      @      8@      :@      7@      ;@      C@      8@      >@      <@      5@      G@     �N@      D@      N@      P@     �K@      R@     �O@      Y@     �Q@     �R@     �P@      V@     @X@      V@     �U@     �S@     �V@     �Q@     �L@     �G@     �F@      8@      :@      3@      &@      @       @              �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesww�>
�
 dnn/dnn/hiddenlayer_1_activation*�   �Ԥj@      �@!  �+���@)I�I��`A2�        �-���q=S�Fi��?ܔ�.�u�?h�5�@�Š)U	@u�rʭ�@�DK��@زv�5f@��h:np@S���߮@)����&@a/5L��@��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             H�@               @              �?              �?               @              �?       @              �?      @      �?              @              @      �?       @      @      @      @      �?      (@      $@      1@     �R@      :@      N@     �e@      i@     `e@     �m@     �W@     @\@     �E@      "@      0@      ,@       @      &@      :@      "@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �9��@      �@!  �}��A)P�
�`�A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              �?      @      "@      3@      ?@      =@     @P@     �C@       @       @      .@      6@      B@      ;@      5@      1@      @      @      @       @      @      @      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   @���@   �z��@      P@!  ��5�&A)j���
B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              @      @      @       @      "@               @      �?      @       @       @      @       @              �?      �?              �?      �?      �?        

loss��Io�qz&       sO� 	���P�A�R*

global_step/sec��Dw�c��      $��z	�
�P�A�R*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�z�>
�
 dnn/dnn/hiddenlayer_0_activation*�   �i"@      �@!  |�Е�@)Z9�C�@2�        �-���q=�[^:��"?U�4@@�$?I�I�)�(?�7Kaa+?uܬ�@8?��%>��:?�qU���I?IcD���L?nK���LQ?�lDZrS?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?����=��?���J�\�?-Ա�L�?eiS�m�?�7c_XY�?�#�h/�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@�������:�             �@              �?              �?              �?               @               @              �?      @      �?       @      �?       @      �?      @      @      �?      @              �?              �?      @      �?              �?              �?      @      �?       @      @       @      @              @      @       @              �?      @      @      @      $@      @      1@      @      ,@      *@      2@      "@      (@      6@      2@      2@      <@      B@      C@      >@      A@      D@     �H@     �C@      O@      P@      P@     �U@     �L@     @X@      V@     �U@      X@     �R@     @^@     �b@     @Y@     �W@     �W@     �V@     �O@      M@     �P@     @R@      M@     �@@      @@      <@      &@      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�>
�
 dnn/dnn/hiddenlayer_1_activation*�   �bXo@      �@!  ��F�@)\K<8��fA2�        �-���q=�Ca�G��?��7��?yL�����?S�Fi��?u�rʭ�@�DK��@!��v�@زv�5f@��h:np@)����&@a/5L��@v@�5m @��@�"@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             h�@               @              �?              �?              �?      �?              @      �?      �?               @      @      �?      @       @      @       @      @      �?      @       @      @       @      "@      F@      Q@     �Q@      S@      a@      g@     `m@     �^@      Y@      :@      (@      "@      .@      2@      5@     �O@      7@      6@      ,@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    R��@      �@!   �I�"A)��!}>�A2�        �-���q=o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              �?      &@      .@      ;@      B@      7@      5@      &@      ,@      C@     �G@      ?@      9@      4@      @      @      @      @      @      2@      .@      @      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �(u�@    ���@      P@!  �AB�,A)H�QvYB2�1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              @      @      @      @      @      �?      �?      @      @      @      @      �?      �?              �?      �?              @      �?       @      �?        

loss�#J�?H�&       sO� 	.T�P�A�S*

global_step/sec� D�      #f�	���P�A�S*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�(�>
�
 dnn/dnn/hiddenlayer_0_activation*�    S!$@      �@!  ��	�@)^��h���@2�        �-���q=�ߊ4F��>})�l a�>ji6�9�?�S�F !?�[^:��"?I�I�)�(?�7Kaa+?��VlQ.?��bȬ�0?d�\D�X=?���#@?�T���C?a�$��{E?�qU���I?IcD���L?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?�#�h/�?���&�?�Rc�ݒ?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             �@               @               @       @               @               @               @               @               @              @       @      �?      �?      �?              �?      �?      @      @      �?               @              �?      �?      �?      �?              @      �?              �?      �?       @               @       @      @       @      $@      @      @      @      @      @      @      @      $@      @       @      $@      (@      $@      1@      "@      .@      *@      @      3@      :@      ?@      ?@     �A@     �B@     �F@      >@     �@@      Q@      I@      I@      K@      L@     �R@      K@     �Q@     �W@     �T@     �T@     @S@     �Z@      ^@     �T@      N@     �L@     �R@     �P@      F@      E@      G@     �M@      A@      0@      0@      4@      @      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesff�>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��Go@      �@! �,�R�@)���cA2�        �-���q=�{ �ǳ�?� l(��?�Ca�G��?��7��?�iZ�?+�;$�?u�rʭ�@�DK��@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             (�@               @              @               @              �?              @       @              @      @      @      �?       @      $@      @      @      @       @      @      @      @      :@      7@      @      J@     �V@     �U@     �d@     �d@     �c@      g@      S@     �M@      K@      7@      @      1@      1@      *@      7@      $@      2@      :@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �7��@      �@!  ��F A)�,�e�A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              �?      "@      ;@      ?@      9@      B@      =@     �B@      ;@      5@      3@      7@      4@      (@      *@      $@      @      @      @      @      @      @      @      @      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ���@   ����@      P@!  �jc�(A)ް�wA�B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              @      "@       @      @      "@      @      @       @      @      �?      @       @       @       @              �?      �?               @              �?       @        

loss���I���M&       sO� 	k/$�P�A�T*

global_step/sec�Dx��}�      #f�	�q$�P�A�T*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesff�>
�
 dnn/dnn/hiddenlayer_0_activation*�   @�$@      �@!  b�9�@)՝4Vc�@2�        �-���q=��bȬ�0?��82?uܬ�@8?��%>��:?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?�l�P�`?���%��b?5Ucv0ed?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@               @              �?              �?      �?      �?       @              �?      @               @      �?      �?               @      �?               @      �?               @      �?      �?      �?      �?              @              @      �?      @              �?              �?       @              @      �?      @      �?      �?      @      @      .@      "@      @      @      ,@      @      @      (@       @      @      $@      3@      *@      *@      &@      *@      6@      *@      7@      8@      >@      =@      B@      B@     �@@      N@      A@     �A@     �I@      M@      N@     �D@     �V@     �G@     �L@     �M@     �H@     �I@     �U@      O@      P@     @R@     �R@      R@      S@     �U@     �U@      J@      C@      2@      (@      $@      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�̌>
�
 dnn/dnn/hiddenlayer_1_activation*�   `!;m@      �@! !�.�@)U�
;�IeA2�        �-���q=`��a�8�?�/�*>�?cI���?�P�1���?3?��|�?ܔ�.�u�?��tM@�Š)U	@u�rʭ�@�DK��@زv�5f@��h:np@S���߮@)����&@a/5L��@��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ��@              �?               @      �?               @               @      �?              �?       @      �?       @              @              @              @      @      @      �?      "@      @      @      @       @      7@      2@      0@      J@     @R@      O@     �W@     @]@     `g@     �q@     �P@      T@     �E@     �B@      <@      0@      @      9@      O@      5@      ,@      �?        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �gC�@      �@!  � �= A)�����;�A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?      ,@      <@      F@      C@     �I@      @@      7@      ,@      &@      @      @      @      0@      :@      &@      &@      @              @      4@      $@      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    e��@    p�@      P@!  @�(A)0�&��)B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              @      &@       @      @      @       @      @      �?       @              �?      @       @      @      �?       @              @       @              �?        

lossV��I�׊�&       sO� 	m/�P�A�U*

global_step/sec�[D��MS      } 	R�/�P�A�U*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesH�>
�
 dnn/dnn/hiddenlayer_0_activation*�   �7�&@      �@!  O>��@)�Í�V�@2�        �-���q=E��a�W�>�ѩ�-�>���#@?�!�A?�T���C?a�$��{E?
����G?k�1^�sO?nK���LQ?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?^�S���?�"�uԖ?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@�������:�             x�@              �?              �?      �?              �?               @              �?               @              �?       @      @              �?       @               @      �?       @      �?               @              �?              �?      �?              �?              �?      �?      @      @      @      @      �?       @      �?      @      @      @      @      @       @      @      @      "@      @      1@      "@      "@      6@      &@      "@      5@      .@      8@      7@     �A@     �D@      C@     �@@      ?@     �B@     �H@      B@     �C@     �L@     �P@     �H@     �R@      V@     �R@     @T@     �O@     @U@     ``@     @W@     �X@     @U@     @X@      X@     @T@     �T@     �S@     �P@      J@      8@      4@      @      @              �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesUU�>
�
 dnn/dnn/hiddenlayer_1_activation*�   @�@k@      �@! ���~��@)�@	Q�gA2�        �-���q=��]$A�?�{ �ǳ�?�iZ�?+�;$�?�E̟���?yL�����?ܔ�.�u�?��tM@�Š)U	@u�rʭ�@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             ��@              �?               @              �?              �?               @              �?      @              �?       @      @              �?       @               @       @       @      @      �?      @       @       @      ;@     �B@      F@     @]@     @a@     �_@      k@     `b@      [@      Q@     �C@      A@      6@      *@      K@      T@      @      "@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   @3'�@      �@!  �T-�"A)$"��=��A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              �?      @      "@      ,@      ;@      6@     �A@      6@      &@      2@      2@      ,@      @@      :@      6@      7@      ,@      &@      @       @      .@      :@      "@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �2ϴ@   �SG�@      P@!   �,A)#��A��B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?      @      @      @      @      @      �?      @       @      @       @      @      @       @      @       @       @              �?      @              �?        

loss,_�I=h��&       sO� 	w:�P�A�U*

global_step/sec��D�\D�C      F�r�	��:�P�A�U*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�>
�
 dnn/dnn/hiddenlayer_0_activation*�   @��&@      �@! ��D/��@) ���&�@2�        �-���q=���%�>�uE����>I�I�)�(?�7Kaa+?��bȬ�0?��82?�u�w74?��%�V6?uܬ�@8?��%>��:?d�\D�X=?���#@?�!�A?�T���C?a�$��{E?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?���T}?>	� �?����=��?���J�\�?-Ա�L�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@�������:�             �@              @              @               @      �?      �?              �?              �?      �?              �?              �?      �?      �?      �?      @      �?      @      @      @      �?              @       @      @      @              @              @              @       @              @       @      �?      �?      �?              �?      @      @      @      @      @      @      @      @       @      @       @      @       @      @      0@      "@      0@      .@      @      @      @      6@      $@      1@      6@      5@      <@      2@      >@      @@      B@     �G@     �I@     �I@     �E@     �O@     @Q@      Q@     �R@      T@     @P@     �T@     �U@      U@     �T@     @\@     �Y@      T@      T@      S@     @S@      P@      F@      A@     �G@      A@      9@     �B@      3@      @               @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�>
�
 dnn/dnn/hiddenlayer_1_activation*�   @FNo@      �@! @$_���@)'�%Z[fA2�        �-���q=#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�uS��a�?`��a�8�?�P�1���?3?��|�?u�rʭ�@�DK��@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             x�@              �?              �?               @              �?              @               @              @              @      @      @               @       @      �?      �?      @       @      @      @      @      �?      "@      @      *@      8@     �Y@     �Q@     �R@     �R@     �^@     @c@     �e@      _@     �]@     �G@      0@      :@      B@       @      @      ;@      ;@      5@      <@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    U��@      �@!  ���}!A)�U*8 ��A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@               @      @      "@      &@      =@      <@      H@     �@@      9@      0@      $@      "@      ;@      =@      9@      .@      @      @      $@      @              @      (@      @      @      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �0�@   ����@      P@!  ��ά*A){��$B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              @      @      @      &@      @      @      @      �?       @      @      @      @       @      �?      �?      @              �?      �?       @       @        

loss���I���&       sO� 	��D�P�A�V*

global_step/sec�D.@�@      |읅	:>E�P�A�V*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesף�>
�
 dnn/dnn/hiddenlayer_0_activation*�   ���$@      �@!  R���@)+���[��@2�        �-���q=ji6�9�?�S�F !?��%>��:?d�\D�X=?
����G?�qU���I?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?�N�W�m?;8�clp?���T}?>	� �?-Ա�L�?eiS�m�?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@              �?               @              �?              �?              �?              �?      �?               @              �?              �?              @              �?              �?               @              @       @       @       @      �?      @      @      @      @      @      @      @      @      @      @      @       @      @      @      @      @      *@      *@      @       @      @      4@      $@      ,@      *@      2@      .@      3@      :@      >@     �B@      A@     �D@      A@      ?@      M@     �K@      L@     �O@      R@      Q@     �R@     �Q@     �T@      W@      _@     �X@     �V@     �Q@      X@     �P@      F@      N@     �P@     �N@     �I@      >@      3@      (@      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values""�>
�
 dnn/dnn/hiddenlayer_1_activation*�   ���l@      �@! x�$��@)W�B:fA2�        �-���q=W�i�b�?��Z%��?\l�9�?+Se*8�?3?��|�?�E̟���?yL�����?u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ��@              �?              �?               @       @              �?              �?              �?              �?      �?      �?              �?              @      �?       @       @       @       @      @      @      @      @      $@      8@      5@      0@     @P@     @P@     �J@      c@     �_@     `g@     �e@     @Q@     �Q@      I@      =@      <@      �?      $@     �C@     �N@      >@      8@      �?        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �(�@      �@!  ೆ�!A)������A2�        �-���q=o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              "@      7@      >@     �@@     �L@      B@      .@       @      @      4@      5@      &@      1@      4@      2@      @              1@      ,@      (@      "@       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   `{��@   ��F�@      P@!  �D>�*A)�{F�FB2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?      @       @      "@      @      @       @      �?      �?      @       @      @      @      �?      @              @      �?      @        

loss���I1��k&       sO� 	�R�P�A�W*

global_step/sec]�C6~H      G�A	|�R�P�A�W*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values=
�>
�
 dnn/dnn/hiddenlayer_0_activation*�    '@      �@!  n]C�@)Y�vC��@2�        �-���q=��bȬ�0?��82?���#@?�!�A?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?���%��b?5Ucv0ed?Tw��Nof?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@�������:�             ؏@               @              �?               @      �?      �?      �?              �?      �?              �?               @      �?              �?      �?      @      @              �?      �?              �?       @      @      �?              �?      �?      �?              �?      �?               @       @      �?              @      �?      @      @      �?      �?      @      @      @               @      @      @      @      @      "@      @      $@      @      $@      (@      0@      1@      5@      ,@      5@      9@      C@      =@      E@      F@      @@     �H@      F@      B@     �H@     �E@     @Q@      I@     �L@     @P@     �K@      T@      P@     @V@     �]@     @Z@     �S@     @Y@     @V@      Z@      U@     �R@      Q@     �E@      D@      7@      ,@      >@       @      @       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   `U�n@      �@!  � ^]�@)�@�̃�hA2�        �-���q=�/��?�uS��a�?W�i�b�?��Z%��?������?�iZ�?h�5�@�Š)U	@u�rʭ�@زv�5f@��h:np@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ȁ@              �?              �?              �?              �?      �?               @              �?      @              @      �?       @      �?      �?       @      @      @       @      �?      @      @      @      $@      @      *@      A@      @@      M@     �c@     �i@     @g@     �c@      P@     @Q@      S@     �@@      @      3@      5@      ?@     �K@      ;@      5@      9@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ��M�@      �@!  �7�"A)شE�q��A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@               @      @      @      @      ;@      9@      K@     �@@      1@      (@      1@      3@      >@      2@      &@      9@      $@      �?      @      @       @      2@      &@      @       @      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �<�@   @ޞ�@      P@!   �Lm,A)�ZbcPB2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�               @      @      �?      @      "@      @      @       @      �?      @      @      @      @      �?      @              �?      �?      �?      �?      @              @        

loss|+�I5��&       sO� 	��^�P�A�X*

global_step/secE�DQ�(�      G�A	��^�P�A�X*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesff�>
�
 dnn/dnn/hiddenlayer_0_activation*�    �'@      �@! ����`�@)M�o~���@2�        �-���q=�S�F !?�[^:��"?+A�F�&?I�I�)�(?�7Kaa+?��bȬ�0?��82?�!�A?�T���C?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@�������:�             4�@              �?              �?       @               @              �?               @      �?      �?      �?      @      @              �?      �?       @              @              �?              �?              @      �?      @      �?              �?      �?       @               @               @       @              �?      @       @      "@       @       @      @      @      @      @       @       @      �?      @      "@      @      .@      @      &@      .@       @      &@      (@      .@      (@      6@      5@      8@      A@     �H@      C@      =@     �C@     �C@     �L@      H@      H@      O@      L@     @R@     �Q@     �U@     �U@      M@     �K@      J@     �N@     �W@     @P@     @Q@      I@      O@     �Q@     �H@      J@     �G@     �D@     �B@      :@      1@      @       @      �?      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   @Ddj@      �@! X6����@)�Y��DbA2�        �-���q=`��a�8�?�/�*>�?�g���w�?������?�iZ�?cI���?�P�1���?3?��|�?�E̟���?ܔ�.�u�?��tM@h�5�@�Š)U	@u�rʭ�@{2�.��@!��v�@زv�5f@��h:np@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             `�@               @      �?              �?               @               @              �?               @      �?               @              �?               @      �?       @      �?      @       @      @      �?      @      �?       @      @      @      @      @      <@      6@      .@     �A@     �H@     �Q@      f@     �b@     �f@     0p@     �R@      P@     �Q@     �B@      &@      �?      @      4@     �F@      1@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ��@      �@!  D�iA)�ׅ���A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              �?      @      (@      5@      :@     �B@     �J@     �F@      5@      .@      3@      6@      3@      "@      ,@      3@      *@      @              @      *@      "@       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    �ٴ@   ����@      P@!   �s='A)�u;y]B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?      �?       @      @      "@      "@      @      @              @              @       @       @      @      �?              @      �?      �?        

loss6�I���&       sO� 	��h�P�A�Y*

global_step/secS D��Xs      }�`	��h�P�A�Y*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_0_activation*�    �.'@      �@! �zr��@)��ξc��@2�        �-���q=>h�'�?x?�x�?��82?�u�w74?uܬ�@8?��%>��:?���#@?�!�A?�T���C?a�$��{E?nK���LQ?�lDZrS?<DKc��T?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?>	� �?����=��?���J�\�?#�+(�ŉ?�7c_XY�?���&�?�Rc�ݒ?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@�������:�             P�@              �?              @              �?              �?               @              �?       @              �?      @      @      �?       @      @      @      @       @               @      @      @       @              �?       @              �?              �?              @      �?      �?      $@       @      @      @       @      �?      @      �?      @              @      @      @      "@      @      &@       @       @      @      "@      @      &@      7@      .@      2@      6@      >@      <@      5@      9@     �C@      ?@      G@      G@     �E@      I@     @S@      O@     �U@     �Y@     �O@     �Q@     �R@      V@     �_@     @W@     �X@     �W@     �V@      Q@      P@     �P@     �S@     @T@     �N@      L@     �E@      8@      @       @      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values""�>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��~n@      �@! �:�S��@)��(� �kA2�        �-���q=������?�iZ�?+�;$�?cI���?3?��|�?�E̟���?��tM@w`<f@�Š)U	@u�rʭ�@v@�5m @��@�"@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ��@              �?               @               @              �?              �?               @              @      @      �?      @      @      @       @      @              @      5@      8@       @      ;@     �G@     �P@     @[@     �T@      X@     `p@      `@     �R@      5@      :@      B@     �A@      9@      ?@      H@     �I@     �I@      &@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �N6�@      �@!  �M1$A)�O^��U�A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              �?       @      "@      9@      8@      :@      6@      ,@      0@      3@      5@      6@      B@      5@      0@       @       @      (@       @      @       @      *@      :@      .@      @      �?        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   `W��@   �?��@      P@!  �>��.A)r �HB2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?               @      @       @      @              @       @      @      @      @      @       @               @      @      �?      �?       @      �?      @      �?        

lossW5J]RL`&       sO� 	�u�P�A�Y*

global_step/sec�� D��3      |��	�Qu�P�A�Y*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values  �>
�
 dnn/dnn/hiddenlayer_0_activation*�    G'@      �@!  �hv��@)�����@2�        �-���q=�.�?ji6�9�?��VlQ.?��bȬ�0?d�\D�X=?���#@?�!�A?�T���C?
����G?�qU���I?IcD���L?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?*QH�x?o��5sz?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@�������:�             ��@              �?              �?               @      �?      �?               @      @              �?              �?               @       @      @      �?      �?               @              �?              @       @              �?              �?       @               @      �?      �?       @              �?      �?      @      @      @      @       @       @      @       @       @       @       @      @      (@      $@      "@       @      "@      1@      ,@      ,@      ,@      0@      >@      6@      ?@     �D@      I@     �A@     �B@      N@     �F@      E@     �Q@     �N@     �S@     �R@     �Z@     �T@      T@     �P@     �P@     �X@     �]@     �T@      T@     �R@     �S@     @Q@     �M@     �R@     @P@     �G@      C@      ?@      5@      @      �?      �?      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesff�>
�
 dnn/dnn/hiddenlayer_1_activation*�   `3k@      �@! �Mz�w�@)g}�ri�cA2�        �-���q=�^��h��?W�i�b�?�E̟���?yL�����?زv�5f@��h:np@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             �@              �?              @              �?              �?      @               @      �?      �?      �?       @      @      &@      @      "@       @      @      @      $@     �E@      D@      $@     �D@     @S@     �R@     �V@      e@     �`@     �b@     @Z@     �X@      K@      7@      =@      5@      =@      2@     �B@      ,@      2@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   @=�@      �@!  d�b2!A)>K!Ӥ�A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              �?       @      @      ;@     �@@      7@      @@      5@      ;@      4@      .@      &@      ?@     �A@      2@      3@      "@      $@      @      @      "@      "@      (@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   `&Ǵ@   @�<�@      P@!  �H�N*A)D�%!0%B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?       @      @      @      @       @      @      @       @       @       @       @      @       @      �?      �?       @       @              @               @        

loss҃�I�&�&       sO� 	%I��P�A�Z*

global_step/sec;D+Ş�c      !�O	����P�A�Z*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�(�>
�
 dnn/dnn/hiddenlayer_0_activation*�   @$@      �@! �����@)ɡ����@2�        �-���q=�FF�G ?��[�?I�I�)�(?�7Kaa+?��%>��:?d�\D�X=?���#@?
����G?�qU���I?<DKc��T?ܗ�SsW?��bB�SY?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?&b՞
�u?*QH�x?o��5sz?���T}?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             (�@              �?              �?              �?      �?               @              @       @              �?               @              �?      �?      �?              �?       @       @       @      �?      �?              �?              @      @      �?              @      �?      @       @      @      @      @      @      @       @      $@      @      @      @      (@       @      *@      2@      7@      (@      .@      .@      3@      >@      =@     �A@      B@      @@      I@     �H@      B@     �N@      L@      R@     �P@      U@      Y@     �U@     @U@     �Y@      [@     �X@     �W@     �V@     �V@      Y@     �V@      U@     �Q@      K@      A@      D@      C@      ?@      3@      @      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   �>_n@      �@! ����@)d�|3��fA2�        �-���q=��]$A�?�{ �ǳ�?W�i�b�?��Z%��?�1%�?\l�9�?�E̟���?yL�����?ܔ�.�u�?��tM@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             x�@              �?              �?              �?              �?              �?              �?       @              �?              �?               @      �?      �?               @      �?      �?      @       @      @      $@       @       @      �?      @      @      3@      3@      $@      J@     �H@      M@     @`@     `a@     �a@     �h@      [@     �X@      @@      ,@      A@      ;@      @      6@      Q@      =@      ,@      $@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �
#�@      �@!  (ˏ�"A)�^u.��A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              �?       @      ,@      1@      7@      @@      <@      9@      :@      3@      2@     �A@      ?@      8@      ,@      @      "@      "@       @      @      .@      3@      @      @      �?        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   `�Ե@   @�{�@      P@!   ߑ�,A)��$�]�B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?      @      @      @      @      @      @      @      @       @       @      @       @              �?      @              @      �?       @      �?        

lossF��I9�,|&       sO� 	%J��P�A�[*

global_step/sec@MD���S      } 	����P�A�[*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_0_activation*�   �|$@      �@! �C�*�@)�LʖY��@2�        �-���q=+A�F�&?I�I�)�(?�7Kaa+?��bȬ�0?��82?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?Tw��Nof?P}���h?�N�W�m?;8�clp?uWy��r?*QH�x?o��5sz?>	� �?����=��?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@              �?       @              �?              �?              �?              �?               @       @      @              �?              �?              �?      �?              �?              �?              @      @       @              @       @      �?      @      @      �?      @      @      @      @      @       @       @      @      *@      @      $@      .@      @      &@      ,@      "@      0@      7@      .@      1@      5@      6@      9@     �@@     �A@      9@     �B@      D@     �I@      K@      F@     @Q@      Q@     �P@      Q@     �Z@     �U@     �S@      S@      X@     �W@     �]@     @S@     @S@     �N@     @P@      K@      A@     �@@      G@     �F@      >@      5@      @      3@      @      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�ݑ>
�
 dnn/dnn/hiddenlayer_1_activation*�   `Xn@      �@! `z�n�@)�&Vj�bA2�        �-���q=�^��h��?W�i�b�?�iZ�?+�;$�?cI���?yL�����?S�Fi��?ܔ�.�u�?��tM@u�rʭ�@�DK��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             �@               @              �?      �?              �?              �?               @              �?      �?      @      �?              @      �?               @       @       @      @       @      @      "@      @      @      @      @      @      *@      .@       @      D@     �Q@     �Y@     �a@     �]@     @d@     @p@      a@     �S@      C@      9@      @              @      4@      ;@      0@      ,@      $@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   `� �@      �@!  Д�ZA)9�
Ƿ�A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              @      $@      6@      <@      C@      B@      >@      =@      7@      .@      5@     �A@      6@      .@      *@      $@      @              @      "@      @      @      @      �?        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ����@    b}�@      P@!  ��(A) }&��0	B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              @      @      @      @      @       @      @      @      @      �?       @      @       @      �?      �?               @      �?      �?      �?        

lossn�I���&       sO� 	�ؖ�P�A�\*

global_step/sec�j
Dj�p�C      !(�	���P�A�\*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesH�>
�
 dnn/dnn/hiddenlayer_0_activation*�    �3#@      �@! @p̅�@)���E6�@2�        �-���q=U�4@@�$?+A�F�&?��82?�u�w74?���#@?�!�A?
����G?�qU���I?IcD���L?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�#�h/�?���&�?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@�������:�             @�@              �?              �?               @               @       @              �?      @      @       @      �?      @       @      @      @      @      @              @               @      @      @      @      @       @      @       @      @      @              �?               @               @       @      @              �?       @      @      @      @      @      @      �?      @      @      @              @      $@      @      &@      "@      @      *@      ,@      @      0@      6@      ,@      7@      1@      8@      C@      =@      B@      @@      H@     �J@      G@     �M@      E@     @Q@      Q@      S@     @S@      [@      V@     @Q@      Q@     �U@     �V@     �X@     �S@     �T@     �O@      M@      L@      G@      I@      K@      H@      ?@      9@      1@      @      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesff�>
�
 dnn/dnn/hiddenlayer_1_activation*�   @D^k@      �@! �&�t��@)&�dbA2�        �-���q=h�5�@�Š)U	@u�rʭ�@�DK��@��h:np@S���߮@)����&@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             ��@              �?              �?              �?      �?              @      @      @       @      @      @      @      @      @              @      @       @       @      @      @      .@     �E@     �P@     �a@     �h@     �`@     @f@     �j@     �U@     �C@      ;@      4@      (@      ,@      0@       @      >@      C@      (@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   `'=�@      �@!  P� A)E~�uv��A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              �?       @      (@      .@     �A@     �H@     �A@      @@      ;@      <@      ?@      =@      &@      @      (@       @      @      @      @      @      @      ,@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �K�@   ���@      P@!  ����(A)(W���Y
B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?      @      @      $@      @      @      @       @       @      @      @       @      �?       @              �?      �?              �?      �?      @        

loss�4�I��&       sO� 	c͢�P�A�\*

global_step/sec^�DC�KC      F�r�	�2��P�A�\*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values33�>
�
 dnn/dnn/hiddenlayer_0_activation*�   `�8#@      �@!  AOE��@):hDR�h�@2�        �-���q=�vV�R9?��ڋ?ji6�9�?�S�F !?uܬ�@8?��%>��:?���#@?�!�A?�T���C?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?���J�\�?-Ա�L�?eiS�m�?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@�������:�             ��@               @              �?               @              �?      �?              �?      �?      �?      @      �?      �?       @      @      �?      �?              �?       @      �?       @              �?       @      �?      �?      �?      �?              �?       @              �?       @       @       @              �?              �?              @      �?       @      �?      @       @      �?      @      &@      @       @      @      @      @      $@      3@      @      2@      *@       @      ,@      *@      $@      0@      7@      7@      6@      <@      ?@      C@      C@      C@     �M@      E@      I@     �N@     �P@     �S@     �O@     @V@      T@     @U@     @Y@     �W@      `@     �_@      T@     @T@     �M@     �U@     �P@      J@     �C@      G@     �K@      E@      ?@      8@      .@      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesff�>
�
 dnn/dnn/hiddenlayer_1_activation*�   �(o@      �@! P��i��@)R��eA2�        �-���q=�lDZrS?<DKc��T?^�S���?�"�uԖ?�v��ab�?�/��?\l�9�?+Se*8�?�iZ�?+�;$�?cI���?�P�1���?S�Fi��?ܔ�.�u�?w`<f@�6v��@�Š)U	@u�rʭ�@�DK��@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ��@               @               @               @              �?               @              �?              @              �?              �?      @              �?      �?      �?               @      @              @              �?      @       @      @       @       @      �?      @      "@      E@      D@      @     �G@     �U@     �R@      T@      P@     @\@     �g@     `d@     @\@     �M@      K@      1@      �?      @      5@      H@      :@      .@      *@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   `ݗ�@      �@!  h���!A)��6�y�A2�        �-���q=o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              @      ;@      ?@      6@      >@      7@      >@      7@      $@      (@      :@      7@      9@      8@      4@      $@              @      *@      (@      @      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �� �@   @��@      P@!  @�}Y+A)p
��MB2�1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�               @      @      @      @       @      @              @      �?      @      @      @      @       @              @      �?       @      �?        

loss�PJ��'T&       sO� 	m���P�A�]*

global_step/secz�C0��c      !�O	|���P�A�]*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesR��>
�
 dnn/dnn/hiddenlayer_0_activation*�    j�$@      �@! ���X&�@)��F�7�@2�        �-���q=a�Ϭ(�>8K�ߝ�>��ڋ?�.�?��VlQ.?��bȬ�0?��82?�u�w74?��%>��:?d�\D�X=?a�$��{E?
����G?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             <�@              �?              �?               @      @      @              �?               @              �?      �?              @       @              �?      �?              @               @       @       @              �?      �?              �?              �?               @              @       @      @      @       @      @      �?      @      @      @      @      @      @      $@      "@      $@      @       @      &@      &@      @      &@       @      1@      3@      5@      6@      9@      9@      =@      =@      >@      D@     �G@     �A@      Q@      Q@     �L@     �Q@     �Y@     �V@     �V@     �W@     @Y@     �[@      [@     �P@     �L@      L@     �L@      E@      B@     �A@      G@     �D@      B@      A@      (@      0@      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�ݑ>
�
 dnn/dnn/hiddenlayer_1_activation*�   `v�l@      �@! �S���@)��Q[�bA2�        �-���q=��%>��:?d�\D�X=?�#�h/�?���&�?%g�cE9�?��(!�ؼ?�P�1���?3?��|�?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@�Š)U	@u�rʭ�@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             �@              �?              �?              �?              �?              �?              �?              �?              �?               @      �?              @       @       @      �?      @      (@      @      @      @       @      @      *@      ,@      "@      H@     �N@     @X@     �a@     �]@     �d@     �p@     `d@      O@     �D@      @       @      &@      ;@      @      =@      1@      5@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �r��@      �@!  SK�A)�u�|��A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@               @      $@      7@     �B@     �E@     �H@      5@      3@      4@      (@     �A@      >@      .@      &@      .@      @               @      @      @       @       @      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ����@   @PE�@      P@!  @���'A)�~��)qB2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@�<�@P�w\�u�@{i�.�@n��r ��@Fp4K�^�@�������:�               @      @      &@      @      @      �?      @       @      @      @      @       @       @       @               @               @       @        

lossh<�I��7�&       sO� 	Ne��P�A�^*

global_step/secg�Du':W       ���	i���P�A�^*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesq=�>
�
 dnn/dnn/hiddenlayer_0_activation*�    ̚#@      �@! ����i�@)�RIt���@2�        �-���q=��82?�u�w74?��%�V6?���#@?�!�A?�T���C?IcD���L?k�1^�sO?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?hyO�s?&b՞
�u?���T}?>	� �?���J�\�?-Ա�L�?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@�������:�             ��@              �?      �?              �?      �?              �?               @               @      @               @               @               @               @               @              @               @               @              �?       @      @      @      @      �?      �?      @              �?      @      @      @      @      "@      @      "@       @      .@      @      0@      $@      1@      ,@      *@      1@      .@      (@      5@      ;@      D@      F@      ?@      D@     �J@     �C@     �@@     �J@      M@     �F@     �E@     �O@     �S@      M@     �R@     �N@      R@     @Y@      S@     @S@     �T@      V@     �S@     �Q@     �K@      P@      J@      D@      6@      2@       @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesDD�>
�
 dnn/dnn/hiddenlayer_1_activation*�   ���n@      �@! �T;/��@)���eA2�        �-���q=�@�"��?�K?�?\l�9�?+Se*8�?ܔ�.�u�?��tM@u�rʭ�@�DK��@زv�5f@��h:np@S���߮@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             �@               @              �?              �?               @               @      @               @      @       @      �?       @      �?       @      �?      @      @      �?      @       @      @      @      .@      1@      0@      P@     �I@     �G@     �[@     �\@     �g@     p@     �b@     �R@      O@      @       @      *@      @      :@     �Q@      "@      @      (@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    }�@      �@!  r^? A)e|��'�A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              �?      2@      3@     �B@      G@     �F@      <@      *@      3@      0@      @      7@      >@      2@      ,@      @      �?      @       @      @      3@      (@      �?      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ����@   ���@      P@!   ��(A)?�aJetB2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              @       @       @      "@      @      �?      @      @      �?              @      @      �?       @              �?              @      @              �?        

loss�n�IF)k&       sO� 	~T��P�A�_*

global_step/sec'D�3      [oS�	�v��P�A�_*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_0_activation*�    t�'@      �@! ��x�@)6�3t�	�@2�        �-���q=��~]�[�>��>M|K�>��Zr[v�>O�ʗ��>>h�'�?x?�x�?ji6�9�?�S�F !?��82?�u�w74?��%�V6?uܬ�@8?��%>��:?d�\D�X=?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?hyO�s?&b՞
�u?*QH�x?���T}?>	� �?����=��?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@�������:�             Ԓ@               @               @              �?              �?               @               @              �?               @               @      @               @      �?      �?               @              @              �?              �?      �?               @      �?              �?      �?              �?       @      �?      �?              @       @       @      @      @      @      �?       @      @      �?              "@       @      @       @       @       @       @      @      @      $@      $@      0@      (@      (@      (@      3@      3@      3@      8@      :@      =@      >@      A@     �B@      >@     �E@      B@      G@     �L@     �L@      I@     �R@      R@     �M@      V@     �R@     �S@     �X@      S@     �Q@     �N@     �S@     �S@     �F@     �J@     �I@     �H@     �D@      6@      ,@      F@       @      @       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�    �Fn@      �@! @�?9 �@)5?-\�eA2�        �-���q=���g��?I���?�Z�_���?����?ܔ�.�u�?��tM@w`<f@�6v��@�Š)U	@u�rʭ�@زv�5f@��h:np@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ��@              �?              �?               @               @              �?               @              �?      �?       @       @       @              @      @      @      @       @      @      @      @      @      7@      :@      .@      L@     @S@     �Y@      f@     @_@      _@     @e@     @Y@     �N@     �R@      :@      @      $@      @@      >@      3@      @      5@      ;@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   `<'�@      �@!  ��m� A)i���A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@               @      @       @      5@     �@@      A@      L@     �@@      &@      .@       @      1@      A@      ;@      &@      (@      @       @       @      @      &@       @       @      @      (@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   `�ٴ@   @���@      P@!  �-�~)A)���1B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@�<�@P�w\�u�@%4�>�@{i�.�@Fp4K�^�@�{���N�@�������:�               @       @      @      @      $@      @       @      �?       @      @      �?       @      @              @               @      �?       @              @        

loss��I�Um~&       sO� 	���P�A�`*

global_step/secL�D����s      }�`	6���P�A�`*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values=
�>
�
 dnn/dnn/hiddenlayer_0_activation*�   @��'@      �@! @Aݾ�@)��E�rC�@2�        �-���q=�ߊ4F��>})�l a�>��ڋ?�.�?I�I�)�(?�7Kaa+?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?Tw��Nof?P}���h?ߤ�(g%k?;8�clp?uWy��r?o��5sz?���T}?���J�\�?-Ա�L�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@�������:�             ؏@              �?              �?              �?              @       @      �?       @              @      @              �?              �?              �?       @              �?              �?              �?               @               @              �?      �?              �?              @       @      @      @      @      @      @      @      �?      @      "@      @      @      @      @      @       @      @       @      "@      @      ,@      0@      ,@      5@      ,@      2@      2@     �B@      ;@      ?@     �B@     �A@      D@      F@     �E@     �I@      K@     �N@      P@      T@     @Q@     �O@      T@     �V@     @[@      a@     @Y@     �T@     @U@     �V@      T@     �R@     �M@      M@      C@      9@      ?@      =@      .@       @      �?      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   @t�n@      �@! l����@)�傻�XeA2�        �-���q=^�S���?�"�uԖ?\l�9�?+Se*8�?�6v��@h�5�@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�              �@              �?              �?              �?               @      �?      @       @       @       @      @       @      @      &@      �?      @      �?      @      �?       @      $@      *@     �I@     �P@     @T@     @a@     @_@     �a@     �f@     �]@      S@     �Z@      B@      2@       @      5@      3@      @@      <@      &@      (@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    an�@      �@!  ��!A)������A2�        �-���q=֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              �?              @      $@      ,@      7@      =@     �B@      :@      :@      0@      1@      6@      >@      5@      &@      ;@      3@       @      @      @      @       @      *@      @      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    8��@     ��@      P@!   H+A)�O���sB2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?      @      @      @      @      @      @      @      �?      @       @      @      @      �?      @      �?      �?      �?      �?      �?      �?       @      �?        

loss���Iwz��&       sO� 	q���P�A�`*

global_step/sec�C���      [�e0	^7��P�A�`*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values��>
�
 dnn/dnn/hiddenlayer_0_activation*�   @��$@      �@! ����T�@)vmuGHn�@2�        �-���q=ji6�9�?�S�F !?�[^:��"?U�4@@�$?d�\D�X=?���#@?�T���C?a�$��{E?
����G?�qU���I?IcD���L?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@              �?              �?               @              �?              @       @               @      �?      @      @       @      @              �?      �?       @      @      @       @       @              �?       @      @       @      �?      @      �?       @              �?      �?              �?      �?      �?      �?              �?      �?       @              @               @      @      �?      @      @      @      @      $@       @      @      @      1@      "@      "@      &@      "@      *@      4@      *@      .@      2@      &@      :@      ;@      :@      9@     �A@     �C@      I@      C@      J@      K@     �L@     @P@     @R@      N@     �V@      R@     @P@     �Q@      W@     �[@      U@     �G@     �Q@      T@     @R@     @S@     �O@     �Q@     �B@     �D@      <@      0@      7@      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesww�>
�
 dnn/dnn/hiddenlayer_1_activation*�   @�.n@      �@! �8���@)�im��eA2�        �-���q=-Ա�L�?eiS�m�?#�+(�ŉ?�/�*>�?�g���w�?I���?����iH�?��tM@w`<f@�6v��@h�5�@�Š)U	@زv�5f@��h:np@S���߮@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             H�@              �?      �?              �?              �?              @      �?               @               @       @               @      @       @       @      @      �?       @      �?      ,@      @       @       @      @      "@     �C@     �D@      @      ;@      J@     @[@     �`@     @\@     `d@     �a@     �\@     �Z@     �P@      0@      &@      *@      (@      B@     �H@      ,@      ;@      "@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ��@      �@!  p�6!A)�Ie��A2�        �-���q=o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              @      <@      B@     �G@      >@      5@      :@      7@      .@       @      5@      8@      1@      1@      &@      @      @       @       @      .@      $@      "@      @      �?        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   @HB�@   �m��@      P@!  ��#�*A)��.ta�B2�1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              $@      @      "@      @      �?      @       @      @              @      @       @       @      �?      �?              �?      @      �?       @      �?        

loss�i�I��d&       sO� 	/>��P�A�a*

global_step/sect��C��P��      ^d�	����P�A�a*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�¥>
�
 dnn/dnn/hiddenlayer_0_activation*�   `�(@      �@! @��l�@)�C��@2�        �-���q=��[�?1��a˲?�S�F !?�[^:��"?�u�w74?��%�V6?�T���C?a�$��{E?
����G?�qU���I?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?����=��?���J�\�?-Ա�L�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�������:�             0�@              �?               @              �?               @               @               @       @       @              @      �?              @      �?       @               @               @      @              @              �?      �?              �?              �?      @      @      @      @      @              @      @      �?      @      @      @      @      @      *@      (@      @      @      @      @      $@      *@      2@      (@      &@      ,@      6@      @@      3@      :@      >@      >@      E@     �B@     �B@     �I@     �I@     �J@     �F@     @S@     �Q@     �P@      V@     �S@      Y@     �]@     �X@     @X@      X@     �X@     @V@     �Q@     �R@     �P@     �L@      F@      ;@      4@      5@      @      @               @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesff�>
�
 dnn/dnn/hiddenlayer_1_activation*�   �e n@      �@! `��RY�@)"-��gA2�        �-���q=�l�P�`?���%��b?�Ca�G��?��7��?�1%�?\l�9�?h�5�@�Š)U	@u�rʭ�@زv�5f@��h:np@S���߮@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             �@              �?               @              �?              �?       @              �?      �?              �?              @              @              @      �?       @       @       @       @      @      @       @      @       @      *@      H@     �L@     �E@     �Z@     �\@     �e@     �h@     �]@     �Z@     �X@      *@      2@      5@      D@      2@      I@      =@      3@      "@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    ��@      �@!  ���B"A)�G��R��A2�        �-���q=֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@               @              @      3@      8@      <@      4@      @@      9@      @      "@      (@      0@     �A@      C@      2@      5@       @      @      @      "@      "@      .@      ,@      @       @      �?        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    ���@   `���@      P@!  �{�",A)���~B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�               @      @      @       @      @      @      �?               @      @      @      @      @              @              �?      @              �?      @       @      �?        

loss��I��&       sO� 	����P�A�b*

global_step/sec�C�$�.c      !�O	����P�A�b*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full��0?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesף�>
�
 dnn/dnn/hiddenlayer_0_activation*�   �4!(@      �@! @{�N�@)\��͛�@2�        �-���q=I�I�)�(?�7Kaa+?��VlQ.?�u�w74?��%�V6?��%>��:?d�\D�X=?�!�A?�T���C?
����G?�qU���I?IcD���L?nK���LQ?�lDZrS?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?*QH�x?o��5sz?���T}?>	� �?����=��?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�������:�             ��@              �?       @               @              �?              �?               @       @               @              @              �?               @      @      �?      @       @              @      @      �?      @              �?              @               @      @      @       @       @      @      @              @       @      �?      @       @              &@       @      &@      *@      @      @      @      @      &@      ,@      4@      1@      @      .@      <@      4@      5@      C@      ?@      F@     �E@     �E@      K@     �F@      K@      R@     @Q@     @U@     @S@     @S@     �Y@     �Y@     �a@     �[@     @Z@     @Z@     @U@     �T@     �K@      F@     �J@      E@     �G@      I@     �D@      :@      @       @              �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesff�>
�
 dnn/dnn/hiddenlayer_1_activation*�    E�n@      �@! 0Z����@)f�U�zhA2�        �-���q=��(!�ؼ?!�����?�@�"��?�K?�?uo�p�?2g�G�A�?w`<f@�6v��@u�rʭ�@�DK��@زv�5f@��h:np@a/5L��@v@�5m @��@�"@�ՠ�M�#@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ��@              �?              �?               @               @              �?               @               @       @      �?               @      �?              *@      @      �?              @       @      5@      9@      @      ;@     @P@      J@     �\@      ]@     �`@     �o@      `@     �T@     �J@      >@       @      @      @      1@      I@      F@      ?@      4@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �+b�@      �@!  ��K�"A)?�$�@�A2�        �-���q=֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              �?               @      $@      0@      9@      7@      ?@      8@      &@      1@      ,@      .@     �L@      E@      3@       @      &@      @              @      &@      4@      (@      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    ��@   ����@      P@!  ���-A)2W٣�B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?       @      @      @      @      @      �?      @       @      @      @      $@      @      �?      �?       @              �?       @      @       @        

loss@<�Iص��&       sO� 	��
�P�A�c*

global_step/sec�"�C j�s      }�`	�
�P�A�c*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values��>
�
 dnn/dnn/hiddenlayer_0_activation*�   ��q#@      �@! �'fgE�@)RV?�ٳ�@2�        �-���q=>�?�s��>�FF�G ?1��a˲?6�]��?�T7��?�vV�R9?uܬ�@8?��%>��:?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?Tw��Nof?P}���h?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@�������:�             $�@              �?              �?              �?              �?              �?              �?               @      �?              @              �?              �?      @              �?      @       @       @       @              �?              @              @       @               @      @      �?      @      @      ,@      @       @      �?      @      &@      @      @       @      �?      &@      "@      @      $@      5@      ,@      $@       @      $@      5@      .@      ,@      5@      =@      =@      ;@      <@      ;@      F@     �E@     �B@     �I@      D@     �D@      D@     �K@     �O@     �K@     �S@     @R@      O@     @P@     �P@     �N@     �U@     @S@     �Q@     �U@     �U@     @R@     �Q@     �P@     �J@     �G@      <@     �@@      7@      "@      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values��>
�
 dnn/dnn/hiddenlayer_1_activation*�   `L	k@      �@! @����@)ų�rU�cA2�        �-���q=�QK|:�?�@�"��?\l�9�?+Se*8�?+�;$�?cI���?�E̟���?yL�����?�6v��@h�5�@�Š)U	@�DK��@{2�.��@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             8�@              �?              �?               @              �?              �?      �?              �?              �?              @       @       @              �?      @      @      &@      @       @      *@      @      @      .@      ,@      *@      L@     �S@     �U@      b@     �^@     �Y@     �i@     �c@     �]@      G@      0@      0@      @      $@      1@     �B@     �@@      (@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    �@      �@!  ,�O A)_zє{2�A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@               @      @      0@      8@      D@      N@     �B@      :@      .@      &@      1@      (@      5@      7@      5@      $@      @       @      �?      @      "@      0@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   @���@    �m�@      P@!  �#d))A){��g
�B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?      @      @       @      &@       @      @      �?      @       @      �?      @      �?      @      �?      �?              �?      �?      �?      @        

loss�J�I�!33&       sO� 	�{�P�A�d*

global_step/sect�C���      $��z	q��P�A�d*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�Gq>
�
 dnn/dnn/hiddenlayer_0_activation*�   ���$@      �@! �YHl�@)2���m�@2�        �-���q=�7Kaa+?��VlQ.?��bȬ�0?d�\D�X=?���#@?�!�A?�T���C?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�#�h/�?���&�?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@              �?       @              �?              @              �?               @               @      @      @              @      �?      @       @      �?      �?      @      @      @               @               @      @       @               @               @      �?               @      �?      @      @       @       @      @       @       @      @      �?       @      �?      �?      @      @      @      @      @      @      @      @       @      ,@      &@      3@      2@      2@      5@      6@      @@      B@     �H@      C@     �G@      C@      C@     �K@     �P@      M@     �P@      V@     @W@      V@     @W@     �_@      ]@     �c@      ]@     �Z@      \@     �W@      R@      R@      D@     �M@     �G@     �G@     �F@     �B@      2@      "@      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   ೻n@      �@! p퓥��@)>�8�iA2�        �-���q=�iZ�?+�;$�?�Š)U	@u�rʭ�@�DK��@{2�.��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             H�@              �?               @               @              �?              �?      �?       @       @      @      @      "@              @      �?       @      �?      �?      @       @      0@      J@     �W@     �S@     �]@      b@      m@     @e@     @V@      N@      (@      �?      @      @      *@     @P@      D@      I@      &@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ��i�@      �@!  �6�L$A)�"�C��A2�        �-���q=o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              @      @      2@      8@      4@      $@      .@      4@      3@     �B@     �I@      C@      :@      6@      $@       @              �?      .@      6@      *@      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   `��@   �e��@      P@!  �%�\/A)�a�ݖ�B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?       @      @      @       @       @      @       @      @      @      "@      @      �?      @              �?      @      @      �?        

loss`J�|~&       sO� 	5�%�P�A�d*

global_step/sec�%D�B�C      !(�	�-&�P�A�d*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesH�>
�
 dnn/dnn/hiddenlayer_0_activation*�    l�#@      �@!  b����@)��v���@2�        �-���q=�iD*L��>E��a�W�>+A�F�&?I�I�)�(?�u�w74?��%�V6?uܬ�@8?��%>��:?
����G?�qU���I?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?���%��b?5Ucv0ed?�N�W�m?;8�clp?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@�������:�             ��@              �?              �?              �?              �?              @              �?              �?      �?              �?              �?              �?              �?              �?               @       @               @              �?      @              @      �?              @      @       @      @      @      @       @               @       @      @       @      @      @      $@      (@       @       @      @      &@      $@      0@      .@       @      6@      &@      *@     �A@      ;@      @@      4@      G@      E@      >@      E@      H@     �J@     �M@     �N@     �P@     @P@     �P@     �Q@     �U@     @X@     �W@     �W@     �T@     �U@     �V@     @U@      T@     @V@     �R@      M@      H@      9@      <@      &@      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesww�>
�
 dnn/dnn/hiddenlayer_1_activation*�    �n@      �@! �6"��@)P'��R~gA2�        �-���q=8/�C�ַ?%g�cE9�?\l�9�?+Se*8�?�Š)U	@u�rʭ�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ��@               @              �?              �?              �?              �?               @              @      @       @      @      @      �?              @      �?      �?       @       @       @      @       @      @      B@     �F@     @S@     �`@     �`@     �i@      c@     �b@     @V@     �H@      =@      2@      &@      8@      @@     �A@      6@      5@      6@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ��Z�@      �@!  �X#"A)�~��x��A2�        �-���q=o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              .@      "@      ?@      @@      H@      =@      4@      1@      @      3@      *@      ;@      ;@      .@      *@       @      @      @      @      (@      (@      @      @      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   `��@    %��@      P@!   �Q,A)@��e�B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�               @      @      @      $@      @       @      @      �?      �?      @      �?      "@              @      �?      �?      �?       @               @       @       @        

loss�J?��&       sO� 	).3�P�A�e*

global_step/secXm�C��2�      ~H:�	�R3�P�A�e*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values  �>
�
 dnn/dnn/hiddenlayer_0_activation*�   @��#@      �@! �7sZt�@)�:>�H�@2�        �-���q=�.�?ji6�9�?�[^:��"?U�4@@�$?��bȬ�0?��82?uܬ�@8?��%>��:?���#@?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@�������:�             x�@              @              �?              �?              @              @              @      @      �?      @              �?      �?      �?              @              @       @              �?       @      �?      @      @      @              @              @              @      �?      @      �?               @      @              �?              @      �?      @      @      @       @              @      @      @      @              �?      "@      @      @       @      $@      @      @      @      @      ,@      2@      6@      "@      (@      9@     �@@      <@      >@     �A@      :@      E@     �D@     �K@      L@     �K@      O@     �S@     @U@     @S@     �R@      T@      X@     �]@      \@     �X@      V@     @V@      Z@     @U@      R@      N@     �M@      E@      :@      4@      *@      @      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   �2�j@      �@! ���k��@)٥���QcA2�        �-���q=}Y�4j�?��<�A��?��7��?�^��h��?yL�����?S�Fi��?h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@زv�5f@��h:np@S���߮@)����&@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�              �@              �?              �?              �?               @      @              �?               @               @              �?      @       @      �?       @      @       @      @      @      �?      @      �?      @      @      (@      5@      *@      N@      P@     @P@     �^@     @]@     �e@     �e@      ]@     @Z@     �Y@      0@      4@      @      0@      2@     �C@      :@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �԰@      �@!  �>K/!A)�7tU�A2�        �-���q=o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              @      $@      5@      C@      I@     �B@      ,@      $@       @      ,@      >@      >@      8@      ?@      0@      @      @      @      @      $@      (@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ��%�@    }4�@      P@!  �y��*A)T!|.�6B2�1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              @      @      &@      @      @       @      �?       @      @      @      @      @      @      �?      �?      �?               @      �?       @        

loss�I�(&       sO� 	[�;�P�A�f*

global_step/sec�[8D=MT�      |읅	�<�P�A�f*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesff�>
�
 dnn/dnn/hiddenlayer_0_activation*�   ���$@      �@! @�x�@)��/�@2�        �-���q=�7Kaa+?��VlQ.?��%�V6?uܬ�@8?��%>��:?d�\D�X=?���#@?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?�#�h/�?���&�?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@               @               @       @              �?               @      �?              �?              �?              �?              @              �?               @       @               @      �?      @      @      @              @              �?              �?      @       @      @      �?      @      @               @       @      @      @      @      @       @      @      @      @      @      $@      ,@      @      @      &@      @      &@      0@      1@      0@      *@      1@      7@      A@     �E@      :@     �H@      A@      P@     �A@      J@      L@     �Q@     @S@     �M@      X@     @S@     �R@     �T@     �T@     �U@     @Z@     �Q@      S@     �R@     �U@      R@     �M@      P@      N@     �G@     �G@      7@      *@       @      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesww�>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��$l@      �@! `�Ǻ4�@)&ݨ�WcA2�        �-���q=�iZ�?+�;$�?h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             8�@              �?              @      �?               @      �?               @       @      �?      �?       @      @       @      @      @      @      @               @      @      @@      C@      &@      E@      U@     �]@      ^@     @Z@     �^@     �c@      e@     @Q@      L@      0@      2@       @      1@      ?@     �D@      ,@      0@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �]��@      �@!  xD� A)"���A2�        �-���q=o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              &@      8@      >@      :@      <@      :@      ?@      8@      *@      5@      ;@      A@      2@      (@      "@      @      @      @      *@      $@      @      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �]ֶ@   �i(�@      P@!  ����)A)�Z�4��B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�               @      @      @      @      @       @      @      @       @      @      @      @       @       @              �?      �?              @      �?       @        

loss�	JW���&       sO� 	@�F�P�A�g*

global_step/sec�D����      xx��	_�F�P�A�g*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_0_activation*�    �$@      �@!  ���߱@)9V��o��@2�        �-���q=U�4@@�$?+A�F�&?���%��b?5Ucv0ed?Tw��Nof?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@               @               @       @               @               @              @      @              �?              @               @      �?              @      �?       @      �?      @      @      @      @       @      @      @      @      @      @      "@       @      @      @      (@      0@      @      "@      &@      .@      $@      "@      3@      0@      2@      5@      5@      =@     �@@     �J@     �E@      :@      K@     �E@     �F@      I@     @P@     @Q@      P@     �T@     @R@     @T@     �J@     �O@     �Q@     �Z@     �T@     �P@     @T@      T@     �Q@     @R@      J@      M@      F@      A@      5@      &@      @      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values33�>
�
 dnn/dnn/hiddenlayer_1_activation*�    �5l@      �@! ��#|��@)ɨ�-`�bA2�        �-���q=�/��?�uS��a�?�?>8s2�?yD$��?+Se*8�?uo�p�?�iZ�?+�;$�?S�Fi��?ܔ�.�u�?h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             @�@              �?              �?               @              �?              �?              �?       @              �?              @      �?      �?              �?      @      �?      �?      @              �?      @       @      @      @      @      @      @      0@      4@      &@     �E@     �K@      ]@     �b@     �^@     @b@     `h@     �`@     �X@     �R@      .@      0@      �?      @      ,@      E@      *@      2@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   `7Ǳ@      �@!  ���A)�ʹl�A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@               @      @      1@     �@@      D@     �G@      >@      9@      7@      .@      *@      8@      .@      1@      :@      *@      @       @               @      $@      &@      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ���@   ��?�@      P@!   �W�(A)��h��b
B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�               @      @      "@      @      @      @      @       @      @      �?      @      @      �?      @              �?               @      �?       @        

loss�
�I3��_&       sO� 	�P�P�A�g*

global_step/sec�)D�܆      G�A	WOP�P�A�g*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�(�>
�
 dnn/dnn/hiddenlayer_0_activation*�   �K$@      �@! ���.�@)<ҟ9f��@2�        �-���q=�T7��?�vV�R9?�S�F !?�[^:��"?I�I�)�(?�7Kaa+?��VlQ.?��bȬ�0?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@              �?              �?              �?              �?              �?      �?      �?      �?      �?      @      �?      �?      �?      �?      �?       @      �?              @      �?      @      @      @       @      �?              �?              �?      �?      �?      �?              @      �?      �?               @      �?       @              �?      @      �?      @      @      "@       @      @       @       @      @      �?      @      @      @      $@       @      &@      "@      ,@      @      (@      @      .@      *@      0@      2@      ,@      3@      <@      9@      @@      D@      <@     �G@      N@      E@     �H@      M@      C@      O@     �Q@      U@     �W@     �U@     @X@     �Z@      \@     �Y@     @T@     �R@      N@     �J@      J@      I@      E@      ;@      3@      6@      .@      1@      @      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesww�>
�
 dnn/dnn/hiddenlayer_1_activation*�    F�m@      �@! 𤘢�@)��h��aA2�        �-���q=\l�9�?+Se*8�?2g�G�A�?������?w`<f@�6v��@�Š)U	@u�rʭ�@زv�5f@��h:np@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             H�@              �?              �?              �?               @              @              �?      �?       @       @      @              @              @      &@      @      �?      @      @      "@      3@      9@      &@     �D@     �Q@     @P@     @[@      `@     �k@     �o@     @a@      Q@      =@      4@      >@      @      @      ,@      2@      ,@      &@      "@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ����@      �@!  Gt�A)z+1=�A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              @      *@      7@      B@      D@      E@      8@      2@      0@      2@      5@      B@      9@      .@      "@      @      $@      @      �?      @      @      @      @      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    ��@   ����@      P@!   �Ѽ'A)�]q(|B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              @      "@      @      @      @       @      @       @      @       @      "@      @      �?      �?      �?       @              �?              �?      �?      �?        

loss&5�I	�&       sO� 	2tZ�P�A�h*

global_step/secA�D.'�E#      &�S	h�Z�P�A�h*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesff�>
�
 dnn/dnn/hiddenlayer_0_activation*�
   ��#@      �@!  ��ڮ@)��b�:�@2�        �-���q=})�l a�>pz�w�7�>��VlQ.?��bȬ�0?���#@?�!�A?a�$��{E?
����G?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?o��5sz?���T}?>	� �?����=��?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?}Y�4j�?��<�A��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@�������:�             `�@              �?              �?              @              �?              �?              @               @      �?      �?              �?              �?               @               @      @      �?      @       @      @      @      @      @      $@      �?      @      @       @      &@      (@      @      &@      &@      "@      .@      0@      0@      *@      1@      4@     �A@      9@     �B@      C@      ;@     �K@      I@     �G@     @P@     �T@      T@     @R@     @Z@      V@     �T@      P@     �S@     �W@     �W@      R@      L@      K@     �K@      I@     �J@     �E@      =@     �A@      8@      .@      ,@      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   �A�f@      �@! 8,�|�@)&�F�H_A2�        �-���q=o��5sz?���T}?^�S���?�"�uԖ?�/��?�uS��a�?��(!�ؼ?!�����?S�Fi��?ܔ�.�u�?�6v��@h�5�@u�rʭ�@�DK��@زv�5f@��h:np@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�������:�             ��@              �?              �?              �?              �?               @              �?               @              @               @       @      @      @              �?       @      @      "@      @      @      @      @       @      4@      ;@       @      F@      H@     @R@     @_@     �`@     �g@     �h@     �e@     �b@      K@      @      8@      ,@      *@      @      &@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   @z�@      �@!  p3PA)��w)��A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�������:�              p@               @      @      8@      B@     �H@     �I@      >@      4@      *@      $@      5@      ;@      6@      :@      1@      @      @      @      @      @      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   `/��@   ���@      P@!  ��o�%A) b�.�B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@�������:�              �?      @      "@      "@      @      �?      @      �?      @      @      @      @      @      �?               @      �?              �?        

loss�p�I4��&       sO� 	B�g�P�A�i*

global_step/sec1u�C�_���      y���	��g�P�A�i*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values{�>
�
 dnn/dnn/hiddenlayer_0_activation*�   ���(@      �@!  �W���@)��f�ʞ�@2�        �-���q=ji6�9�?�S�F !?IcD���L?k�1^�sO?nK���LQ?�lDZrS?�m9�H�[?E��{��^?�l�P�`?Tw��Nof?P}���h?�N�W�m?;8�clp?*QH�x?o��5sz?���T}?>	� �?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�������:�             �@              �?              �?               @              @       @               @              �?              �?              �?              @               @              �?              @              @      @      �?      *@       @       @      @      �?      @      �?      &@      @      $@      @      @      ,@      (@      &@      "@      3@      1@      5@      :@      6@      9@      ?@      A@      J@      D@     �K@      G@      E@     �P@      T@     �M@     �R@     @S@     �S@     �R@     �M@      V@     �]@      `@     �W@      T@     �S@     �U@     @T@      U@     @R@     �S@     �A@      =@      7@      "@      @              �?              �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�ݕ>
�
 dnn/dnn/hiddenlayer_1_activation*�   �W\j@      �@! h���d�@)'��-4eA2�        �-���q=��<�A��?�v��ab�?+�;$�?cI���?ܔ�.�u�?��tM@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             ��@              �?               @              �?              �?       @      �?              �?      �?      @              �?      @      �?      �?      @      @      @      �?      @      @      @       @      @      @      (@      .@      "@     �A@     �L@     �P@     �Q@     @Q@      h@     �i@     @c@      X@     �U@     �Q@     �G@       @      "@      @@      J@      *@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �p��@      �@!  @[�!A)�~����A2�        �-���q=֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              �?      �?      �?      @      *@      E@      B@      C@      ,@      ,@      &@      $@      1@      B@      9@      3@      3@      5@      4@      @              $@      0@       @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ��~�@   �l.�@      P@!  �GlH+A)ZJ�a��B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?              @      $@       @       @      �?      @      �?      @      @      @       @       @      @      @      @              @      �?      �?        

lossx��I"��&       sO� 	��r�P�A�j*

global_step/secy�D�VF0�      ^d�	��r�P�A�j*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_0_activation*�   �;%@      �@! ��_v6�@)���۲�@2�        �-���q=�vV�R9?��ڋ?U�4@@�$?+A�F�&?I�I�)�(?��82?�u�w74?��%�V6?uܬ�@8?��%>��:?���#@?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?nK���LQ?�lDZrS?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?���%��b?5Ucv0ed?P}���h?ߤ�(g%k?�N�W�m?hyO�s?&b՞
�u?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�Rc�ݒ?^�S���?�"�uԖ?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@              �?              �?      �?              �?               @      �?              �?              �?              �?      �?               @              �?               @              �?               @      �?              @              �?              �?      �?      @      �?              �?      �?              @       @      �?       @      @       @      �?      @      @      @      @      @      @      @       @      @      4@      &@      (@      @      5@      ,@      &@      (@      @      (@      8@      2@      4@      @@      9@     �A@      >@     �B@      I@     �J@      ;@      I@     �L@      J@     �Q@     @Q@     �Q@     �R@     @S@     �U@     �[@     @`@     �T@     @Q@     �L@     @U@     �L@      H@     �J@     �D@     �C@      A@     �A@      2@      (@       @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�ݑ>
�
 dnn/dnn/hiddenlayer_1_activation*�    s#l@      �@! $�C��@)w>�z�IdA2�        �-���q=%g�cE9�?��(!�ؼ?�Z�_���?����?cI���?�P�1���?w`<f@�6v��@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             �@              �?              �?              �?               @              �?      �?              �?               @              �?      �?      @              @              �?      �?      @      @      @       @      @       @      @      .@      4@      "@      A@      I@     @P@     �]@     @Y@     �`@     �h@     �i@     �_@      Y@      C@      7@      (@      7@               @      1@      =@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �VƱ@      �@!  ��9 A)��#\�1�A2�        �-���q=o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              4@      1@      >@      @@     �D@     �@@      =@      *@      @      $@      ;@      9@      6@      4@      1@      $@      @      @      @              @       @      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    ���@   ��O�@      P@!  @%4)A)�/7aYAB2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@n��r ��@Fp4K�^�@�������:�              @      @      @      @      @      @      @               @      �?       @      @       @      @       @      �?       @              @        

loss�w�IQ	O�&       sO� 	[�|�P�A�k*

global_step/secN�D�Sos      }�`	8�|�P�A�k*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values��>
�
 dnn/dnn/hiddenlayer_0_activation*�   `C�(@      �@! ��N䈱@)�U�,��@2�        �-���q=�7Kaa+?��VlQ.?��%>��:?d�\D�X=?���#@?�!�A?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?hyO�s?&b՞
�u?*QH�x?o��5sz?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�������:�             \�@              @              �?              @              @      �?      �?      �?              @      @      �?              �?      @      @      �?       @      �?      �?              �?              �?              @              �?               @              �?      �?       @      @      �?              @      @       @       @      "@      @      @       @      @      @      *@      @      (@       @      (@      1@      &@      @      $@      .@      ,@      3@      5@      1@      @@      5@      >@     �C@     �H@     �A@      K@     �B@      J@     @R@      M@      I@     �S@      P@     �W@      U@     �T@     �U@     �[@     �]@     �T@      T@      Q@      S@     @Q@      G@     �J@     �L@      I@      6@      &@      @      @      @       @               @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesUU�>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��Lh@      �@! d�����@)��}@�ybA2�        �-���q=�7c_XY�?�#�h/�?Ӗ8��s�?�?>8s2�?cI���?�P�1���?u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@�������:�             ��@              �?              �?              �?               @              �?               @              �?              @              @      @      �?               @      @      @              @      @       @      &@      0@      ,@     �E@      C@     @U@      `@     �P@     �d@      q@     �e@     �R@     �M@      >@      0@      8@     �B@      *@     �B@       @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    -֮@      �@!  �')1A)����A2�        �-���q=֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�������:�              p@               @       @      @      @      .@      A@     �B@      G@      ;@      *@      8@      ,@      ,@     �D@      >@      ,@      &@      @      @      @      "@      "@      &@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ��d�@   ���@      P@!   ?A<(A){ÍNIB2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@�������:�               @       @      @      @      $@      @              @      @       @      @      "@       @       @       @              �?      @              �?       @        

lossc�nI�YW�&       sO� 	?��P�A�k*

global_step/sec[D�mԓ      X�C	Gx��P�A�k*�!
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesR��>
�
 dnn/dnn/hiddenlayer_0_activation*�   `�$@      �@!  ;)��@)Cݑ����@2�        �-���q=a�Ϭ(�>8K�ߝ�>�5�i}1?�T7��?�S�F !?�[^:��"?U�4@@�$?�7Kaa+?��VlQ.?��bȬ�0?��82?uܬ�@8?��%>��:?d�\D�X=?���#@?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             8�@              �?              �?              �?      �?              �?              �?              �?              �?              �?               @      �?              �?      �?      @       @      �?      @       @      �?      @      @      @      @      �?      @      @      @              �?      @              �?              �?              @              @              @               @      �?      �?      �?      @       @      �?      0@      3@      �?      "@      @      �?      @      @      @      �?       @      @      *@      (@      @      "@      $@      @      &@      2@      @      2@      2@      4@      E@      3@      @@      <@     �A@     �A@      ?@     �G@     �B@      O@     �E@      G@      N@     �N@     @P@      H@      P@     �S@     �W@     @Y@     �U@     �R@     �S@      [@     �X@      T@     �T@     �U@      R@      K@      C@      8@      (@      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values  �>
�
 dnn/dnn/hiddenlayer_1_activation*�   �M�k@      �@! ���w>�@)�k5y�iA2�        �-���q=\l�9�?+Se*8�?cI���?�P�1���?3?��|�?�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             Ё@              �?               @      �?              @      �?               @              �?              �?              @      @      �?      �?      �?      �?      �?      @      @      @      �?       @      @      @      @      @      @      I@     �T@     �R@     �[@     �Y@     @]@      e@     @^@     �S@     @X@     �D@      5@      &@      :@     �F@     �T@      E@      ,@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ����@      �@!  ���E#A)��CT���A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@               @      "@      &@      4@      A@      L@     �B@      0@      *@      @      "@      0@      ,@      &@      8@      7@      $@      @      @      ,@      6@      3@      "@       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ���@    �)�@      P@!  @ω�-A) -W���B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�               @      @      @       @      (@              @               @      @       @       @      �?      @       @      �?      �?      �?      @      @       @        

loss���I^ϼ&       sO� 	����P�A�l*

global_step/sec�TDd��S      } 	͑�P�A�l*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesR��>
�
 dnn/dnn/hiddenlayer_0_activation*�    a�#@      �@!  QR�@)���}��@2�        �-���q=����?f�ʜ�7
?U�4@@�$?+A�F�&?I�I�)�(?�7Kaa+?��bȬ�0?��82?�u�w74?��%�V6?��%>��:?d�\D�X=?���#@?�!�A?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?ܗ�SsW?��bB�SY?���%��b?5Ucv0ed?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�#�h/�?���&�?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             H�@               @              �?              �?              �?               @               @       @      �?              �?      @              �?               @              �?              @              �?               @      �?              @              @               @      �?      @              @      &@       @      @      �?      @       @      "@      &@      (@       @      �?      @      $@      (@       @      &@      @      @       @      1@       @      6@      4@      8@      >@      9@      :@     �D@      F@      @@     �C@      C@      K@     �N@      D@     �K@     �N@      T@     �S@     �N@     �P@     �R@     �W@     �W@     �P@      G@      O@     �P@     �U@     @U@     �S@     �L@     �H@      I@      I@      A@     �B@       @       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values  �>
�
 dnn/dnn/hiddenlayer_1_activation*�    �m@      �@! �IC-��@)
��gA2�        �-���q=�u�w74?��%�V6?nK���LQ?�lDZrS?!�����?Ӗ8��s�?�DK��@{2�.��@زv�5f@��h:np@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             Ё@               @               @              �?              �?               @              �?      @              �?      @      @       @      @      @      @      @      @       @      &@      &@      *@      @     �B@     �R@     �W@     @c@     �X@     @c@     �a@     �X@     �]@      X@      0@      1@      &@      6@      <@      >@     �D@      3@      ,@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ��ղ@      �@!   �%"A)�����A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@               @      @      .@      6@     �E@     �E@      <@      ;@      4@      0@      (@      *@      3@      0@      :@      .@      @      @      @       @      $@      (@      (@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    jƵ@   �b��@      P@!  @J~,A)�+j���B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?      @       @      (@      @       @      @       @      @       @      @      @       @      @              �?      �?      �?       @              @       @        

loss�(�I d\&       sO� 	C��P�A�m*

global_step/sec�|
D*F��      ":o$	:��P�A�m*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values)\�>
�
 dnn/dnn/hiddenlayer_0_activation*�    �%@      �@! �2��@)y���.�@2�        �-���q=f�ʜ�7
?>h�'�?�vV�R9?��ڋ?�.�?I�I�)�(?�7Kaa+?��%>��:?d�\D�X=?�T���C?a�$��{E?
����G?�qU���I?IcD���L?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?o��5sz?���T}?����=��?���J�\�?-Ա�L�?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             X�@              �?              �?      �?              �?              �?              �?       @              @               @      @      @      @      �?      �?       @      @      �?      @       @      @      @       @      @      @              �?              �?       @              @      �?       @       @      �?              �?      �?      @      �?      @       @      @      �?       @       @      @       @      @       @      "@      @      @      @      *@      @      2@      &@      $@      $@      @      ,@      ,@      6@      9@      :@      =@      8@     �D@      G@     �C@      I@      J@     �E@     @Q@     �K@     �N@     �Q@     @U@     �S@     �Q@     @S@     @U@     �Q@     �X@     �U@      K@     @T@     �T@      R@      J@     �I@     �K@      A@      :@      E@      8@      .@      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values33�>
�
 dnn/dnn/hiddenlayer_1_activation*�   �V�k@      �@! P�5�@)��֮��dA2�        �-���q=}Y�4j�?��<�A��?�uS��a�?`��a�8�?%g�cE9�?��(!�ؼ?w`<f@�6v��@u�rʭ�@�DK��@{2�.��@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             ��@              �?              �?               @              �?               @       @              �?               @       @               @      �?              @               @      @      "@      @      @      @      @      @      :@      9@      0@     �L@      I@     �P@      f@     �e@     �Y@     @d@     �a@     @R@      N@      ,@      �?      @      &@      7@      L@      F@      *@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    ���@      �@!  ��� A)�R֬wD�A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@               @      @      &@      ;@      >@     �H@     �D@      4@      6@      :@      <@      @@      2@      @      &@      $@       @              �?      @      0@      1@      "@       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ����@    �6�@      P@!  @��o*A)� �RB2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@��&���@q�݆L��@0�Z�:��@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�               @       @      @      "@       @      @      @      @      @       @      @              @      �?              �?              @      @        

loss���I���&       sO� 	��P�A�n*

global_step/sec�D.�C      !(�	CQ��P�A�n*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�G�>
�
 dnn/dnn/hiddenlayer_0_activation*�    �)@      �@! �{�(Į@)�|ԛ���@2�        �-���q=d�\D�X=?���#@?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?�N�W�m?;8�clp?uWy��r?hyO�s?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�������:�             8�@              @       @      @              �?       @       @       @      @      �?      �?       @       @       @      @      �?              �?      @      �?              �?       @      �?              @      @              �?               @      �?              @      1@      @      @      @      @      @       @      ,@      @      @      @      3@       @      ,@      &@      0@      $@      1@      @      (@      2@      8@      1@      9@      ;@      ?@     �E@      F@     �A@      K@     �C@      @@      P@      K@     �D@     �K@      P@     �J@     �L@     �J@     @Q@     �T@      U@     @R@     �B@      I@      F@      B@     �B@      ?@      E@     �F@      ?@      @@     �E@      1@       @      �?              �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�̈>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��On@      �@! 軎P��@)�g���cA2�        �-���q=%g�cE9�?��(!�ؼ?����?_&A�o��?uo�p�?2g�G�A�?yL�����?S�Fi��?u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             �@               @              �?              �?              �?               @               @              @      �?              @               @      @              �?      @      "@      @      @       @      @      �?      8@      =@      <@     �T@     �U@     �P@     �Z@     @]@     �a@      l@      k@     �M@     �C@      8@       @      �?       @      @      6@      >@      1@      2@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    �9�@      �@!  ��-A)ѷ/�L��A2�        �-���q=֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              �?      @       @      *@      G@     �E@     �D@      M@      @@      6@      1@      "@      (@      0@      "@       @      @      @       @              @      $@      @       @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ��(�@   @q��@      P@!  �[��%A)����?B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?      @      $@       @      @      "@      �?      @       @      �?       @      @      �?       @              �?              �?       @       @        

lossn"�I��
/&       sO� 	�/��P�A�n*

global_step/sec��C�٠�#       ���	��P�A�n*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_0_activation*�   @�#@      �@! �&����@)�<!��@2�        �-���q=U�4@@�$?+A�F�&?I�I�)�(?�7Kaa+?��VlQ.?��82?�u�w74?��%�V6?uܬ�@8?d�\D�X=?���#@?a�$��{E?
����G?�qU���I?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             �@              �?       @      �?       @              �?      �?      �?              �?              �?       @               @               @              �?      �?               @      @      �?              �?              �?              �?              �?      @               @              �?       @      �?      @      @              @      @       @       @      @      $@      .@       @      &@      @      *@      @      $@      3@      @      2@      @      &@      1@      3@      0@      <@      ?@      =@      E@      I@      C@      E@      F@     �F@      I@     �P@     �J@     �K@     �Q@     �P@     �P@      Q@     �P@      R@     �U@     �Q@      P@     @R@      N@      K@     �M@      I@      M@      Q@      F@      C@      *@      $@      @       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�ݍ>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��j@      �@! `3<��@)> ��W�dA2�        �-���q=�1%�?\l�9�?yL�����?S�Fi��?�6v��@h�5�@{2�.��@!��v�@زv�5f@��h:np@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             ��@               @              �?              �?               @               @              @      �?              @       @       @              �?      $@      @      @      @       @      "@      5@      7@      @      >@     �S@      Q@      R@      T@     �`@     `m@     �p@     �_@      9@      @      2@      "@      6@      ;@      =@      A@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �r��@      �@!  �n�A)/�\���A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              �?      &@      5@      H@     �C@      I@      ;@      4@      .@      "@      *@      6@      >@      6@      @       @      @      @      @       @      "@      *@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   @mݶ@   ���@      P@!  �y�(A)�'X%B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?       @      @      "@       @      �?      @       @      �?       @      @      @      �?      �?              �?      �?      �?       @              @        

loss ��I#��&       sO� 	�Ͽ�P�A�o*

global_step/sec�D�ǷxS      } 	��P�A�o*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values33�>
�
 dnn/dnn/hiddenlayer_0_activation*�   `I�#@      �@! @VC�@)�zUU���@2�        �-���q=E��a�W�>�ѩ�-�>��bȬ�0?��82?�u�w74?�qU���I?IcD���L?�lDZrS?<DKc��T?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@              �?               @      �?              �?               @              �?              �?      �?              �?              �?               @               @      @               @       @      @       @               @              @      �?              @      @      @      @      *@      "@      @       @      @      @      @      @      (@      @      @      "@      @      &@      "@      @      "@      @      0@      @       @      1@      ,@      5@      :@      4@      :@     �E@      D@      B@      I@      G@      M@     �O@     �R@      R@     �P@     �T@     �R@     @P@     �Q@     @W@     �Z@     �]@     �Y@      N@     @V@     �T@     @T@      T@      O@      L@      B@     �B@      ;@      <@      3@      @       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   �,\n@      �@! <_�e��@)c`�]O�eA2�        �-���q=�N�W�m?;8�clp?eiS�m�?#�+(�ŉ?Ӗ8��s�?�?>8s2�?u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             @�@              �?              �?              �?               @              �?               @       @               @              �?      @      �?      @      �?      �?      @      @       @      @      @       @      1@      1@      ,@     �K@     @R@      S@     �`@     �b@     �b@      ^@     �\@     �Y@     �N@      5@      8@      3@      4@      9@     �D@      4@      .@      0@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    �J�@      �@!  �u"A)�Ôbq��A2�        �-���q=o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              @      "@      (@     �B@     �H@      @@      <@      1@      *@      6@      ?@      =@      ,@      ,@      (@      "@      @      @      @      *@      $@      @      @      �?        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ��K�@   ��@      P@!  ��D1,A)c�w�BB2�1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              @      @      "@      @       @      @      �?       @      @      @      @       @       @      �?       @      �?      �?      �?       @      �?       @        

loss?��I1�e�&       sO� 	�8��P�A�p*

global_step/sec�5Df�[�      ~H:�	C^��P�A�p*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values��>
�
 dnn/dnn/hiddenlayer_0_activation*�   ��#@      �@! ��w�U�@)9@�ߐ��@2�        �-���q=�.�?ji6�9�?�[^:��"?U�4@@�$?I�I�)�(?�7Kaa+?uܬ�@8?��%>��:?d�\D�X=?���#@?�!�A?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?P}���h?ߤ�(g%k?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             �@              �?              �?              �?              �?      �?              �?               @               @      �?              �?      �?      �?      �?      @               @              �?              �?      �?              �?              @       @      @              @              �?      @              �?      �?              �?      @       @      .@      (@       @      �?      �?      @      @      @      @      @      *@      @      $@      &@      @       @      $@      @      $@      "@      ,@      (@      8@      .@      4@      >@      C@      @@      ?@      A@      E@      E@     �D@     �K@      M@      M@     @P@     @W@     @P@      N@      D@     �M@     @Q@     @U@     @U@     �O@      V@     �R@      R@     �P@     �N@     @Q@     �O@      H@      F@      ;@      $@      �?       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values""�>
�
 dnn/dnn/hiddenlayer_1_activation*�   ���j@      �@! 8g�i�@)��:,<�eA2�        �-���q=yD$��?�QK|:�?�1%�?\l�9�?S�Fi��?ܔ�.�u�?�6v��@h�5�@u�rʭ�@�DK��@زv�5f@��h:np@S���߮@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�              �@              �?              �?              �?               @               @              �?       @              �?      @      �?      @      @       @      @       @      �?      @      �?      @       @      @      @      @      @      "@     �C@     @R@     �W@     �_@     �`@     `c@     �`@     @g@      Z@      9@      ;@      C@      2@      0@      9@     �D@     �I@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �v��@      �@!  h�� A)fl��V�A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              @      "@      ,@      =@      D@      J@      C@      9@      ,@      @      .@      :@      .@      1@       @      @      *@       @      @      @      (@      1@       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   @�Ͷ@    R��@      P@!  @fl�*A)����ߞB2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�               @      @      @      $@       @      @      @      �?              @      @       @      @              �?      @      �?              @              @        

loss���I�B��&       sO� 	mm��P�A�q*

global_step/secN�DˋR       |읅	���P�A�q*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values  �>
�
 dnn/dnn/hiddenlayer_0_activation*�   �W�#@      �@! �z]ձ@)xAu-a�@2�        �-���q=0�6�/n�>5�"�g��>��ڋ?�.�?��82?�u�w74?uܬ�@8?��%>��:?d�\D�X=?���#@?�!�A?�T���C?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?o��5sz?���T}?>	� �?����=��?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?�Rc�ݒ?^�S���?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             �@              �?              �?              �?              �?      �?               @      �?               @      �?       @      @       @      @      $@      @       @       @      @               @              @              �?              �?      �?      �?       @               @               @       @       @              �?      @      "@      @      �?      �?      @       @      @      @      *@       @      @      $@      ,@      @      *@      $@      0@      *@      (@      &@      8@      7@      <@      8@      >@      @@      B@      I@     �G@      I@     �B@      K@     �O@      S@     �H@     @S@      X@      S@     @S@      K@     �S@      W@      V@     �V@      U@     �S@      W@     �R@     �E@      I@      F@      E@     �@@      =@      .@      @      �?       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesDD�>
�
 dnn/dnn/hiddenlayer_1_activation*�   `�j@      �@! @6)b�@)��u�R�cA2�        �-���q=�P�1���?3?��|�?u�rʭ�@�DK��@!��v�@زv�5f@��h:np@S���߮@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@�������:�             `�@              �?              �?              �?       @      �?              @      �?      @       @       @      �?              @      @      @              @       @      $@      @      @      @      @@     �M@     �Y@     @T@     �U@     �g@      p@     �m@     �Q@      ;@      2@      1@      �?      $@      =@     �K@      0@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �ū�@      �@!  ��� A)^S����A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              @      ,@      $@      >@     �B@      D@      9@      4@      8@      0@      :@     �D@      9@      &@      "@       @      @       @              @      2@      "@       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   `,϶@   ��<�@      P@!  @<�-)A)��Um�B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�               @      @      @      $@      @       @      @      @      @      @      @      @               @      �?      �?              @       @      �?        

loss��IJ���&       sO� 	$b��P�A�r*

global_step/sec���C��T�      "@a�	����P�A�r*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values
ק>
�
 dnn/dnn/hiddenlayer_0_activation*�    ��#@      �@!  �C�@)���+�@2�        �-���q=�.�?ji6�9�?��82?�u�w74?d�\D�X=?���#@?�!�A?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?ߤ�(g%k?�N�W�m?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             d�@              �?              �?              �?      @               @              @      @      �?      @              �?      �?      �?       @               @              �?              @              �?       @      @       @              �?      @      �?               @               @       @              �?      @               @      @      @      �?      �?      @       @      @      @      @      @      $@      @      �?      @      @      $@      (@      $@      $@      (@       @      @      &@      2@      .@      6@      ?@      7@      A@      <@      D@     �G@     �G@     �H@     �I@     �N@      G@     @R@      N@     �S@      R@     �U@     @X@     @Z@     �T@     �Q@     @V@     �Q@     @T@      S@     �S@     �T@     �P@      M@      A@      =@      6@      5@      @      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�ݕ>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��pm@      �@!  ʣȲ�@)jq��fA2�        �-���q=\l�9�?+Se*8�?��tM@w`<f@�6v��@�Š)U	@u�rʭ�@�DK��@زv�5f@��h:np@S���߮@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ��@              �?              �?      �?               @      �?              @      �?              @      �?      �?       @              @              @      "@      @              @      @       @      @      (@      @      D@      T@     �F@      Q@     @[@     @a@     `h@     �n@      _@     �O@      5@      <@      "@      *@      0@      A@     �C@      &@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ��Ȳ@      �@!  ��cL!A)�� .���A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?      @      ,@      0@      C@     �A@     �F@      4@       @      (@      (@      @      5@     �C@      :@      4@      $@      "@      @      @       @      $@      *@      $@       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ����@    +��@      P@!  �u(+A)�{%��"B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              @      @      @      $@      @      �?      �?       @       @       @      @       @      @      @               @      �?              �?      �?      @      �?        

lossN�I;���&       sO� 	����P�A�r*

global_step/sec,�D��?�      y���	u���P�A�r*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�(�>
�
 dnn/dnn/hiddenlayer_0_activation*�   �%@      �@! ��;��@)J�,��L�@2�        �-���q=��d�r?�5�i}1?ji6�9�?�S�F !?uܬ�@8?��%>��:?d�\D�X=?���#@?�!�A?�T���C?a�$��{E?
����G?nK���LQ?�lDZrS?E��{��^?�l�P�`?�N�W�m?;8�clp?uWy��r?hyO�s?���T}?>	� �?�#�h/�?���&�?�"�uԖ?}Y�4j�?��<�A��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             l�@              �?              �?              �?              �?               @      �?      �?               @              �?              �?              �?              @              @               @      �?              @       @       @       @       @      @      @      @      @      @      @      @      @       @      @      &@       @      ,@      (@      @      "@      $@      2@      3@      <@      5@      5@      C@     �@@     �A@     �D@      G@      @@     �L@     �L@      J@     �H@      Q@     �S@     @R@     �Q@     �S@     @R@     �\@     �[@      V@     �T@      T@     �Z@     �S@      O@     @R@      N@      D@      =@      9@      2@      2@      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesDD�>
�
 dnn/dnn/hiddenlayer_1_activation*�   `�bm@      �@!  ��K��@)���W��eA2�        �-���q=w`<f@�6v��@�Š)U	@u�rʭ�@�DK��@!��v�@زv�5f@��h:np@S���߮@)����&@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ؁@              �?              �?      �?              �?       @              �?              �?      �?      @      �?              �?      �?      @       @      @      �?      @       @      @      &@      .@      "@      7@     �E@      T@      Y@     �V@      c@     `d@      j@      a@     @X@      >@      .@       @      1@      B@     �C@      *@      0@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ����@      �@!  ���o!A)dBt��A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?      @      "@      2@      7@      B@      @@     �@@      9@      0@      @      ,@      :@     �@@      5@      5@      0@      @       @      �?      "@      0@      @       @      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ����@   `��@      P@!   �H+A)�v �iB2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�               @      @      @      @       @       @      @      �?       @       @      @      @      �?      @      �?      �?              �?      @      �?      �?      �?        

loss(�I@�q�&       sO� 	���P�A�s*

global_step/sec��DT.�c      F�`f	�d��P�A�s*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�z�>
�
 dnn/dnn/hiddenlayer_0_activation*�   �f)@      �@! @*�0��@)����@2�        �-���q=I�I�)�(?�7Kaa+?�u�w74?��%�V6?�!�A?�T���C?
����G?�qU���I?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?>	� �?����=��?���J�\�?-Ա�L�?�7c_XY�?�#�h/�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�������:�             ȍ@              �?              @              �?              @              �?               @       @      @       @      �?      @      �?      @      @       @               @      �?       @              @       @               @               @              @              �?      �?      @      @              �?       @      @       @      *@      @      @      @      @       @      &@       @      @      @      @       @      "@      (@       @      &@      $@      ,@       @      5@      ,@      ;@      B@      6@     �D@      B@     �F@     �E@      A@      I@      H@     �E@     �N@     �E@      H@      R@      O@      Q@     @Q@     �S@      Q@      U@     �[@     �P@     @T@      J@     @[@     �T@      Q@     @S@     �Q@      O@      D@      <@      6@      3@      @      @      �?      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesww�>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��)n@      �@! ����@)�>m�3�eA2�        �-���q=%g�cE9�?��(!�ؼ?!�����?�@�"��?�K?�?�1%�?\l�9�?uo�p�?2g�G�A�?w`<f@�6v��@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             8�@              �?      �?              �?               @              �?              �?              @      �?               @      �?              �?      @      �?      @              �?      @              @      @      @      �?      @      @      @      6@      =@      <@      R@     @[@     �T@     �_@     �^@     @`@     �`@     �Z@      L@      F@      9@      (@      (@      ?@     �A@      A@      <@      8@      .@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   @�.�@      �@!  Pj�!A)�Ȍ�P�A2�        �-���q=֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              �?       @       @      "@      4@      5@      8@      B@      G@      6@      &@      2@      ;@      9@      <@      "@      &@      $@       @      @      @      ,@      $@      @      &@      @      �?        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ���@   ��@      P@!  ����+A)3S�=�B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?       @      @      �?      @      &@      @      @              @       @      @      @      �?       @      �?               @              @      �?       @       @        

loss<c�I��v&       sO� 	��P�A�t*

global_step/secb�C1��      ~H:�	���P�A�t*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�̄>
�
 dnn/dnn/hiddenlayer_0_activation*�   �%@      �@! @�W<��@)
�X�|�@2�        �-���q=U�4@@�$?+A�F�&?��82?�u�w74?��%>��:?d�\D�X=?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?hyO�s?&b՞
�u?*QH�x?���T}?>	� �?����=��?���J�\�?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@              �?               @              @               @              @       @              �?      �?              �?              �?              �?      �?      �?      �?       @      �?               @       @              �?       @      �?              �?              �?      @      �?              �?       @      �?      @      @              �?      �?      @      @      �?      @      $@      @      @      @      @       @      @      (@      &@      0@      ,@      "@      @      0@      2@      5@      :@      5@      ;@      =@      ?@     �F@      G@     �C@     �D@      Q@      I@     �G@     �P@     �R@     �O@      T@     �T@     �T@      P@     @U@     @^@     �W@      Z@     @Z@      ]@     @S@      O@     @R@     @T@     @T@      L@      F@      A@      .@      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�>
�
 dnn/dnn/hiddenlayer_1_activation*�   �q(n@      �@! P��<%�@)����GtjA2�        �-���q=��<�A��?�v��ab�?�/�*>�?�g���w�?3?��|�?�E̟���?h�5�@�Š)U	@u�rʭ�@�DK��@!��v�@زv�5f@��h:np@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ��@              @              �?              �?              �?              �?               @       @               @       @              �?              @      �?      �?      @      "@       @      @       @      @      3@      9@      3@      F@     �H@     @P@     �U@      Q@     �V@     `a@      f@     �a@     @T@              *@      5@      E@     �I@     �N@     �H@      1@      "@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �t2�@      �@!  ���P$A)�,����A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              �?      @      @      4@      2@      ;@      =@      &@      ,@      *@      .@      3@     �C@      E@      9@      *@      @              "@      @      2@      1@      0@      &@      @      �?        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   @T��@   �c�@      P@!  ���/A)L�1��B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?      @      @      @      @              @              @      @       @      @       @       @              @              @       @      @      �?        

lossG�+J]C�B&       sO� 	h��P�A�u*

global_step/sec��D[|s      }�`	$�P�A�u*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�G�>
�
 dnn/dnn/hiddenlayer_0_activation*�    ~)@      �@! @ªQ��@)�]8=�@2�        �-���q=�u�w74?��%�V6?�!�A?�T���C?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?���%��b?5Ucv0ed?Tw��Nof?;8�clp?uWy��r?hyO�s?&b՞
�u?����=��?���J�\�?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�������:�             P�@              �?              �?              �?              @       @              �?       @              �?      �?       @               @              �?       @      �?      �?              @              �?       @      @      @      &@       @      "@               @      @       @      @      @      @      @      @      $@       @      "@      (@      .@      @      *@       @      $@      1@      &@      <@      3@      E@      ;@     �C@      ;@      E@     �E@      J@     @P@      M@     �K@     @P@      Q@     @W@      W@     @R@     �R@     �Q@      W@      X@     @Y@      R@      P@     �R@      Q@     �N@     �G@     �G@      O@      >@      .@      $@      �?       @      �?      �?      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��j@      �@! �e��@)г�cA2�        �-���q=�?>8s2�?yD$��?�QK|:�?�@�"��?����?_&A�o��?\l�9�?+Se*8�?3?��|�?�E̟���?w`<f@�6v��@h�5�@�Š)U	@�DK��@{2�.��@!��v�@زv�5f@��h:np@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             h�@              �?              �?              �?               @              �?              @              �?              �?              @      @              �?       @               @      �?      �?      @      �?      @       @      (@       @       @      @      @      ?@     �@@      (@      @@     �U@     �Y@     �a@     �^@     @_@     �]@     �a@     �Y@     @Q@     �@@      @@      &@      1@      5@     �A@      ;@       @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   @\�@      �@!   � A):�n����A2�        �-���q=֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              �?       @       @      @      3@      >@     �B@     �D@     �@@      7@      8@      2@      :@      6@      .@      *@      *@      $@      "@       @      @      @      $@      &@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    x%�@   �w��@      P@!  ���4)A)x��=pB2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?              @      @      "@       @       @      @      @      @      @       @      @      @      �?      �?       @      �?               @      �?       @        

loss�L�I�K�:&       sO� 	+�!�P�A�u*

global_step/sec�4�Cb�t:c      !�O	�"�P�A�u*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full��0?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�̨>
�
 dnn/dnn/hiddenlayer_0_activation*�   `��)@      �@! �i�JA�@)�;�	>�@2�        �-���q=�[^:��"?U�4@@�$?�T���C?a�$��{E?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?���%��b?5Ucv0ed?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�������:�             |�@              �?               @               @       @       @               @               @       @              �?              @              @      �?              �?              �?               @              �?              �?               @      �?              �?      @       @      @              &@      @      @      @       @      @      ,@      @      @      @      (@      @      *@      (@      .@       @      *@      $@      2@      .@      2@      0@      =@     �@@      5@      D@      A@      I@      C@      G@     �J@      G@     @Q@     @T@      P@     �M@      T@     �R@     �R@     �M@     �P@     �Q@      X@     @Y@     @T@     @R@     @P@     �N@     �F@      H@      E@     �C@     �K@      >@      =@      1@      $@      @      @      �?      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�>
�
 dnn/dnn/hiddenlayer_1_activation*�   �@tj@      �@! `1�T��@)�zT1��aA2�        �-���q=�1%�?\l�9�?�E̟���?yL�����?�6v��@h�5�@u�rʭ�@�DK��@زv�5f@��h:np@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             x�@               @              �?              �?              �?              @              �?      @       @       @      @       @      @              @      �?       @      @      "@      @      @      5@      5@      .@     �E@     �U@     �\@     �\@     @`@      _@     `b@     `f@     �Y@     �P@      *@      *@      5@      :@       @      *@      C@      �?        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �
ް@      �@!  ���A)7�I����A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              �?              @      @      @      5@      =@      <@     �C@     �A@      ?@      4@      .@      9@     �@@      A@      ,@      @      @              "@      "@              �?      &@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   @�
�@   ����@      P@!  @�(A)˂΁B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@�<�@P�w\�u�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?      @      @      @      @      $@      �?       @              @      @      @      @      �?      �?              @              �?       @        

lossp5�I[��&       sO� 	��0�P�A�v*

global_step/sec���C�0No3      [oS�	@1�P�A�v*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesff�>
�
 dnn/dnn/hiddenlayer_0_activation*�   �j�)@      �@! @���ӱ@) �(���@2�        �-���q=�ߊ4F��>})�l a�>�[^:��"?U�4@@�$?d�\D�X=?���#@?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?&b՞
�u?*QH�x?���T}?>	� �?����=��?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�������:�             ��@              �?              �?              @              �?              @              �?              @      �?      �?       @              @      �?      �?       @      @      �?      @               @               @       @              �?       @              @      �?      @               @              @       @      @      (@       @      @      �?       @      @      @      @      @       @      @      "@      $@      $@      "@       @       @      ,@       @      ,@      4@      :@      <@      ,@     �@@      6@     �D@      E@     �H@     �J@     �N@      Q@     @S@      M@     �Q@      R@      U@     @T@     �R@     �T@      R@     �W@     �Z@     �T@     �P@     @P@      X@     @T@      Q@     �P@      C@      :@      4@      0@      @      "@      @      @      �?      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�    ~vk@      �@! T5����@)�6��bA2�        �-���q=hyO�s?&b՞
�u?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?\l�9�?+Se*8�?������?�iZ�?3?��|�?�E̟���?w`<f@�6v��@�DK��@{2�.��@زv�5f@��h:np@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             h�@              �?              �?              �?              �?               @              �?              �?              @              &@              �?       @              @      �?               @      �?      @      @       @       @      @      @       @      5@     �@@      8@     �G@     �H@      P@     �S@     �[@     �g@     �d@     �b@     ``@      V@      ?@      4@      @      "@      :@      C@      "@       @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   `�q�@      �@!  0k� A)�Pb����A2�        �-���q=֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?       @              �?      2@     �A@      B@     �G@      8@      ,@      1@      0@      8@      E@      <@      *@      0@      *@      @       @      �?      @      &@      @      @      �?        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   `�-�@   �I(�@      P@!  ���B)A)�:��
B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?              @      $@      "@      @      �?      @       @      @      @      "@       @      �?      @      �?      �?              �?              @      �?        

loss�h�I�&�V&       sO� 		?�P�A�w*

global_step/sec�?�C�3�c      '�7�	�]?�P�A�w*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values  �>
�
 dnn/dnn/hiddenlayer_0_activation*�   @ #%@      �@! ����G�@)�]��<n�@2�        �-���q=�qU���I?IcD���L?k�1^�sO?nK���LQ?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?���J�\�?-Ա�L�?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             $�@              �?               @              �?      �?      �?              �?      �?      �?              �?              @      @      �?              @               @               @               @      @      @       @      @      @       @      @       @      @      @       @      *@      @      1@      "@      @      @      ,@      (@       @      ,@      0@      2@      .@      <@      <@     �E@      @@     �F@      K@     �@@     �I@      P@      L@     �O@     �O@      Q@      P@     �P@     �Q@     �R@     �V@     �[@     @W@     �T@      L@     @S@     �M@      E@     �G@      G@     �D@      ?@      7@      4@      &@      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesff�>
�
 dnn/dnn/hiddenlayer_1_activation*�    ��m@      �@! @�9j��@)TU�ؘbA2�        �-���q=�iZ�?+�;$�?�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             (�@              �?              �?      �?       @               @      @              �?               @               @       @      �?      @      �?      @      @      @      @      @      @      @      <@      F@      B@     �B@      9@     �R@     @T@     @Z@      a@     @p@     �j@     �X@      J@      2@      4@      0@      0@      @      *@      $@      .@      "@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   @��@      �@!  ��nA)0�>k���A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              @      &@      9@     �B@     �D@      D@      7@      9@      2@      (@      3@      C@      =@      "@      @      "@      @       @      @      �?      @      @      @      @      �?        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �� �@   @e�@      P@!  @�t�'A)��`}�B2�1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              $@      @      "@      @       @      @      �?      @      @      @      @              @              �?       @              �?      �?      �?        

loss��I��i�&       sO� 	�K�P�A�x*

global_step/sec'� D����      y���	��K�P�A�x*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values{�>
�
 dnn/dnn/hiddenlayer_0_activation*�   @Z4$@      �@!  ����@)}�]�v�@2�        �-���q=�u�w74?��%�V6?k�1^�sO?nK���LQ?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             d�@              �?              �?              �?      �?      �?              �?              �?       @              �?      �?       @       @      �?              �?       @       @              �?      �?              �?               @      @      @      @      @      �?       @      @      @      @       @       @      @      @      @      1@      @      &@      "@      *@      @      $@      2@      .@      5@      2@      :@      3@      8@      ?@     �E@      A@     �G@     �E@     �C@      M@      L@      M@      R@      M@     �R@     �S@     �O@     @T@     �U@     �W@     @]@     �W@      W@     �R@     �R@     �Q@      K@     �M@     �K@     �B@      1@      &@      �?      @      �?       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   ���g@      �@! �����@)v5a|�aA2�        �-���q=�@�"��?�K?�?��7��?�^��h��?+�;$�?cI���?��tM@w`<f@h�5�@�Š)U	@!��v�@زv�5f@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@�������:�             h�@               @              �?              �?              �?              �?              �?              �?      @      @      �?      @       @       @      @      �?      �?      �?       @      @      @      @      @      @       @      ,@      6@      N@      ^@     �_@     �`@     �`@     `g@     �g@      ]@      M@     �B@      8@       @      $@      <@      ?@      �?        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�     ��@      �@!  �
��A)�'���A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�������:�              p@              @      0@       @      @@     �C@      B@      7@      @@      5@      3@      <@      :@      4@      $@      (@      0@      (@      @      �?       @      &@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    ض@    ���@      P@!  ���H(A)�8M�TB2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@�������:�               @      @      @      @      @      �?       @      �?      @      @      @       @       @       @       @       @              �?      �?       @        

lossvqI�7��&       sO� 	6�U�P�A�y*

global_step/sec% D�p��      G�A	\*V�P�A�y*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values=
�>
�
 dnn/dnn/hiddenlayer_0_activation*�   ���#@      �@! �ȟQ��@)8��b�@2�        �-���q=pz�w�7�>I��P=�>��%�V6?uܬ�@8?d�\D�X=?���#@?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?eiS�m�?#�+(�ŉ?�#�h/�?���&�?�Rc�ݒ?^�S���?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@              �?              �?              @              @      �?               @      @              �?              �?       @              �?      �?              @       @       @              @       @       @      �?       @              @               @              @              �?              �?              �?              @       @       @      �?      @       @      @      @      "@      @      ,@      @      @      @      $@      @      @       @      @       @       @      &@      $@      .@      4@      *@      6@      :@     �A@      ;@      F@      D@      C@     �J@      M@     �H@     �P@     @R@     @Q@     �T@     �K@     �S@     �Q@     @Y@      Y@     @V@      Q@     �N@     �S@     �P@     �K@     �I@      M@     �I@     �H@     �A@      F@      *@      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values""�>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��m@      �@! `$+��@)Y��mgA2�        �-���q=�v��ab�?�/��?�QK|:�?�@�"��?S�Fi��?ܔ�.�u�?��tM@w`<f@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ��@              �?              �?              �?              �?              �?      �?      @              @      �?              @              �?      �?               @       @       @       @       @       @      @      @      @      ,@      3@      >@     �C@      @@     @T@      _@     �[@     �[@     `c@     `f@     �]@      Y@      4@      .@      (@      2@      E@      H@      .@      0@      0@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ���@      �@!  D*�!A)c�0�D%�A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              �?      @      3@      6@      <@      D@      A@      8@      3@      8@      ,@      6@      7@      4@      @      $@      $@      @      @      @      $@      0@       @      @       @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �C��@   ��	�@      P@!  �qD�*A)r%����B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              @      @       @      "@      @              @      @      @      @      @       @              @              �?      �?              @      @               @        

loss�r�I7ȇ&       sO� 	��a�P�A�y*

global_step/secǌ	DH��      ^d�	c�a�P�A�y*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�G�>
�
 dnn/dnn/hiddenlayer_0_activation*�   ���)@      �@! @Y����@)�c)�@2�        �-���q=6�]��?����?ji6�9�?�S�F !?d�\D�X=?���#@?�!�A?�T���C?<DKc��T?ܗ�SsW?�l�P�`?���%��b?5Ucv0ed?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�������:�             ��@               @              �?              �?               @               @               @       @              �?      @              @               @              �?              �?      �?      �?              @      �?               @       @       @      @      �?       @      "@      @       @      @       @              @      @      "@      @      @      @      .@      @      @      @      @      *@      *@      &@      1@      3@      3@      2@      >@      2@      E@      9@      B@      D@     �H@     �J@     �H@     �D@      J@      K@      N@     �Q@     �G@      W@     �Q@      Z@     �\@     �Z@      U@      T@     �R@     �P@      P@     �P@     �G@     �D@      0@      4@      ,@      @      �?      @      �?      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�ݑ>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��ej@      �@! 0�S��@)�Bh��cA2�        �-���q=%g�cE9�?��(!�ؼ?\l�9�?+Se*8�?ܔ�.�u�?��tM@w`<f@�6v��@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             �@              �?              �?               @              @              �?      �?      �?              �?      @       @              �?      �?      @      �?               @              �?               @       @      @      @      @      @      @      0@      :@      .@     �A@      P@      L@      S@      Z@     �d@      g@     �e@     �f@     @Q@     �D@      *@      *@      0@      6@      4@      ;@      �?        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ���@      �@!  hsGoA)�,��6a�A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              �?              @      @      @      8@     �C@      D@      H@      ;@      0@      @      @      .@      =@      ?@      2@      4@      *@      @       @       @       @      @      $@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    �.�@    ���@      P@!  ���(A)>�B�L
B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?      @      @      "@      @      "@              @              �?      @      @      @      @      @      �?      �?               @              �?       @        

loss -gI��V�&       sO� 	�n�P�A�z*

global_step/sec�+�C=���      xx��	�2n�P�A�z*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�½>
�
 dnn/dnn/hiddenlayer_0_activation*�   �l-%@      �@! �*)��@)t��6&��@2�        �-���q=>h�'�?x?�x�?ji6�9�?�S�F !?�qU���I?IcD���L?k�1^�sO?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?�N�W�m?;8�clp?uWy��r?o��5sz?���T}?>	� �?����=��?#�+(�ŉ?�7c_XY�?���&�?�Rc�ݒ?^�S���?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@               @              �?               @      �?              �?              �?      �?       @              �?      @      @              �?      @              @               @              �?              �?      �?              �?      �?      @               @      @       @      �?      @      @       @      $@      &@      @       @      @      @      @      @      @      @      ,@      @      *@      "@      (@      5@      (@      ?@      6@      B@      >@      A@      >@      >@      A@      >@      @@     �J@     �C@     �K@      O@      L@      L@     �E@      T@      K@      T@     @\@      U@     �U@     �S@     �\@     @Q@     @P@     �R@      M@     �G@      C@     �A@      7@      2@      "@      "@        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�̔>
�
 dnn/dnn/hiddenlayer_1_activation*�   �/m@      �@!  ����@)rh
�!�gA2�        �-���q=ܔ�.�u�?��tM@!��v�@زv�5f@��h:np@S���߮@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             p�@              �?              �?               @              @               @       @      �?      �?              @      @      "@      @      @      @      @      3@      ;@       @      &@      A@      S@     @_@     �P@     @^@     @g@      k@     �_@      Y@      1@      $@      @      3@     �A@      N@      =@      3@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    Ø�@      �@!  L���!A)IU�D��A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?      @      *@      7@      ?@      B@      ;@      :@      <@      *@       @      5@      5@      =@      .@      *@      *@      @       @      �?       @      3@      ,@      "@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �ŵ@    ݁�@      P@!   ��+A)��ԁfB2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              @       @      @       @       @      @      @              @      @      @      @              @              �?              �?       @      @       @      �?        

loss���I+��&       sO� 	~ {�P�A�{*

global_step/secWb�Cjf��      #L=	1{�P�A�{*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values)\�>
�
 dnn/dnn/hiddenlayer_0_activation*�   ���)@      �@!  ����@)h���&��@2�        �-���q=pz�w�7�>I��P=�>�S�F !?�[^:��"?+A�F�&?I�I�)�(?��VlQ.?��bȬ�0?uܬ�@8?��%>��:?d�\D�X=?���#@?�!�A?�T���C?a�$��{E?
����G?�qU���I?k�1^�sO?nK���LQ?�m9�H�[?E��{��^?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?���T}?>	� �?����=��?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�������:�             x�@               @              �?               @              @              �?       @      �?               @              �?       @               @              �?              �?      �?      �?              �?              �?               @      �?               @      �?              �?      �?      �?       @      �?      �?      �?      @      @      @      @      @      @      "@       @      @      @      4@      @      (@      4@      &@       @      &@      &@      0@      5@      .@      *@      &@      2@      5@      3@      <@      E@      H@      <@      C@      A@     �I@     �J@     �M@      J@      S@     �Q@      R@     @R@     �K@     �S@      Q@     �T@     �X@     �V@     �Q@      I@     �O@      G@      <@      >@      @@      >@      4@      5@      0@      1@      $@      @      �?      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesww�>
�
 dnn/dnn/hiddenlayer_1_activation*�    �m@      �@! �M�"�@)R`*aA2�        �-���q=�@�"��?�K?�?�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             Ѐ@              �?               @      �?              @      �?              @       @      �?      �?      @      �?      @       @      @      @      @      @      @      @      *@      0@      2@      9@      P@     @\@      ]@     @c@     @a@     �h@      h@     �[@     �V@      ;@      .@      �?       @               @      *@      2@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   @|��@      �@!  `��fA)>������A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?               @      @      8@      <@     �@@      J@     �B@      ;@      ;@      0@      ,@      3@      6@      ,@      $@      3@      *@      @       @              @      @      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �J�@   �1}�@      P@!  �Jߔ%A)�6]�0B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?      @       @      @       @      @       @      @      �?      @      @      @      �?      �?      @              �?              �?      �?        

loss"2xIo��&       sO� 	�l��P�A�|*

global_step/sec�{�C�)���      E���	֊�P�A�|*�!
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�z�>
�
 dnn/dnn/hiddenlayer_0_activation*�   �H�)@      �@! �e�|s�@)�'��_@�@2�        �-���q=��ڋ?�.�?�[^:��"?U�4@@�$?+A�F�&?�7Kaa+?��VlQ.?��82?�u�w74?��%�V6?d�\D�X=?���#@?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�������:�             <�@              �?              �?      �?              �?              �?      �?              �?      �?      �?              �?      �?      �?       @      @      �?              @      @      @      @      @      �?      �?      �?              �?      �?               @       @       @       @      �?      �?       @      @               @      @              �?              �?      @              �?      �?       @      @              �?      "@      @      @      �?      @              �?      "@      �?      @      �?      @      0@      @      �?      @      "@      &@      ,@      $@      *@      4@      >@      ;@      0@      ;@      9@      @@      C@      H@      >@     �L@     �F@     @S@     �O@      R@     @U@      V@      P@     �I@      O@     �I@     �U@      U@     @U@      O@     �P@     �M@      P@     �M@     @S@      S@      M@      <@      :@      9@      @      @      @      �?      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�ݑ>
�
 dnn/dnn/hiddenlayer_1_activation*�    &�m@      �@! dۉQ�@)~�U��eA2�        �-���q=^�S���?�"�uԖ?��7��?�^��h��?��tM@w`<f@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             �@              �?              @              �?               @      �?      �?      �?      �?      �?              @      @      @      @      �?               @       @      @      �?      @      $@      @      @      (@      2@     �K@      _@     �Y@     @S@      [@      a@     �a@      d@      V@      F@     �H@      D@      &@      4@     �E@     �@@      =@       @       @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    ��@      �@!  �l� A)�X�_�%�A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              �?               @       @      *@      4@      >@     �D@      G@      @@     �@@      ,@              1@      ?@      0@      @      @       @      .@      @      @      &@      &@      (@      @      @      �?        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �5�@   ���@      P@!  @��O*A)��Te��B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?      �?       @      @       @      &@              @              @      @      �?      �?      �?      �?      @               @      �?       @       @      �?        

loss?E�I(c}!&       sO� 	���P�A�}*

global_step/sec��C`h�X�      ~25	���P�A�}*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�Q�>
�
 dnn/dnn/hiddenlayer_0_activation*�   �#*@      �@!  �Ϫ��@)�K���t�@2�        �-���q=�.�?ji6�9�?��bȬ�0?��82?�u�w74?��%�V6?��%>��:?d�\D�X=?�qU���I?IcD���L?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?&b՞
�u?*QH�x?����=��?���J�\�?-Ա�L�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�������:�             p�@              �?              @               @               @              �?              @      �?      �?       @              @       @               @              �?              �?      �?              �?      �?      �?              �?      @               @       @       @       @              @      @      @      @      @      @      @       @      @      @       @      @      "@      "@      "@      (@      3@      $@      ,@      "@      0@      9@      *@      @@      :@     �D@      C@     �D@      :@      E@      ?@     �H@     �G@      I@     �D@     �R@     �Q@     �U@      Q@     @Q@      T@     @S@     �`@     ``@      `@      R@      K@      O@      I@      J@      A@      >@      5@      C@     �B@     �D@      3@      @      @      �?      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   ���m@      �@! ��j��@)�@fBeA2�        �-���q=o��5sz?���T}?��<�A��?�v��ab�?`��a�8�?�/�*>�?�@�"��?�K?�?��7��?�^��h��?yL�����?S�Fi��?w`<f@�6v��@��h:np@S���߮@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ��@              �?              �?               @               @              �?              �?              �?              �?              �?      @      �?      @      �?       @               @      @      �?       @      @      @      @      &@      @      $@      .@     �F@      U@     �U@     �X@     �U@     �b@     �j@      b@     @W@      P@     �T@      8@      �?      @      ,@      2@      $@      ;@      1@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    ��@      �@!  X/� A)޷��#��A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              �?               @      @       @      @      9@     �B@     �F@      =@      ;@      0@      *@      ;@      @@      >@      $@      @      4@      ,@      @              @      @               @       @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   @�,�@   @��@      P@!  �_�y*A)�n��B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@%4�>�@{i�.�@Fp4K�^�@�{���N�@�������:�              �?      �?      @      @      $@      @      @      @      �?      @      @      @      @               @      @       @               @              @        

loss[S�IT�;&       sO� 	#���P�A�}*

global_step/secIr�C]�N��      ~H:�	Zܥ�P�A�}*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values��>
�
 dnn/dnn/hiddenlayer_0_activation*�   ��*@      �@! ����<�@)lrݫ���@2�        �-���q=I�I�)�(?�7Kaa+?��bȬ�0?��82?d�\D�X=?���#@?�!�A?�T���C?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�������:�             ��@              �?               @              �?              �?               @       @               @       @              �?       @       @      @              �?       @      �?               @      �?              @      �?      �?      @      �?       @              �?      �?       @      �?       @       @      �?              @      @      @      @      @      "@      @      @      @      &@      @      @      @      @      &@      $@      @      .@      &@      .@      "@      5@      6@      <@      <@     �B@      5@      G@     �@@     �C@     �D@     �G@      H@     �N@      F@      O@      U@     �R@      R@     �Q@     �V@      P@      X@      ^@      Z@     �U@     �Q@     �S@     �K@     �L@      P@     �L@      C@      0@      :@      0@      @      @      @       @       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values��>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��i@      �@! @Y��T�@)�{���cA2�        �-���q=P}���h?ߤ�(g%k?8/�C�ַ?%g�cE9�?����?_&A�o��?S�Fi��?ܔ�.�u�?�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@��h:np@S���߮@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@�������:�             ��@              �?              �?               @              �?               @      �?       @       @              �?               @      @      �?       @      @       @               @      @      @      @      @      @      @      @       @      9@     �E@     @Q@      Z@     �U@      ]@     `d@     `i@     �b@     @S@     �@@     �M@     �E@      "@      (@      ?@      E@      6@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    	�@      �@!  �� A)�d����A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@               @              @      @      &@      0@      :@      ?@      C@      7@      :@      4@      (@     �A@     �F@      8@      @              @      *@      @       @      @      *@      &@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ���@   `S=�@      P@!  @E�k)A)hG�� �B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�               @      @      @       @      "@      @      �?      @       @      �?       @       @       @              �?      @              �?      �?       @       @        

lossr~�IW ��&       sO� 	����P�A�~*

global_step/secq��C-��DC      F�r�	h��P�A�~*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full��0?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesR��>
�
 dnn/dnn/hiddenlayer_0_activation*�   ��_$@      �@! �=��@)yP��;��@2�        �-���q=I��P=�>��Zr[v�>�7Kaa+?��VlQ.?��82?�u�w74?��%�V6?uܬ�@8?��%>��:?d�\D�X=?���#@?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             8�@               @              �?              �?               @      �?               @       @      �?               @      �?              �?      �?      �?              @      @      �?      @      �?      @       @      �?      �?              �?               @              @      �?       @              �?               @      �?              @      @               @      �?       @              @      @      @      @       @       @       @      @      @      @      &@      $@       @      @      $@      @      1@      ,@      5@      &@      $@      &@      3@      8@      6@      =@      B@      6@      C@      C@     �B@      D@     �M@      D@      M@     �C@     �Q@     �O@     �V@     �T@      V@      U@     @P@      W@      Y@     �X@     �R@     �X@     �S@      U@      Q@      L@     �E@      E@      B@      D@      7@      *@      �?       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   @Ȳi@      �@!  8\���@)~��R��cA2�        �-���q=�/��?�uS��a�?yD$��?�QK|:�?�^��h��?W�i�b�?�E̟���?yL�����?u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@�������:�             @�@              �?               @              �?              �?               @      @       @      �?              �?      �?               @       @      �?              @       @       @      �?      @       @      @      @      @      @      @      *@      1@      D@      O@     �P@     @\@     �Y@      _@     �Z@      c@     `a@      \@      ?@      ?@     �A@      @       @     �A@     �H@     �A@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   `�}�@      �@!  �`?!A)��X&l�A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              �?       @      @      5@      6@     �A@     �D@      8@      3@      5@      3@      6@     �A@      5@      .@      &@       @      *@      @               @      (@      1@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �˒�@    �>�@      P@!  @�"@+A)L�j�X�B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?      @      @      @      @      �?      @      @      @      @      @       @      @      �?      �?      @               @       @      @        

lossZu�I�i�&       sO� 	����P�A�*

global_step/sec�T�C�J?m#       ���	U]��P�A�*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�Q�>
�
 dnn/dnn/hiddenlayer_0_activation*�   ��>%@      �@!  EdR�@)�q�����@2�        �-���q=ji6�9�?�S�F !?��%�V6?uܬ�@8?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?��bB�SY?�m9�H�[?�l�P�`?���%��b?5Ucv0ed?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?���T}?>	� �?����=��?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             8�@              �?              �?               @              @      �?               @               @               @      �?              @       @       @              @      �?               @              �?      @              �?              @      �?              @      �?      �?      @      @      @      @      @       @      @      @       @      @      @      $@      @      "@      @      ,@      ,@      6@      @      &@      9@      0@      ;@      4@      >@      ?@      <@      >@      9@      F@      D@     �L@      N@     �K@     �A@     �P@     �K@      U@     @S@     �S@     �R@     @R@     @X@     �X@     �Y@      V@     �Q@     �Q@     @Q@      J@     �G@     �B@      H@      ;@     �A@      .@       @      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   �k@      �@! �2A^�@)(�,|	bA2�        �-���q=}Y�4j�?��<�A��?����iH�?��]$A�?�?>8s2�?yD$��?��7��?�^��h��?u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             ��@              �?              �?              �?               @              �?      @       @      �?              �?      @      �?      �?              @      @      �?              @      @      @       @      @      @       @      @      $@      :@     @P@     �S@     �K@     �_@     @_@     @[@     �j@      g@      Q@      E@      P@     �G@      6@      6@       @      @      6@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �tL�@      �@!   ���A)��~6�A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              �?      @      @      .@     �@@     �E@      J@      A@      @      $@      ,@      1@      7@     �B@      0@      @      ,@      1@      4@      @              @      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �܂�@   �#�@      P@!  ��.)A)�)�1f_
B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@n��r ��@Fp4K�^�@�������:�              �?      @       @      *@      "@      �?              @       @      @      @      @              �?       @      @      @               @        

loss>I3�E'       ��F	n���P�A��*

global_step/secJ]�C���      �z�	� ��P�A��*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values33�>
�
 dnn/dnn/hiddenlayer_0_activation*�    N<*@      �@! �yL��@)
�Gf �@2�        �-���q=����?f�ʜ�7
?��%�V6?uܬ�@8?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?Tw��Nof?P}���h?ߤ�(g%k?;8�clp?uWy��r?hyO�s?&b՞
�u?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�������:�             T�@               @              �?              �?              �?              @               @              @              �?      �?              @               @              �?               @              �?              �?      @      �?      �?      �?      �?               @      @              @      @       @      @      @      @               @      @      @      $@      @      @      "@       @      "@      &@      1@      .@      ,@      *@      2@      ;@      4@     �@@      @@      8@      G@     �A@      E@      B@      E@     �C@     �H@     �I@     �K@     �S@     @R@     �T@      R@     �]@      R@      Z@     �X@     �V@     �S@     �X@     @U@     �Q@      I@      O@     �I@     �F@      7@      8@      "@      @      @      @      �?      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values""�>
�
 dnn/dnn/hiddenlayer_1_activation*�   �6�j@      �@! ֭b�^�@)��#���bA2�        �-���q=8/�C�ַ?%g�cE9�?�QK|:�?�@�"��?yL�����?S�Fi��?u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             �@              �?              �?              �?              @      �?      �?              �?      �?              �?      �?      �?       @       @      @      @      @      @       @      @       @       @      @       @      @      @      7@     �D@     �T@     @_@     �_@     �\@     �_@     �f@      c@     �W@      H@      A@      4@      "@      .@      ?@      7@      8@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �z0�@      �@!  T,l A)�6%�O�A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              �?              @      @      "@      .@      <@      >@      @@      8@      8@      ,@     �@@      :@      9@      >@      5@      &@      &@      @      @       @       @       @      "@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �Z�@   ��@      P@!  @��)A)k��+�UB2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?       @      @      �?      $@      @       @      @      �?       @      @      @      @      �?      @      �?      �?      �?               @      �?       @        

loss���I��('       ��F	����P�A��*

global_step/secL�DӪ��4      	[\�	����P�A��*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_0_activation*�   ���"@      �@! ��t�@)��}K���@2�        �-���q=���%�>�uE����>6�]��?����?�[^:��"?U�4@@�$?I�I�)�(?�7Kaa+?��bȬ�0?��82?�u�w74?��%�V6?uܬ�@8?��%>��:?�T���C?a�$��{E?
����G?IcD���L?k�1^�sO?nK���LQ?<DKc��T?ܗ�SsW?��bB�SY?E��{��^?�l�P�`?���%��b?5Ucv0ed?P}���h?ߤ�(g%k?;8�clp?uWy��r?hyO�s?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?#�+(�ŉ?�7c_XY�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@�������:�             ��@              �?              �?               @              �?              �?               @              �?              �?      �?              @      �?              �?       @               @       @       @              �?              �?      �?              �?       @      �?       @      �?              �?              @               @              �?              �?      @      @      @      @      @      @      @      �?      �?       @      @      $@      "@       @      @      *@      @      @      .@      ,@      *@       @      "@      1@      1@      7@      ;@      <@      =@      D@      A@     �D@     �E@      I@     �I@      M@      N@     �M@     �R@      N@     �S@      N@     @U@     @T@      [@     �_@      V@      V@      X@     @Q@     �M@      E@     @P@      I@     �D@      8@     �@@      7@       @      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�ݕ>
�
 dnn/dnn/hiddenlayer_1_activation*�   @��m@      �@! �O���@)�y#b�WeA2�        �-���q=��7��?�^��h��?��tM@w`<f@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ��@               @              �?              �?       @      @       @       @              �?               @       @       @      �?               @      �?              @      @      @      @      @      @      @      $@      5@      D@      R@     @V@     �T@     �J@     �S@     �S@     �d@      m@      a@     @Q@      6@      @       @      ,@      ?@     @P@      (@       @      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ��@      �@!  x+!A)	vG	H�A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              �?      @      "@      2@      9@     �B@     �I@      B@      2@      (@      @      @      =@      @@      1@      3@      ,@       @      @       @      @      4@      (@      @       @      �?        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �y��@   @U�@      P@!  ��?�*A)���J0B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              @      @       @      @      *@              @      �?      �?              @      @      @      @      �?              �?              �?      @              �?        

loss��Ii+q2'       ��F	�Z��P�Aف*

global_step/sec�3D��W��      �A�	����P�Aف*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values{�>
�
 dnn/dnn/hiddenlayer_0_activation*�   �y$@      �@!  �s��@)��Jx��@2�        �-���q=I��P=�>��Zr[v�>>h�'�?x?�x�?+A�F�&?I�I�)�(?��bȬ�0?��82?�u�w74?��%�V6?uܬ�@8?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?uWy��r?hyO�s?&b՞
�u?o��5sz?���T}?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             �@              @               @              �?              �?              �?       @               @       @       @      @       @              �?       @              �?      @      �?              �?               @               @              �?       @               @              �?      �?       @      �?               @      @               @       @               @      @              @       @      @      "@      @      @      @              &@      @      @       @       @      @      @      @      ,@       @       @      ,@      0@      4@      (@      3@      6@      C@      5@     �C@      <@      ?@     �G@     �G@      H@      M@      L@      L@     @R@     @U@     �S@      I@      R@     �Q@     �S@      W@     @U@     �W@     @X@      U@      S@     @V@     @X@     @Q@     �K@      E@      G@      <@      (@      @       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�̜>
�
 dnn/dnn/hiddenlayer_1_activation*�   ���i@      �@!  G��]�@)L�*�nfA2�        �-���q=�@�"��?�K?�?�Z�_���?��7��?�^��h��?u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@�������:�             `�@              �?      �?              �?              �?       @      �?       @      �?              �?              @      �?       @               @               @      @      @       @      @       @      @      @      5@      0@      :@      N@     �`@      Z@     @Y@     �Y@      c@     �a@      \@      Q@      ?@      8@      $@      ;@      O@     �D@      E@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �;c�@      �@!  H;�"A) �Ϟ��A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              �?      @      5@      8@      A@      :@      7@      =@      4@      $@      2@      8@      A@      5@      &@      (@       @      @      @      1@      *@      2@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �A�@   ��+�@      P@!  @z�I-A)��ZGRB2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?      @      @      @      @      @      @       @       @      @      @      @      �?      @      �?       @               @      @      @       @        

lossΌ�Iտr'       ��F	����P�A��*

global_step/sec�D�'1�      �z�	����P�A��*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�Q�>
�
 dnn/dnn/hiddenlayer_0_activation*�   @�x$@      �@! �� ԰@)�.�q���@2�        �-���q=x?�x�?��d�r?�.�?ji6�9�?��82?�u�w74?uܬ�@8?��%>��:?d�\D�X=?���#@?IcD���L?k�1^�sO?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?*QH�x?o��5sz?���J�\�?-Ա�L�?#�+(�ŉ?�7c_XY�?���&�?�Rc�ݒ?^�S���?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             8�@              �?               @              @              @       @      @              @              @              @      @      �?      �?       @      @       @      @      �?       @      @      @              �?               @               @              �?       @              �?              @      �?      �?      @      @      @      @      @      &@       @      @      (@      @      @      &@      *@      ,@      &@      ,@      *@      @      *@      9@      &@     �@@      =@      :@      A@     �D@     �@@      F@      G@     �E@     �I@     �L@     �J@     �N@     @R@     �T@      N@      Q@     �X@      T@      ]@     �Y@     �Y@     �Q@     @P@      P@     �K@      F@     �O@      G@      =@      "@      7@      3@      @      @       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values""�>
�
 dnn/dnn/hiddenlayer_1_activation*�   `��m@      �@! lں���@)�g�۬cA2�        �-���q=I���?����iH�?��]$A�?����?_&A�o��?��tM@w`<f@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�              �@               @       @              �?              @              �?               @      @      �?              �?      @      �?      �?       @       @       @               @      @       @      @      @      @      @      @      @      :@     �G@     �N@     �E@     �X@     �`@      d@      e@      g@      f@      V@      1@      @      @      (@      6@     �C@      @       @      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    p�@      �@!  �G A)�ْ���A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              @      ,@      .@      7@      E@     �F@     �B@      1@      "@      5@      C@     �C@      (@      @      0@      &@      @       @       @      @      *@      @       @      @      �?        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ����@   ��4�@      P@!  �A��(A)i�4�B
B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�               @      @      @      @      *@              @      �?      @      @      @              �?      @              �?              �?              @              �?        

loss���I�[�'       ��F	�� �P�A��*

global_step/sec��C�D���      �A�	, �P�A��*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesq=�>
�
 dnn/dnn/hiddenlayer_0_activation*�   �w|$@      �@! ���3+�@)ɇvk�@2�        �-���q=��[�?1��a˲?ji6�9�?�S�F !?�[^:��"?U�4@@�$?+A�F�&?I�I�)�(?��82?�u�w74?uܬ�@8?��%>��:?d�\D�X=?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?o��5sz?���T}?>	� �?����=��?���J�\�?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�              �@              �?              �?       @               @       @               @               @      @              �?      �?      @      �?      �?              �?      �?               @              @      �?      @      �?              �?      �?      @              �?              �?      �?              �?              �?       @              �?              �?              @       @      @      �?      @      @      @      @      @      "@      @      @      @      @      @      @      @      @      $@      @      &@      1@      @      4@      .@     �@@      6@      2@      3@      K@     �@@      ?@      B@     �B@     �H@     �P@     @R@     �M@     �S@     �S@      V@      N@     �T@      Q@      V@      Y@     @Y@     @V@     @V@      [@      X@     @V@      U@     �M@      L@      9@      8@      @      @       @      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�    &j@      �@! �"��~�@)����dA2�        �-���q=��]$A�?�{ �ǳ�?S�Fi��?ܔ�.�u�?��tM@w`<f@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@�������:�             @�@              �?              �?              �?              �?      �?              �?      �?              @              @      �?               @       @              �?       @       @      @      @       @      @      :@      J@      *@      2@      J@     �a@     �S@      T@     �[@     �`@     �e@      `@     �R@      >@     �E@       @      $@     �H@     �E@      :@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   `���@      �@!  лӸ!A)���7���A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              @      @      :@      ;@      7@      ;@      1@      E@      9@       @      1@      >@      2@      .@      7@      0@      ,@      @              "@      .@      ,@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ���@   �6��@      P@!  ���,A)*�K�B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?      @      @      @      @       @      $@      �?      �?      @      @       @       @      @              @               @      @       @        

lossv�I k�'       ��F	O` �P�A��*

global_step/sec��C�� �      �7�>	ҹ �P�A��*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesff�>
�
 dnn/dnn/hiddenlayer_0_activation*�   `��$@      �@!  a�?�@)�N�(���@2�        �-���q=d�\D�X=?���#@?
����G?�qU���I?IcD���L?�lDZrS?<DKc��T?Tw��Nof?P}���h?;8�clp?uWy��r?����=��?���J�\�?-Ա�L�?eiS�m�?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             l�@               @               @       @              @              @               @              �?               @               @       @               @              �?      @       @       @      @       @      @      @      @       @               @      @       @      @      @      "@      $@      @       @      ,@      *@      *@      4@      $@      (@       @      =@      2@     �C@     �F@      <@     �B@      G@      C@      B@      G@     �J@     �M@      O@     �P@      O@      W@     �S@      S@     �W@     @S@      S@     �T@     �V@      S@      O@     �I@     �O@      H@      K@     �O@      E@     �@@      9@      1@       @       @      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�ݑ>
�
 dnn/dnn/hiddenlayer_1_activation*�    d�g@      �@! �,]���@)�XRt�`A2�        �-���q=}Y�4j�?��<�A��?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?�Ca�G��?��7��?W�i�b�?��Z%��?S�Fi��?ܔ�.�u�?�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�������:�             �@              �?              �?              �?              �?              �?               @              �?      �?              �?               @               @      @              �?       @      �?      @       @               @      @      "@      @      @       @      *@      C@      <@      >@     �E@     �Y@      a@      [@     @_@     �f@     �b@     �e@     @W@      &@      @      $@      (@      :@      5@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    L�@      �@!  �ٻ�A)�(��~�A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�������:�              p@               @       @      3@      ;@     �G@      I@      <@      ;@      4@      .@      (@      =@      ;@      1@      4@      (@              @       @      @      "@       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ���@   ���@      P@!  ��o'A)f�B�\B2�1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@�������:�              @      @      $@      "@      �?      @      @       @       @      @      @       @      @              �?               @      �?        

lossII�Y��'       ��F	Q�! �P�A�*

global_step/secm>�C���*4      	[\�	c-" �P�A�*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values  �>
�
 dnn/dnn/hiddenlayer_0_activation*�    ?�*@      �@! @�Ly;�@)2B�G~��@2�        �-���q=6�]��?����?ji6�9�?�S�F !?I�I�)�(?�7Kaa+?��VlQ.?��82?�u�w74?���#@?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�������:�             ��@              �?              @              �?      @              �?              �?      �?      �?              @              �?      �?              @              �?      @              @      @      �?              @      @              @      �?              @      �?              @      @      @               @              @               @      �?               @      @              @       @       @      @       @      @      �?      "@      @       @      $@      &@      @       @      @      0@      @      0@      (@      1@      1@      @@      4@      3@      >@      1@      2@     �E@      B@     �A@      H@      G@     �I@      I@     �Q@     @R@     @R@      O@     �R@      S@      T@      H@     �S@     �R@     @R@      L@     @P@     �P@      Q@      <@      P@      E@      D@      .@      ;@      7@      (@       @       @      �?              �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   �8�m@      �@! D�y��@)Y�e!��cA2�        �-���q=!�����?Ӗ8��s�?��7��?�^��h��?{2�.��@!��v�@زv�5f@��h:np@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ؀@              �?              �?              �?              �?              �?               @       @      @      $@              @      @      @      @       @      @      @      @      ,@      0@      :@     �E@     �_@      _@     �h@      ]@     `d@      f@     �Y@      L@     �B@      @@       @      @      3@     �F@      (@      "@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ���@      �@!  �c6A)���!��A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@rW<���@�������:�              p@              �?               @      @      *@      .@      >@     �I@     �G@     �@@      ?@      1@      ,@      3@      <@      4@      @      @      @      "@      @              *@      $@      @      @      �?        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �Y�@   @�0�@      P@!  @U=�'A)p��W
B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?              @      @      @      &@      @      @      �?      @      @      @       @              �?      �?       @              @      �?      �?        

loss~�IVy�k'       ��F	�3 �P�Aͅ*

global_step/sec�5�C{䤓T      I�	��3 �P�Aͅ*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesR��>
�
 dnn/dnn/hiddenlayer_0_activation*�   �L%@      �@! @�w�ð@)�礋�,�@2�        �-���q=�.�?ji6�9�?��%�V6?uܬ�@8?���#@?�!�A?�T���C?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?eiS�m�?#�+(�ŉ?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             �@              �?              �?              �?      �?               @      �?      �?              @      @       @      �?              �?      �?      �?      �?      �?      �?              �?       @      @      @       @      �?      �?       @              @              �?      �?      �?               @      �?      @              �?      @      @      @      @      @      @      "@      @      "@      @      @      @      &@       @      @      .@      2@      .@      5@      0@      &@      *@      =@      =@     �@@      F@     �@@      ;@      A@      C@      K@     �F@      F@     �L@      G@     �F@      K@      Q@     @S@     �L@     @R@     @V@      W@     �\@     �X@     �U@     �P@      M@      O@     �G@     �E@      F@     �@@     �@@      >@     �@@      2@      $@      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesUU�>
�
 dnn/dnn/hiddenlayer_1_activation*�    U�j@      �@! �G_k�@)~��7[;bA2�        �-���q=�/�*>�?�g���w�?���g��?I���?!�����?Ӗ8��s�?�@�"��?�K?�?����?_&A�o��?�Ca�G��?��7��?ܔ�.�u�?��tM@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             �@              �?               @               @              �?              �?              �?               @               @      @              �?      @               @              �?       @      �?      �?      @      @      @              @      @      @      "@      �?      @       @      @      $@      ;@     �K@      R@      X@     �^@     �a@      Z@     �h@     �c@     @W@     @X@      =@      $@      (@      "@      ,@      ;@      7@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �&�@      �@!  ����A)�Й�}��A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@               @       @      "@      ,@      ;@      D@      G@      C@      4@      ,@      7@      7@      ?@      3@       @      (@      *@      @      @       @      @      @      "@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    ē�@   �B�@      P@!  �ZMi(A)o���{	B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              @      @       @      $@      $@      @       @       @      @      @      @       @      �?      @      �?      �?      �?              �?      �?       @        

lossB�I��"'       ��F	��A �P�A��*

global_step/secpC�C�*J�      �qk�	�B �P�A��*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�p�>
�
 dnn/dnn/hiddenlayer_0_activation*�   ૤*@      �@! ��0C�@)X�����@2�        �-���q=��ڋ?�.�?�7Kaa+?��VlQ.?�u�w74?��%�V6?��%>��:?d�\D�X=?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?�lDZrS?<DKc��T?��bB�SY?�m9�H�[?E��{��^?Tw��Nof?P}���h?ߤ�(g%k?;8�clp?uWy��r?o��5sz?���T}?���J�\�?-Ա�L�?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�������:�             �@              �?              �?              �?               @              �?               @       @       @              @               @      �?              �?      �?               @               @               @              @              �?      �?      @              @              @      @       @       @       @       @      @      @      @       @      @      @      @      @      @       @      (@      4@      2@      0@      0@      (@      1@      9@      0@      :@      <@      A@      8@      G@      ?@     �A@     �H@     �J@      M@      J@     �J@      N@     �L@     �L@     �R@     @R@     �N@     �T@      R@     �S@     @T@     �P@     �P@      Q@      J@     �A@     �C@      5@      ;@      8@      7@      6@       @      @      @      �?              �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values33�>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��ui@      �@! �Q4o\�@)4��}Z�`A2�        �-���q=^�S���?�"�uԖ?��Z%��?�1%�?ܔ�.�u�?��tM@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@�������:�             P�@              �?              �?              �?              �?              �?      �?      @              �?      @              �?      @       @      @       @      @              @      @      @      @      @      @      (@      1@      A@      1@      1@      ?@     @X@     �W@     �U@     �e@     Pp@     �i@     `c@     �O@      :@      (@       @      @      "@      &@      (@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �c�@      �@!  � !A)��OB��A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              �?               @      @      &@      A@      D@     �H@     �E@      =@      8@      @      "@      .@      @@      D@      6@      @      @      @      �?              @      @      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    &�@   ��@�@      P@!  �%��%A)d��[g�B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?      �?       @      &@      @      @      @       @               @      @      @       @      �?      �?              �?              �?              �?        

loss~��I��r�'       ��F	�Q �P�A��*

global_step/sec~m�C{"�*      �M7	�eQ �P�A��*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values{�>
�
 dnn/dnn/hiddenlayer_0_activation*�    �$@      �@!  r�ư@)�ܼH�@2�        �-���q=>h�'�?x?�x�?��d�r?�5�i}1?�[^:��"?U�4@@�$?�7Kaa+?��VlQ.?��%�V6?uܬ�@8?��%>��:?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?&b՞
�u?*QH�x?o��5sz?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@              �?              �?              �?              �?               @      �?              �?       @              �?      �?      �?      �?      �?      �?      �?       @      �?              @              �?       @              �?       @       @       @       @      @      @      �?      @              @       @       @      @      �?      @      @      .@       @      @      @      @      &@      @      @      @      &@      �?      @      (@      ;@      1@      *@      (@      .@      ,@      5@      3@      @@      A@      =@     �@@      A@     �D@     �C@      M@     �E@      O@     �D@     �O@      M@      O@     �N@     @R@      P@      P@      K@     �Q@     �M@      R@      L@      O@     �J@     �E@     �E@     �I@     �O@     �H@      >@     �@@     �E@      *@      �?      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesww�>
�
 dnn/dnn/hiddenlayer_1_activation*�   `ăm@      �@! oF���@)u0,%�sdA2�        �-���q=hyO�s?&b՞
�u?����=��?���J�\�?�?>8s2�?yD$��?�Z�_���?����?_&A�o��?�Ca�G��?ܔ�.�u�?��tM@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             Ѐ@              �?               @              �?              �?              �?              �?              �?      �?               @              �?              �?      @              @      �?      �?      @       @              @      @       @      "@      �?      @      (@      .@     �B@      6@      M@     �W@     @b@     @X@     @_@     @V@      e@     �i@      X@      6@      @       @              $@      ?@      5@      :@      ;@      .@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   `��@      �@!  ���	A)�>r Ҫ�A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              @      (@      ;@     �C@      E@     �H@      @@      A@      1@      .@      $@      1@      <@      $@      @      @               @       @      @      &@      "@        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    /�@    ��@      P@!  �b��(A)&�ȃw�B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?      $@      @      @      (@       @      @      �?      @      �?      @      @              �?               @      �?      �?      @        

loss���I)FC'       ��F	�a �P�A��*

global_step/sec��C]o�$      �c3	�8b �P�A��*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_0_activation*�   @��"@      �@! @�"p�@)���Vj�@2�        �-���q=�5�i}1?�T7��?U�4@@�$?+A�F�&?I�I�)�(?�7Kaa+?���#@?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@�������:�             ��@              �?              @              �?              @              �?      �?       @              @      @       @      @      @      @      �?      @      $@      @               @      @      �?      @      �?      @      @              �?              �?       @      �?      �?              �?              @              �?               @       @       @      @      @      @      �?      @       @       @      @      &@      "@              @       @      �?      ,@      @      @      "@      7@       @      1@      *@      (@      (@      4@      3@     �C@      ;@      =@      :@      H@     �E@     �C@     �G@     �G@     @Q@      K@      N@     �O@      S@      T@      T@     @T@      P@     �I@      T@      V@     @S@      K@      P@     @P@      C@      E@      N@     �D@      E@      ,@      @@      9@       @       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   @��m@      �@! :�X��@)�4����aA2�        �-���q=_&A�o��?�Ca�G��?ܔ�.�u�?��tM@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             �@              �?              �?              �?       @              �?               @              �?      @      �?      �?      �?              @       @       @              @       @      "@      @      @       @       @      0@     �B@     �B@     �E@     �R@     @a@     �a@      [@     �Y@     `a@      k@     �X@     �M@      @       @      4@      "@      @      *@       @      2@      $@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �[��@      �@!  8Q��A) �Hf`g�A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?       @      1@      0@     �B@     �B@      H@      ?@     �D@      ;@      0@      @      8@      3@      @      (@      "@               @      @              @       @      @      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    )�@   `�%�@      P@!  @��'A)=^�B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@�<�@P�w\�u�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�               @      "@      @      @      $@      @       @      @       @              @       @              @               @              �?               @        

loss�?�I���'       ��F	4.q �P�A݈*

global_step/secd�C���pD      �Ai�	�jq �P�A݈*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values)\�>
�
 dnn/dnn/hiddenlayer_0_activation*�   ��T%@      �@! @����@)�ma����@2�        �-���q=f�ʜ�7
?>h�'�?x?�x�?�vV�R9?��ڋ?�7Kaa+?��VlQ.?��bȬ�0?��82?��%>��:?d�\D�X=?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?hyO�s?&b՞
�u?���T}?>	� �?����=��?-Ա�L�?eiS�m�?#�+(�ŉ?�#�h/�?���&�?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             X�@              �?       @              �?              @              �?               @              @              �?              @      �?      @               @      �?      @      �?              �?       @              @      �?       @      �?              @              �?      �?              @       @              �?              @      �?      �?      @      @      @      @      @      "@      @      @       @      �?      @      �?       @       @      @      @      @      @      &@      2@       @      2@      2@      5@      $@      4@      0@      ;@      8@      8@      2@     �@@     �C@      <@      H@     �B@     �M@     �G@      M@      K@     �O@      R@     �P@      R@     �J@     �K@      U@     �V@     @V@     �W@     �U@     �V@      U@     �I@     @[@     �Q@     �H@      9@      @@      4@      (@      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�    f�m@      �@! �J$,�@)�/�*_�gA2�        �-���q=�K?�?�Z�_���?����?_&A�o��?�1%�?\l�9�?�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ȁ@              �?              �?              �?              �?      �?              �?               @               @              @      @       @       @      �?      �?      �?      �?      @      �?      "@       @       @      $@      @      $@      2@     �D@     �N@     @]@     �V@     �c@     @Z@     �^@     �c@     @Z@      I@     �F@      B@      *@      .@      H@      O@      =@      &@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �w��@      �@!  ��LC"A)��>����A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              @      "@      "@      6@      C@     �E@     �B@      :@      (@      0@      ,@      <@      8@      @      @      $@      .@      $@       @       @      4@      .@       @      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ����@   ��&�@      P@!   �-A)⎠��B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�               @      @      @      @      $@      @      @       @      @       @      @      @      �?              �?      @      �?               @      @       @      �?        

loss�T�I,��'       ��F	˹} �P�A��*

global_step/sec:#�C6�l�      
��M	�
~ �P�A��*�!
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values��>
�
 dnn/dnn/hiddenlayer_0_activation*�   @��$@      �@! ���� �@)G�U�+Y�@2�        �-���q=�f����>��(���>�5�i}1?�T7��?��VlQ.?��bȬ�0?��82?�u�w74?�T���C?a�$��{E?IcD���L?k�1^�sO?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             �@              �?              �?              �?              �?              �?              �?              @      �?       @      @              �?       @      �?       @               @       @      @      @      �?              @       @      �?      @              �?               @              �?      �?              �?              @               @       @      @               @       @      @      �?      @       @      @       @      @       @      "@      @       @      "@      .@      1@      @      0@      $@      *@      $@      5@      4@      <@      7@      9@      ;@     �E@     �G@     �B@      G@      D@     �L@      H@     �H@     �K@     �N@      S@     �M@     @S@     �U@      W@     @W@     �U@      U@     �S@     @P@     @Q@      P@      G@     @P@      K@      B@      9@      8@       @      (@      @       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values33�>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��jl@      �@!�ˈS���@)0p�	��bA2�        �-���q=#�+(�ŉ?�7c_XY�?�Rc�ݒ?^�S���?�uS��a�?`��a�8�?�/�*>�?�g���w�?�Ca�G��?��7��?\l�9�?+Se*8�?�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             @�@              �?              �?              �?               @              �?               @              @      �?               @      �?      �?       @              @              �?              �?      @      @       @               @      @      @      @      @      @       @      ,@      B@      A@      E@      M@     �Y@     @X@     �[@     �Y@      e@     �f@     `a@     �U@      $@      1@      .@      7@      C@      *@      @      *@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ��C�@      �@!  0US�A)��6
�u�A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              @      $@      2@      ?@      D@      K@      =@      :@      .@      2@      0@      8@      5@      ,@      1@      @      @      @      @      &@       @       @      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �(w�@    _�@      P@!  ���(A)�tZ#�

B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�               @      @      @      "@       @      �?      @      �?      @       @      @      @       @      @              �?      �?      �?       @      �?              �?        

loss��I<�Il'       ��F	ۣ� �P�A��*

global_step/sec_��C#���      �;	�� �P�A��*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full��0?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesף�>
�
 dnn/dnn/hiddenlayer_0_activation*�   ��#@      �@! ���^�@)|~p���@2�        �-���q=��d�r?�5�i}1?�T7��?�vV�R9?ji6�9�?�S�F !?�[^:��"?�7Kaa+?��VlQ.?��bȬ�0?��82?�u�w74?��%>��:?d�\D�X=?���#@?�!�A?�T���C?a�$��{E?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?eiS�m�?#�+(�ŉ?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@�������:�             @�@              �?       @      �?              @      �?              �?      �?              �?              �?      �?      @              �?               @              �?      @               @      @      �?      �?              �?      @              @      @      @      @      �?      @              �?      �?              �?              �?              @      �?              �?       @      @       @      @       @      @       @      @       @      @       @       @      �?      @      @      @      $@      *@      *@      &@      $@      (@      @      @      1@      ,@      9@      4@      8@      ?@     �E@     �A@      B@      K@     �F@     �I@      E@     �P@      Q@     �T@      S@     �S@     @U@     �T@      T@     �W@     @U@     �U@      T@     �R@     �O@     �K@      D@     �J@      F@      A@      >@      A@      5@      9@      "@        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��{l@      �@! ���vi�@)�Ϳ�3cA2�        �-���q=<DKc��T?ܗ�SsW?Ӗ8��s�?�?>8s2�?ܔ�.�u�?��tM@h�5�@�Š)U	@{2�.��@!��v�@زv�5f@)����&@a/5L��@v@�5m @�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             ȁ@              �?              �?               @               @               @      @               @       @              @      �?      "@       @       @      �?      @      @      @      �?      @      @      &@      5@      F@      >@      L@      a@     @_@     �Z@      _@      g@     @f@     �Y@     �A@      =@       @              &@      >@      =@      .@      :@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   @�U�@      �@!  X\͛A)��N��A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?      @      &@      1@      :@      B@      C@      ?@      ;@      3@      ?@      :@     �A@      9@       @               @      @              @      (@      @      "@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �}�@   @�z�@      P@!  @��2)A)x��}cB2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@q�݆L��@0�Z�:��@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�               @      @       @      @       @      @      @      @      @      @      @      @               @               @       @               @        

loss��I���i'       ��F	��� �P�A��*

global_step/sec��C�I4d      �7Wl	�Q� �P�A��*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values=
�>
�
 dnn/dnn/hiddenlayer_0_activation*�   `3�*@      �@! @�>��@)�IGl��@2�        �-���q=�[�=�k�>��~���>>�?�s��>�FF�G ?>h�'�?x?�x�?�T7��?�vV�R9?�.�?ji6�9�?U�4@@�$?+A�F�&?�u�w74?��%�V6?��%>��:?d�\D�X=?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?o��5sz?���T}?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�������:�             �@              �?               @              �?              �?              �?              �?              �?              @              @      �?              @      @              @              @      @       @       @      �?      �?      @               @              �?      @      @       @      �?              @               @       @              @               @               @              @      @       @      @      �?      $@      @      @      (@      @      @      @      @      @       @       @      @      @      $@      &@       @      @      @      3@      @      *@      *@      3@      .@      :@      (@      4@      C@      =@      ;@      G@      =@      N@      H@     �I@     �L@      Q@      T@     @R@     �P@      S@     �Q@      U@     @X@     �V@     �Q@      Q@      P@     �J@     �H@     �O@     �I@      A@      <@      =@      $@      @       @      @       @               @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   �՗j@      �@! �jHI�@)Ct��>�bA2�        �-���q=h�5�@�Š)U	@{2�.��@!��v�@زv�5f@��h:np@)����&@a/5L��@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             ��@              @              @      �?       @              @              �?      �?      @      �?      �?      �?      @      @       @      @      @       @      6@     �K@      L@     �G@     �M@     @\@     �U@      `@     �[@     @X@     �c@     �a@      L@      ?@      ?@      6@      0@      4@      8@      <@      �?        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   @�@      �@!  ���A)`��;4��A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@               @              @      @      $@      ?@      ?@     �F@     �D@      ;@      7@      .@      2@      9@      ;@      &@      (@      *@      @      @      @      @      @      @      $@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    �%�@   �I�@      P@!  @��'A)�����W	B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�               @              $@      @      @      $@      �?      @      �?      @      @      @       @       @       @              �?      �?      �?      �?      �?       @        

loss��I�(��'       ��F	N]� �P�A�*

global_step/sec;+�C�~($      �c3	�� �P�A�*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values��>
�
 dnn/dnn/hiddenlayer_0_activation*�   ��Z%@      �@!  KH��@)�sG�a��@2�        �-���q=x?�x�?��d�r?I�I�)�(?�7Kaa+?��VlQ.?��82?�u�w74?��%�V6?��%>��:?d�\D�X=?���#@?
����G?�qU���I?IcD���L?k�1^�sO?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?P}���h?ߤ�(g%k?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?^�S���?�"�uԖ?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@              �?              �?      �?              �?      �?              �?      �?              �?      �?      �?               @              �?               @              �?              �?               @      �?       @               @              �?      �?      �?       @       @      �?              �?               @       @      @      �?      �?       @      @      @      @      @       @      @      @      @      @      @      (@      $@      .@      "@      &@      2@      (@      &@      *@      0@      7@      5@      9@      <@      9@     �F@     �B@     �A@      A@     �C@     �N@      O@     �K@      L@     �R@     @U@     �L@     �L@     �T@     @V@     @W@     �[@     �T@     �R@     �U@     @S@      J@      F@     @Q@     �P@     �G@      6@     �@@      =@      .@      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�ݕ>
�
 dnn/dnn/hiddenlayer_1_activation*�   `�jm@      �@!@酤��@)�)lR�+fA2�        �-���q=nK���LQ?�lDZrS?�Rc�ݒ?^�S���?yD$��?�QK|:�?��7��?�^��h��?ܔ�.�u�?��tM@�Š)U	@u�rʭ�@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ��@              �?              �?              �?               @              �?              �?              �?               @               @      �?      �?       @      �?       @       @       @              @      �?      @      @      @      &@      &@      4@      @      ,@     �B@     @V@     �[@     @d@      b@      c@      f@     �a@     @S@      *@      @      2@      0@      ;@      4@     �A@      3@      $@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ���@      �@!  �.H%!A)*���	��A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@               @      @      "@      5@      =@      ;@     �A@      <@      8@      ,@      0@      =@     �@@      5@      .@      1@       @       @      @      @      @      @      $@      $@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �?��@    �/�@      P@!  ��e_+A)	u:�B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              @      @      @      @      @      @      @       @      @      @      @      @       @      @      �?              �?      �?      �?      �?       @       @        

lossnY�I���o'       ��F	׌� �P�Aь*

global_step/secݲ�C(䚦      	Un*	 �� �P�Aь*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_0_activation*�   �@+@      �@!  qd�l�@)�Τn"�@2�        �-���q=�[^:��"?U�4@@�$?��VlQ.?��bȬ�0?��82?�u�w74?��%�V6?uܬ�@8?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?���J�\�?-Ա�L�?#�+(�ŉ?�7c_XY�?�#�h/�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�������:�             �@              �?              �?               @              �?               @       @      �?      �?              @              �?      �?      @      @      @      @      �?      @      @      @      @      @      @      @      @       @      �?       @      �?              @              �?      @               @       @              @      @      �?      �?       @      @      @      �?      @      @      @      @      @      @      @      @      @      (@      @      ,@      3@       @      3@      ,@      *@      1@      3@      3@      4@      :@      7@      :@     �F@     �B@      ;@      B@      ;@     �N@     �L@     �L@      F@      R@      R@      O@     �P@     �T@     �V@     �V@     @V@     �S@      L@     �I@     @Q@     @P@      P@     �M@      C@      I@      =@      G@      G@      8@      $@      @       @               @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesDD�>
�
 dnn/dnn/hiddenlayer_1_activation*�   `�lm@      �@! @���>�@)&�)�b�gA2�        �-���q=��tM@w`<f@u�rʭ�@�DK��@زv�5f@��h:np@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             `�@              �?               @               @               @       @              �?      @      �?      �?      �?      @       @       @      @      @      @      @      (@      4@      0@     �N@     �P@     @Z@     @S@     �\@     �_@     @W@     �c@     �c@     �S@      C@      E@      3@      @      8@      9@      B@      ?@      $@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �c��@      �@!  �pD� A)׼KM�A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@               @              @      @      (@      7@      =@      B@      G@     �A@      <@      *@       @      *@      6@      .@      1@      0@      $@      @      @       @       @      @      (@      ,@       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    &�@   �@9�@      P@!  ��x+A){�'��zB2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�               @      �?      @      @      @      (@      @      @      �?              @      @       @      @      @      �?      �?      �?               @       @      @        

loss}QI��p�'       ��F	��� �P�A��*

global_step/secoD@Vy��      
��M	{� �P�A��*�!
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�Q�>
�
 dnn/dnn/hiddenlayer_0_activation*�   �ٵ$@      �@! ��7퀰@).�(Gr��@2�        �-���q=x?�x�?��d�r?��VlQ.?��bȬ�0?�u�w74?��%�V6?��%>��:?d�\D�X=?���#@?�!�A?�T���C?a�$��{E?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             8�@              �?              �?              �?              �?      �?      �?              @               @      �?      �?      @       @       @       @      (@       @      *@      @      @      �?      @              @      @               @      *@       @              �?       @               @       @      @              �?      @      �?      @      @      @      @      @      @      @      $@      &@      @       @      @      @      @      &@      @      @       @      0@      4@      4@      9@      5@      $@      5@      7@     �A@      C@      C@      9@      >@     �I@     �E@      E@     �F@      D@      H@     �J@     �I@     �E@     �L@     �R@     �H@     �S@     @P@      R@      T@      Q@     �P@     �I@     �I@     �J@     �O@      I@      G@     �A@     �F@      B@     �E@      <@      &@      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values33�>
�
 dnn/dnn/hiddenlayer_1_activation*�   `�am@      �@! �+�=��@)�:��AbA2�        �-���q=�/�*>�?�g���w�?��]$A�?�{ �ǳ�?�@�"��?�K?�?��Z%��?�1%�?3?��|�?�E̟���?��tM@w`<f@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             Ȁ@               @               @              �?              �?               @               @              �?               @              �?      �?       @              @      @       @      @      @       @      �?      �?      �?      @      @       @      @      @      @      @      "@      1@      9@     �T@     �`@     �Z@      U@     �_@      _@      c@     �i@     �N@     �H@      2@       @      *@      @      8@      6@      :@      $@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ���@      �@!  ��d�A)0k�1:�A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              @      &@      8@      @@      D@     �J@     �B@      9@      2@      2@      1@      :@      :@      $@              @      @      @       @      @      @      $@      @      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   @���@   `(6�@      P@!  �L�'A)�(̥�
B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?       @      @      @      *@       @      @      @      @       @      @      @              �?              �?              �?      �?       @      �?        

loss7�OI�K�'       ��F	�� �P�A��*

global_step/sec�!D�8��t      /@}	�K� �P�A��*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values
ף>
�
 dnn/dnn/hiddenlayer_0_activation*�   `�#@      �@!  )��@)�OM#�1�@2�        �-���q=�XQ��>�����>f�ʜ�7
?>h�'�?��ڋ?�.�?U�4@@�$?+A�F�&?I�I�)�(?�7Kaa+?��%�V6?uܬ�@8?��%>��:?d�\D�X=?���#@?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@�������:�              �@              �?              �?              �?              �?              �?               @      �?              �?               @      �?       @      @      �?      @              �?       @      @       @              @      �?       @       @       @      �?      �?       @      �?       @      �?      �?       @              @      �?              �?      �?              @      �?              �?       @              @      @       @      @      @      �?       @      @      @       @      @      @       @      @      (@      $@      &@      0@      (@      (@      6@      .@      @      0@      *@      @@      9@     �@@      8@      ?@      B@      A@     �B@      G@      E@      M@     �F@     �L@     �O@      Q@     @S@      J@     �P@     �N@      L@     �P@     @T@     @P@      P@      U@     �S@     �S@     @Q@     @S@      Q@     �R@     �A@      L@      B@      6@      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesUU�>
�
 dnn/dnn/hiddenlayer_1_activation*�   �iRm@      �@! h���@)���GgA2�        �-���q=��(!�ؼ?!�����?��7��?�^��h��?��tM@w`<f@{2�.��@!��v�@زv�5f@��h:np@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ��@               @              �?              �?              �?               @              @       @               @      @      @      @               @              @      @      @      @      @      @      @      @      ,@      :@     �P@     �\@      [@     �W@     @_@     �`@     �f@     @c@     �K@      >@      4@      �?      1@     �P@      5@     �@@      6@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ��@      �@!  0�N�!A)��>DG#�A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@               @      @      "@      1@      ;@     �@@     �A@      ?@      3@      0@      6@      7@      7@      2@      $@      0@      $@       @      @              0@      ,@      $@      "@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   `晵@    �-�@      P@!  �f�m,A)��sB�QB2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              @      @      @      @      @      @      @       @      @      @      @      @              @      �?       @              @       @      �?       @        

loss9e�I��7'       ��F	HR� �P�A��*

global_step/secP�D����      �V�t	��� �P�A��*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values��>
�
 dnn/dnn/hiddenlayer_0_activation*�   ���$@      �@!  >�'�@)

އ��@2�        �-���q=�S�F !?�[^:��"?U�4@@�$?��bȬ�0?��82?�u�w74?��%�V6?uܬ�@8?��%>��:?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�l�P�`?���%��b?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?&b՞
�u?*QH�x?���T}?>	� �?���J�\�?-Ա�L�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ��@              �?      �?              �?               @      �?       @              �?       @              �?       @              @      @               @      �?               @               @              �?              �?               @              @              �?      @       @       @              @       @      @      @      @      @       @      @       @      @      �?      @       @       @      @              &@      @      $@       @      *@      *@      @      *@      "@      &@      3@      ;@      .@      7@      3@      ?@      >@      D@     �B@     �G@     �@@      E@      Q@      K@     �J@     �Q@     @R@      S@     @[@      W@      V@      ^@     �Y@     �[@     @U@      V@     @V@     @P@     �G@      E@      :@      9@      3@      6@      &@      @      �?      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesUU�>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��Bg@      �@! �wʸ�@)
g|�`A2�        �-���q=�^��h��?W�i�b�?w`<f@�6v��@زv�5f@��h:np@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�������:�             ��@               @              �?              �?              �?       @              @      �?      @              �?      @              @      @      @      *@      (@      9@      "@      7@      N@     �K@      W@     �g@     �f@     �d@     @j@      ^@     �I@      @@      ,@              @      8@      8@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   `�@      �@!  �v}2A)�X��@�A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�������:�              p@               @      @      &@      8@      9@     �E@      ?@      2@      @      ,@      ?@      D@     �B@      ?@      (@      (@      &@      "@       @              @      "@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   @�o�@   @W��@      P@!  ��*((A)
6��S9B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@%4�>�@{i�.�@n��r ��@�������:�              @      @      @      @       @              �?      @      @      @       @      @              @       @      �?              �?       @        

loss���IB�'       ��F	�V� �P�A�*

global_step/sec%D,���      Цh.	��� �P�A�*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesq=�>
�
 dnn/dnn/hiddenlayer_0_activation*�   �m�$@      �@!  ��0�@)�����@2�        �-���q=ji6�9�?�S�F !?U�4@@�$?+A�F�&?��%>��:?d�\D�X=?�!�A?�T���C?IcD���L?k�1^�sO?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?���T}?>	� �?����=��?���J�\�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             0�@              �?              �?              �?              �?              �?               @       @       @              �?      �?              �?      �?       @              @      �?      �?              �?              @      �?      �?              �?              @      �?      @              @               @      @      @      �?      @       @       @      &@      @       @      @      @       @      �?      @       @       @      2@      $@      3@      &@      &@      6@      @      &@      0@      ,@      "@      >@      2@     �A@      <@      @@     �A@      E@     �@@     �H@      M@      G@     @P@     �S@     �P@     �M@     �P@     �Q@     �U@      T@      U@     �R@      N@     �M@      N@     �O@     �M@     �P@     �L@      L@     �I@      G@      8@      ,@      $@      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   �=0l@      �@!  ć��@)�sqұeA2�        �-���q=I���?����iH�?8/�C�ַ?%g�cE9�?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@{2�.��@!��v�@زv�5f@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             P�@              �?              �?              �?              �?      �?              �?      �?              �?               @      @      �?      �?       @       @               @      @      @      @      @      @      @      @       @      3@      3@      >@     �J@      U@      K@     �c@     �d@     �]@     �e@     �b@     �U@     �@@      @      1@     �@@     �P@      1@      *@      (@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �B*�@      �@!  ��q A)�	D��A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?      @       @      ;@      7@      F@      G@      <@      1@      @       @     �C@     �B@      2@      ,@      @      @      @      @      @      7@      &@      @      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   @�i�@    ^�@      P@!  �!hO*A) S=���B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�               @      @       @       @      @       @      @              �?      $@      @      @       @              �?              �?      �?      @              �?      �?        

loss~��Ip�Kz'       ��F	;Y� �P�AŐ*

global_step/sec#t�C�OKt      ���V	x�� �P�AŐ*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�G�>
�
 dnn/dnn/hiddenlayer_0_activation*�   ���$@      �@!  \9�ٳ@)��e�q�@2�        �-���q=��[�?1��a˲?U�4@@�$?+A�F�&?�7Kaa+?��VlQ.?���#@?�!�A?a�$��{E?
����G?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?���%��b?5Ucv0ed?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             P�@               @              �?               @              @              �?              �?      �?      �?      �?       @               @               @               @               @       @               @       @               @              �?               @      �?      @      �?       @       @       @      @      @      @      @              �?      @       @       @      @       @      .@       @      *@      @      @      "@      &@      &@      @      $@      .@      3@      7@      1@      7@      ;@      8@      B@     �F@      D@      E@     �M@     �@@      J@     �H@      R@     �P@     �P@     �P@     �T@     @S@      Y@      T@     �V@      V@     @Z@     @U@     �L@      O@      X@      P@      M@      <@     �D@      ,@       @      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�>
�
 dnn/dnn/hiddenlayer_1_activation*�   ���i@      �@! a���@)�s/��mfA2�        �-���q=�#�h/�?���&�?�@�"��?�K?�?����?_&A�o��?��7��?�^��h��?������?�iZ�?w`<f@�6v��@h�5�@!��v�@زv�5f@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@�������:�             x�@               @               @              @              �?               @              �?       @              @              @              �?      �?      �?      @      @      @               @      �?      @      @      @      @      @      @      8@      B@     �M@      L@     @U@      \@     �Z@     @b@      i@     �g@     �V@      @      $@      =@      8@      I@      F@      :@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �o��@      �@!  T�
R!A)b��i��A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              �?      @      "@      4@      :@     �B@      F@      6@      (@      "@      4@      4@      =@      9@      3@      2@      @               @      @      &@      2@      ,@       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   `wڵ@   @��@      P@!   ���+A)���M�B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              @      @       @      @      @      �?      @              @      @      @      @      @      @               @      �?       @       @      @        

loss���ILo�'       ��F	�!�P�A��*

global_step/sec��CG�@t      /@}	^A!�P�A��*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full��0?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�z�>
�
 dnn/dnn/hiddenlayer_0_activation*�    �l+@      �@!  cks&�@)1)yW��@2�        �-���q=��bȬ�0?��82?�u�w74?��%�V6?uܬ�@8?��%>��:?d�\D�X=?���#@?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?*QH�x?o��5sz?���T}?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�������:�             t�@              �?      @              �?              �?      �?               @       @      @       @              @      �?      �?      �?      �?      �?       @              @       @              �?      �?      �?      �?               @       @              �?              �?      �?      @      �?              �?       @       @              @      �?      @      @      �?      �?       @      @      @      @      @      �?      @      @      @       @      @      &@      &@      1@      $@      (@      &@      .@      3@      0@      3@      :@     �@@      5@      B@      G@     �F@      H@     �L@     �@@     �M@     �P@     �J@     �P@     �R@     @Q@     �P@     �Y@     �V@      T@      \@      V@      T@     @U@     �O@     @S@     �O@     �N@     �K@     �B@      7@      .@      1@      .@      &@      @      @      �?              �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��0l@      �@! ���? �@)�א�daA2�        �-���q=�#�h/�?���&�?��7��?�^��h��?S�Fi��?ܔ�.�u�?w`<f@�6v��@u�rʭ�@�DK��@{2�.��@زv�5f@��h:np@S���߮@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             ��@              �?              �?              �?               @              �?      @               @      �?              @       @      @      �?      @      @               @      �?       @      @      @      �?      �?      (@      @      &@      &@      2@      S@      c@     �Y@     �U@     �a@      c@     �i@      c@     @Q@      7@      4@      @      ,@       @      @      2@      (@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    w2�@      �@!  ���A)���5���A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?      �?      �?      @      @      6@      8@      >@      9@      8@      >@      2@      >@     �A@     �A@      @@      5@      *@      @      @       @      @      @              @      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   @��@    �q�@      P@!  @f��(A)@$��B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?      �?      @      @      @      @      @      @      �?      @      @      @      @       @       @      �?      �?              �?              �?      �?        

loss`@�I�F�'       ��F	q�!�P�A��*

global_step/sec���C'1�R�      �hR	��!�P�A��*�#
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�z�>
�
 dnn/dnn/hiddenlayer_0_activation*�    �b%@      �@! @9w��@)�5h',{�@2�        �-���q=��~���>�XQ��>��[�?1��a˲?6�]��?����?f�ʜ�7
?�T7��?�vV�R9?��ڋ?�.�?�[^:��"?U�4@@�$?I�I�)�(?�7Kaa+?��VlQ.?��bȬ�0?��82?�u�w74?��%�V6?uܬ�@8?��%>��:?d�\D�X=?���#@?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ȍ@              �?               @              �?       @              �?      �?      �?              @              �?      �?      �?      �?      �?              �?       @              �?      �?               @      �?               @      @              �?      �?      @      @      @       @              @      @      �?      �?       @      @       @       @      @              �?       @              @      �?      �?               @      �?       @       @      �?      @              �?       @      @      @              @      @       @      �?       @      &@      @      @      @      @      @       @      *@      &@      &@      (@      *@      $@      2@      2@      9@      @@      :@      ,@      <@      @@     �F@      E@     �A@     �@@     �O@     �E@     �M@      P@     @S@     �Q@     �Q@     �W@     @V@     �T@      Y@     @W@     @T@     �R@     @R@      S@      S@     @P@     �Z@      K@      I@      <@     �@@      1@       @      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values  �>
�
 dnn/dnn/hiddenlayer_1_activation*�   @�7m@      �@! 4HO���@)�^�QFgA2�        �-���q=�Rc�ݒ?^�S���?�v��ab�?�/��?I���?����iH�?��(!�ؼ?!�����?Ӗ8��s�?2g�G�A�?������?3?��|�?�E̟���?ܔ�.�u�?��tM@w`<f@�6v��@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             Ё@              �?              �?              �?              �?      �?               @              @              �?              �?              �?               @              �?              �?              @              �?       @      @      @              @      �?       @      @      @      @      @      @       @       @      @      C@     @S@     @Y@     @Z@      c@     �_@      T@     `b@     `c@     @T@      1@      &@      �?      4@     �R@     �L@      1@      (@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   `�޲@      �@!  ���""A)t��g�C�A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?      @       @      $@      0@      A@     �@@      <@      ;@      (@      5@     �A@      @@      @@      0@      @       @      @       @              ,@      8@      ,@      @      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �z��@   �o7�@      P@!  ���-A)T̖e��B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?      @      @      @      "@      �?      @              @      @      @      @      �?      �?              �?              @      @      �?      �?        

loss�v�I�0��'       ��F	� !�P�A�*

global_step/sec)5�C���D      �Ai�	8� !�P�A�*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values
׫>
�
 dnn/dnn/hiddenlayer_0_activation*�   `��+@      �@! � $Ӧ�@)=+[�D�@2�        �-���q=x?�x�?��d�r?+A�F�&?I�I�)�(?��bȬ�0?��82?uܬ�@8?��%>��:?�T���C?a�$��{E?<DKc��T?ܗ�SsW?���%��b?5Ucv0ed?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�������:�             Ȑ@              �?              �?              �?              �?               @              �?               @              @              �?      �?              �?              �?      �?      @       @      �?      �?      �?      �?      �?      �?      �?      @      @       @              @              @      @      �?               @      @      @      @       @      @      @       @      @      @       @      (@      "@      @      ,@      0@      2@      ,@      3@      0@      9@      6@      >@      ?@      C@     �E@     �D@      <@      F@      F@      H@     �O@     @Q@     �R@     �P@     �S@     �R@     @^@      X@      X@     @_@     @^@     @Z@     �R@      D@      S@     �I@      L@      B@      B@      3@      ,@      @              �?              �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�ݙ>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��1l@      �@! �Q���@)N�5�nfA2�        �-���q=�T���C?a�$��{E?��<�A��?�v��ab�?�/��?��(!�ؼ?!�����?yD$��?�QK|:�?����?_&A�o��?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             �@              �?              �?      �?              �?              �?              �?               @               @              �?               @       @       @              �?              �?               @      �?       @      @               @      @       @      @       @       @      (@      ;@     �A@      @@      7@      ?@      N@     @a@     �_@      i@     �d@     �b@     �K@     �C@      B@      9@      *@      G@     �D@      3@      (@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    7�@      �@!  X��!A)\���g�A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?      �?       @      @      2@      6@      =@     �B@      >@      $@               @      *@      *@     �G@     �D@      3@      *@      "@      "@      $@      @       @      0@      $@      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    �ͳ@   `~�@      P@!  @8/�,A)�ƎA�B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?       @       @      @      @      @               @       @       @      &@      @       @       @       @      �?       @               @      @      �?      �?        

loss��ID�Ih'       ��F	��/!�P�AՓ*

global_step/sec�P�CӔb�4      	[\�	��/!�P�AՓ*� 
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesq=�>
�
 dnn/dnn/hiddenlayer_0_activation*�   ��d$@      �@! �گ��@)\��$�7�@2�        �-���q=��ڋ?�.�?�S�F !?�[^:��"?�7Kaa+?��VlQ.?��bȬ�0?��82?��%>��:?d�\D�X=?���#@?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             h�@              �?              �?              �?              @              �?              �?      �?      @      �?      �?      @              �?               @       @      @              @       @       @              �?               @              �?      @       @      @      @       @               @               @       @              @      @      @              @              @      @      �?      @      @      �?      (@      @      @              @      @      @      @      @      @       @      "@      @      .@      ,@      (@      &@      *@      :@      1@     �C@      :@      8@      &@      =@      A@      @@     �E@      G@      ?@     �B@      K@     �Q@      J@     �V@      H@     @P@     �V@     �Z@      M@      Q@     @S@     �G@      K@     �I@      Q@     �N@      G@     �]@      V@     �N@      ?@      7@      "@      @      �?      �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�̐>
�
 dnn/dnn/hiddenlayer_1_activation*�   @ �i@      �@! ��E��@)k��ǮoeA2�        �-���q=��<�A��?�v��ab�?��]$A�?�{ �ǳ�?� l(��?yL�����?S�Fi��?w`<f@�6v��@�Š)U	@u�rʭ�@!��v�@زv�5f@��h:np@S���߮@)����&@��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@�������:�             ��@              �?               @       @              @              �?              �?              �?       @              �?              @       @      @       @              �?      �?      �?       @      @      "@      @      0@      3@      C@      >@     �D@     �P@     �U@     @]@     `f@     @Z@      _@     �b@      T@      B@      3@      ,@      6@      :@      Q@     �M@      6@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    N��@      �@!  мݫ A)v7ݎ�'�A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@               @      $@      ,@      8@      H@      H@     �G@      8@      6@      :@      5@      (@       @      @      @      @      @      @      @      ,@      7@      .@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ���@   `���@      P@!   ���*A)|X�܁�B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              �?      @       @      $@      (@      @      @      @      @      �?      @               @              �?      �?      �?      @      @       @        

loss �I���'       ��F	�L=!�P�A��*

global_step/sec�*�C[���      Цh.	x�=!�P�A��*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values  �>
�
 dnn/dnn/hiddenlayer_0_activation*�   �?�+@      �@!  `2�Q�@)/�1+���@2�        �-���q=��bȬ�0?��82?���#@?�!�A?�T���C?
����G?�qU���I?IcD���L?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�������:�             0�@              �?              @      �?              �?      @              �?       @              �?               @      @              @              @      �?      @              �?              @      @      @       @       @      �?              �?      �?       @      @              @      @       @      @      @      �?      (@      @      @       @      @      $@      @      @      $@      &@      @      "@      .@      "@      .@      1@      (@      7@      ?@      =@      8@      9@      =@      ;@      H@     �A@     �C@      J@      C@      @@     �M@     �K@     �G@     @R@     �M@      O@     @S@     @T@     �U@     �V@     �S@     �R@     �R@     �S@      Q@     �O@     �D@      P@     �E@      B@      D@      @@      =@      1@      @      @      �?              �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values33�>
�
 dnn/dnn/hiddenlayer_1_activation*�   �_l@      �@! 8����@)5��!�dA2�        �-���q=���&�?�Rc�ݒ?�uS��a�?`��a�8�?��(!�ؼ?!�����?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@!��v�@زv�5f@��h:np@S���߮@)����&@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             @�@              �?              �?              �?               @       @               @               @      �?      @      @              @      �?              �?      @              �?      �?      "@      @      @      @      @      (@      &@      .@      ?@      B@     �Q@     @Z@      Q@      `@     �Y@     @c@     `m@     �a@      C@      5@      .@       @      *@      E@      B@      ;@      (@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   @�"�@      �@!  $Ә@ A)ƽQ��A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?      �?       @      @      @      6@      =@     �G@     �G@      7@      5@      1@      3@      .@      7@      3@      8@      .@      @       @               @      *@      &@       @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   @��@    Fl�@      P@!  �9q*A)��>��B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?       @       @       @       @      "@              @       @      @      �?      @      @      @      �?      �?               @       @       @      �?        

loss�dpI���a'       ��F	�lJ!�P�A��*

global_step/sec���C�.-�      �]h	_�J!�P�A��*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full��0?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values��>
�
 dnn/dnn/hiddenlayer_0_activation*�   �&�$@      �@!  ��~�@)G*�Ӧ�@2�        �-���q=��ڋ?�.�?��%�V6?uܬ�@8?d�\D�X=?���#@?�!�A?�T���C?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�              �@              �?              �?               @              �?              @      @      @      @      @      @      �?      @       @              �?      �?      @              �?      �?      �?              �?      �?       @              �?              �?      �?              @              �?              @      �?      �?       @      �?       @      @      �?      @      �?      �?      �?               @      @       @      @      "@      @      @      "@       @      "@      "@      4@      8@      .@      *@      4@      1@      3@      9@     �@@      A@     �C@      C@     �D@     �J@      H@     �Q@      O@      J@     @R@      R@      T@     �W@     �V@     �W@      W@     �X@      V@      V@      R@     �V@     �I@     �H@     �R@     �L@      I@      ?@      6@      (@      @      �?       @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   @��i@      �@! ��]:��@)%�.9e�cA2�        �-���q=�Z�_���?����?�E̟���?yL�����?��tM@w`<f@�6v��@h�5�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@�������:�              �@              �?               @               @       @      �?              �?               @      @              �?              �?      @      @      @       @              �?      @              @      @      @      (@      $@      E@     �F@     �G@     @Q@     @\@     �V@     �X@     �e@     @Y@     �U@     �a@     �R@     �C@      (@      :@      @      =@      D@     �A@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   `N��@      �@!  {�� A)u��e'W�A2�        �-���q=o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@              @      4@      <@      C@      D@      6@      @@      3@      *@     �@@      ?@      0@      .@       @      "@       @       @      @      @      &@      .@      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �Է@   @n��@      P@!  �˗+A)Z6�)ϠB2�1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�              @      "@      @       @      �?      @      �?      @      @      @       @      @              @               @              �?       @      @        

lossΝ�IiTW'       ��F	�vX!�P�A��*

global_step/sec���CC�QY�      Цh.	wY!�P�A��*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�F?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�¹>
�
 dnn/dnn/hiddenlayer_0_activation*�   �u�+@      �@! �C8�б@)l	/S��@2�        �-���q=�ѩ�-�>���%�>�vV�R9?��ڋ?��%�V6?uܬ�@8?��%>��:?d�\D�X=?���#@?�!�A?a�$��{E?
����G?�qU���I?IcD���L?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�������:�             $�@              �?              �?              �?              �?               @               @              @               @      @               @      �?       @      @       @       @      �?      �?              �?              @              @      @              @              �?              �?      @               @      �?       @      �?      @      @      �?              @      @       @              ,@      @       @      @      @      @      (@      2@      (@       @      "@      (@      @      2@      1@      2@      1@      5@      ;@      >@      H@      :@      C@      A@     �C@     �C@      C@     �K@      G@     �K@     @R@      O@     �O@     �T@     �X@      X@      ^@     �X@      U@     �S@     �S@     �P@     �H@     �S@      J@     �C@      1@      2@      @      "@      @      @       @               @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��#j@      �@! X�~�e�@)�-�R̳cA2�        �-���q=!�����?Ӗ8��s�?ܔ�.�u�?��tM@h�5�@�Š)U	@u�rʭ�@زv�5f@��h:np@S���߮@)����&@a/5L��@��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@�������:�             ��@              �?               @              �?      �?              �?              @      �?               @      @      �?      @      @               @       @      @      @      @      (@      "@      >@      =@      A@     �G@      Y@     �R@     �]@     �c@     �d@     `f@     �]@      F@      ?@      H@      "@      8@     �B@     �@@      ,@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    Rڰ@      �@!  ��xA)wO�}��A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�������:�              p@               @       @      @      @      "@      :@     �A@     �A@      D@      4@      5@      0@      "@      ;@      9@      3@      2@      ,@      @      "@      @      @       @      *@      $@       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   ���@   ����@      P@!  �ES)A)8ED�B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�������:�               @      @      @       @      $@      @       @      @       @      �?      @      @      @      @      �?      �?       @              �?      �?      @      �?        

lossZs�I׵m<'       ��F	+g!�P�A�*

global_step/sec���C��VS$      ����	iMg!�P�A�*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_0_activation*�   `�n%@      �@! @zxZR�@)"0R�E�@2�        �-���q=ji6�9�?�S�F !?I�I�)�(?�7Kaa+?��%>��:?d�\D�X=?���#@?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?P}���h?ߤ�(g%k?�N�W�m?hyO�s?&b՞
�u?*QH�x?���T}?>	� �?���J�\�?-Ա�L�?eiS�m�?�#�h/�?���&�?�Rc�ݒ?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             ,�@              �?              �?               @      �?              �?              �?      �?       @              �?      �?      @              �?      �?              �?       @              �?              �?       @              @       @               @      �?      @      @              @      @               @      @       @       @      @      &@       @       @      @      @       @      "@      (@      &@      @      "@      .@      @      4@      0@      (@      2@      6@      <@      ?@     �G@      @@      H@      E@      >@      E@      I@      G@      N@     �Q@     �P@     @P@     �S@     @T@     @W@     @X@     �Y@     �T@     @[@      S@     @T@     �U@      P@     @T@     �K@      G@      @@      8@      7@      0@      &@      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values�ݙ>
�
 dnn/dnn/hiddenlayer_1_activation*�   `kl@      �@! ��BN��@)��#-qfA2�        �-���q=ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@زv�5f@��h:np@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�             �@              �?      �?      �?              �?              �?               @              @      �?      @              @      �?      �?      @              @      @      @      @      "@      @      @       @      ;@      =@     �@@      @@      S@     �K@     @]@     `b@     @c@      f@     �c@      U@      ;@      @      3@      4@      B@     �@@      D@      (@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    w0�@      �@!  t��!A)�.a�6�A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?      @      &@      5@      5@      =@     �@@      6@      4@      @      0@     �@@      E@      @@      =@      $@              @      @       @      $@      .@      $@       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �{�@   ���@      P@!  @H�|,A)aG�¯�B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�               @      @      @      @      @      @      @              @      @      "@      @      @              �?      �?      �?       @      @      �?        

losst��I�Eb'       ��F	��r!�P�Aɗ*

global_step/seczD��!Z�      �]h	��r!�P�Aɗ*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesH�>
�
 dnn/dnn/hiddenlayer_0_activation*�   ��h%@      �@! ��L�@)��@2�        �-���q=ji6�9�?�S�F !?U�4@@�$?+A�F�&?I�I�)�(?�7Kaa+?��bȬ�0?��82?�u�w74?��%�V6?uܬ�@8?a�$��{E?
����G?�qU���I?IcD���L?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?�N�W�m?;8�clp?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             x�@               @               @               @               @               @      @              �?      �?      @               @              �?              �?               @      �?               @               @      @      �?               @              �?              �?       @              @              �?              @       @      �?      @       @      �?      "@       @       @       @      @      @      &@      @      @      @       @       @      (@      @      $@      "@      .@      ,@      .@      3@      .@      4@      0@      4@      5@      C@      @@      L@      >@     �F@     �F@     �J@      L@     @P@     �T@      O@      R@     �U@     @U@      T@     �W@     �Y@     @U@      S@     �P@      Q@     @P@     �G@     �K@      J@      F@     �@@     �D@      8@      (@      "@      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��l@      �@! �^��H�@)+[�$,eA2�        �-���q=cI���?�P�1���?ܔ�.�u�?��tM@w`<f@�6v��@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ��@              �?              �?              �?              �?       @               @      @      �?              @      �?      @               @       @       @      @      @      @      @      @      ,@      ?@     �E@     �L@     �X@     `c@     �g@     �c@      b@     @e@     �T@      >@      .@      @      @      :@      =@      A@      *@      �?        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�    
��@      �@!  P��_ A)̶Z����A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              @      0@      2@      =@      E@      D@      3@      "@      &@      4@     �C@     �@@      3@      4@      "@      @      $@       @              @      $@      (@       @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �� �@   @'�@      P@!  @a�_*A)�֒���B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              @      @      @      "@      @      �?      �?      �?      @      "@      @      @      @      �?      �?       @              �?       @       @      �?        

loss�I�h|'       ��F	LL}!�P�A��*

global_step/sec�D���)�      !��	1�}!�P�A��*�!
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values)\�>
�
 dnn/dnn/hiddenlayer_0_activation*�   �/ ,@      �@! ���L"�@)�4�!���@2�        �-���q=})�l a�>pz�w�7�>>h�'�?x?�x�?��d�r?�5�i}1?�T7��?ji6�9�?�S�F !?�[^:��"?U�4@@�$?d�\D�X=?���#@?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?�lDZrS?<DKc��T?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�������:�             ��@              �?              �?      �?              �?               @              �?              �?              �?      �?      �?              �?              �?              @      �?      �?       @              �?              �?      �?       @       @      �?               @              �?      �?               @               @      @      @               @               @              @              @       @      @       @      @       @      @      @      @      @      @       @      @       @      @      $@       @      2@      ,@      "@      "@      $@      ;@      &@      :@      3@      :@      @@      ?@      ?@      C@     �@@     �B@      A@      D@      K@     �G@     �K@     �R@     �K@     @P@     �Q@      S@      S@      U@     �T@     @U@     �R@      S@     �K@     �P@      W@     �N@      K@      ?@      ?@      6@      .@      @       @      �?              �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesww�>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��m@      �@! �M���@)�����fA2�        �-���q=�P�1���?3?��|�?S�Fi��?ܔ�.�u�?h�5�@�Š)U	@u�rʭ�@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             H�@              �?              �?              @      �?              �?               @       @              �?      @      �?              @              @      @              �?       @      @      "@      &@       @      @      ,@     �P@     �D@     �D@     �J@     �N@     �J@     @V@     @^@     ``@     �j@     `a@      L@      5@      5@      4@      1@     �P@     �@@      @@      *@      �?        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   @˲@      �@!  ���� A)�fl����A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?      �?       @      @      6@      <@     �C@      >@      B@      5@      ,@      "@      ,@      9@      =@      3@      ,@      "@      @       @      @       @      *@      2@      *@      @      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    ��@   ��<�@      P@!   ��D+A)���0yjB2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@%4�>�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?      @      "@      @      @      @      �?      @      �?      @      @      @      @      �?       @      �?              �?              @      @       @      �?        

loss�4�I*�m�'       ��F	j��!�P�A��*

global_step/sechPD
���      р6y	��!�P�A��*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_valuesH�>
�
 dnn/dnn/hiddenlayer_0_activation*�   `l%@      �@!  )�d�@)�r�|��@2�        �-���q=d�\D�X=?���#@?�!�A?�T���C?a�$��{E?
����G?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?���J�\�?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@�������:�             �@              @              �?              �?              @              @       @      @              �?      �?      @              @               @       @      @       @      @      @      @      �?       @      @      @              �?               @      �?              �?      �?               @      �?      @       @      �?       @      @               @      @      @       @       @       @      *@      @      "@      @      (@      *@      ,@      (@      $@      ,@      0@      5@      (@      4@      .@      A@      >@      F@     �C@     �H@     �B@      B@      K@     �G@     @R@     �K@      U@     �P@     �R@      S@     @P@     �Y@     �R@     �V@     �O@     �Q@     @P@      Q@     �N@      E@     �P@      J@      G@      D@      D@      >@      2@      "@      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values""�>
�
 dnn/dnn/hiddenlayer_1_activation*�   @�k@      �@!  ��&��@)d0��gA2�        �-���q=�?>8s2�?yD$��?cI���?�P�1���?S�Fi��?ܔ�.�u�?h�5�@�Š)U	@{2�.��@!��v�@زv�5f@��h:np@S���߮@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�������:�              �@              �?              �?              �?              @              �?               @      �?              @       @       @      @              "@      �?      @      �?      @       @              @      @      (@      @      @      *@      1@     �G@     @X@      Z@      `@      ^@     �X@     @h@     �i@     @U@      ;@      ,@      @      @      8@     �N@     �G@      (@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   ��@      �@!   �� A)?YѸ�A2�        �-���q=�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@               @      "@      *@      2@      <@      A@      ?@      4@      ;@      5@      5@      ;@      >@      6@      4@      @              @       @              0@      4@      $@       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	   �3��@   @j�@      P@!  ��f+A)rw��9?B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@0�Z�:��@�<�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�               @      @      @      @      @      @      @       @      @      @      @      @      @              �?              @      @      �?        

lossB�I�[!''       ��F	-I�!�P�A��*

global_step/seciD�ʃ�      �nF	9��!�P�A��*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_fullW�\?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values
ק>
�
 dnn/dnn/hiddenlayer_0_activation*�   �@%#@      �@!  zl �@)�w�Ff�@2�        �-���q=>h�'�?x?�x�?�[^:��"?U�4@@�$?a�$��{E?
����G?IcD���L?k�1^�sO?<DKc��T?ܗ�SsW?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?o��5sz?���T}?-Ա�L�?eiS�m�?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@�������:�             d�@               @               @              �?               @              �?              @      �?              �?               @              �?              �?              �?               @      @      �?              �?       @      @       @      @      @      @       @      @      @       @      �?      (@      @      �?      $@      @       @      &@      5@      &@      2@      &@      1@      0@      0@      ;@      6@      <@      :@      =@      ?@      H@     �G@      F@     �C@     �E@     �H@      P@     �P@     �S@     @V@     �Q@     @U@     �Y@     �T@     @S@     �`@     �\@     �X@     �V@     @T@     @V@     �H@      <@      5@      4@      0@      ,@      "@       @      @      @        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_valuesDD�>
�
 dnn/dnn/hiddenlayer_1_activation*�   ��a@      �@! �H�@)x��:�[A2�        �-���q=��]$A�?�{ �ǳ�?��(!�ؼ?!�����?�E̟���?yL�����?h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@�������:�             ؁@               @              �?              �?              �?              �?              �?               @      @              @              @      �?      �?      @      @      @      @      @      @      "@      &@     �C@     �E@      1@      G@      a@     @[@     ``@     @`@     �f@     �g@     �b@     �Q@      @      0@      (@        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   �(��@      �@!  @�ZA)��1��c�A2�        �-���q=�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@�������:�              p@              @      ,@      1@      7@      E@      ;@      5@      ?@      3@      6@      >@     �H@     �A@      0@      1@      @      @      @       @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    ���@   ���@      P@!  �Z��&A)������B2�rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@�������:�              �?      @      @      @      @      @      @      �?      @      @      $@      @      �?      @              �?      �?        

loss�|�I�5:'       ��F	Ӟ!�P�Aٚ*

global_step/sec��
D$$�5�      �;		�!�P�Aٚ*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full�Xr?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values\��>
�
 dnn/dnn/hiddenlayer_0_activation*�   `(3,@      �@! ���Å�@)\�7T{=�@2�        �-���q=���]���>�5�L�>1��a˲?6�]��?�vV�R9?��ڋ?I�I�)�(?�7Kaa+?��VlQ.?��bȬ�0?��82?d�\D�X=?���#@?�!�A?�T���C?a�$��{E?
����G?�qU���I?IcD���L?k�1^�sO?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�m9�H�[?E��{��^?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?o��5sz?���T}?>	� �?����=��?-Ա�L�?eiS�m�?#�+(�ŉ?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?�"�uԖ?}Y�4j�?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�������:�             ԑ@              �?              �?              �?               @       @               @              @      �?      �?      �?       @      @      @              @      @      @      �?      @      @      @       @      @               @      @      @      @      @      @       @              �?               @              �?              @      �?              �?      @               @               @       @      @      �?      @       @      @      @      @      "@              $@      @      �?       @       @      @      (@      (@      @      *@      @      &@      2@      &@      0@      (@      =@      0@      >@     �@@     �D@      C@     �B@     �D@      E@     �H@      E@      Q@     @P@     @U@     �T@      J@     �U@     @T@     �V@     �V@     @Z@      W@      V@     �F@     �K@     �N@      M@     �D@      ;@      8@      9@      4@      @      @       @      @      �?              �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�    �|f@      �@! ��R_"�@)�v'A �_A2�        �-���q=yL�����?S�Fi��?زv�5f@��h:np@S���߮@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�������:�             ��@               @              @       @              @       @      @               @       @              �?       @      @       @      @      "@      @      $@      ?@      D@      J@     �S@     �[@     �U@      a@     �b@      W@     �h@     �`@     @T@      <@      1@       @      5@      8@      @        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   `��@      �@!  ؃5A)qn{J�,�A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�������:�              p@              �?      �?      @      @      &@      9@      >@      D@     �C@      5@      <@      3@      3@     �C@      8@      1@      *@      "@      (@      @              @      @      @      �?        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    ��@    a�@      P@!  �4�&A)޹o���B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@P�w\�u�@%4�>�@{i�.�@n��r ��@�������:�              �?      @      @      @      @       @      �?      @       @      @      @      @      @       @      �?      @              �?      �?      �?        

loss��I��k�'       ��F	�	�!�P�A��*

global_step/sec�J�Cy$ī�      ЌZ�	�5�!�P�A��*�
Z
Senqueue_input/queue/enqueue_input/random_shuffle_queuefraction_over_250_of_750_full  �?
4
-dnn/dnn/hiddenlayer_0_fraction_of_zero_values�z�>
�
 dnn/dnn/hiddenlayer_0_activation*�   @TD,@      �@!  �*��@)p(����@2�        �-���q=�5�i}1?�T7��?��bȬ�0?��82?�T���C?a�$��{E?nK���LQ?�lDZrS?<DKc��T?ܗ�SsW?��bB�SY?�l�P�`?���%��b?5Ucv0ed?Tw��Nof?P}���h?ߤ�(g%k?�N�W�m?;8�clp?uWy��r?hyO�s?&b՞
�u?*QH�x?o��5sz?���T}?>	� �?����=��?���J�\�?-Ա�L�?�7c_XY�?�#�h/�?���&�?�Rc�ݒ?^�S���?��<�A��?�v��ab�?�/��?�uS��a�?`��a�8�?�/�*>�?�g���w�?���g��?I���?����iH�?��]$A�?�{ �ǳ�?� l(��?8/�C�ַ?%g�cE9�?��(!�ؼ?!�����?Ӗ8��s�?�?>8s2�?yD$��?�QK|:�?�@�"��?�K?�?�Z�_���?����?_&A�o��?�Ca�G��?��7��?�^��h��?W�i�b�?��Z%��?�1%�?\l�9�?+Se*8�?uo�p�?2g�G�A�?������?�iZ�?+�;$�?cI���?�P�1���?3?��|�?�E̟���?yL�����?S�Fi��?ܔ�.�u�?��tM@w`<f@�6v��@h�5�@�Š)U	@u�rʭ�@�DK��@{2�.��@!��v�@زv�5f@��h:np@S���߮@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�}h�-@�������:�             ؐ@              �?              �?              @              �?       @              �?              @      @              @              @              .@       @               @      �?       @              @      @       @              @      �?       @      @               @      @       @      @      @      @       @      @       @      �?      �?      @      @       @      $@      @      @      (@      "@      @      *@       @      (@      ,@      .@      1@      .@      5@      4@      >@      8@     �@@      <@     �J@      ?@      E@      I@     �H@     �U@     �N@     �Y@      Q@     @T@     �W@     �X@     �S@     �V@     �Q@      Q@     �S@     �L@      R@      S@     @Q@     @R@      J@     �D@      4@      :@      2@       @      �?       @      �?              �?        
4
-dnn/dnn/hiddenlayer_1_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_1_activation*�   @
�l@      �@!  �rd�@)�ytHT�bA2�        �-���q=�"�uԖ?}Y�4j�?!�����?Ӗ8��s�?�E̟���?yL�����?u�rʭ�@�DK��@{2�.��@زv�5f@��h:np@)����&@a/5L��@v@�5m @��@�"@�ՠ�M�#@sQ��"�%@e��:�(@����t*@�x�a0@�����1@q��D�]3@}w�˝M5@�i*`�n7@�6��9@o�=o�Z<@�*ǣ0?@��#G�'A@C\t��B@J23��D@R��'�F@t�n̫I@��`��K@���cN@Π54�P@�0n9�bR@��X�9T@
6@�F?V@r;`�xX@��iI�Z@~
�i�]@��GL:I`@߱�&�a@C��ôc@�Y��=�e@����*�g@�'�;�:j@}+��
�l@�|�6��o@�������:�             ��@              �?              �?              @              �?      �?              @              �?      �?              @      @       @       @              �?      �?      @      @      �?      @      .@      &@      6@     �L@      1@      2@      S@     �d@      f@      b@     @a@     `c@      [@      K@      8@      B@      0@      @       @      8@      9@      *@      �?        
4
-dnn/dnn/hiddenlayer_2_fraction_of_zero_values���>
�
 dnn/dnn/hiddenlayer_2_activation*�   `̲@      �@!  @:x�A)$��RM�A2�        �-���q=6D!��;w@֗$Ki�y@�s��|@�2>SQ�~@o5b���@�:H_��@��5O��@q�N�#��@0l#���@�&�d�@�ܪ�T!�@�_�U��@���Ԑ:�@8��8�@X��g��@H:<�2C�@��Q��@g�C�[�@��~��%�@U���¡@ށ�[���@BoK�}�@Cb�R@J�F� �@|�Wך�@9U� w�@�.\�QN�@�fe�Y	�@�������:�              p@              �?      �?      �?               @      1@      <@      I@      E@      9@      (@      1@      8@      >@      7@      4@      3@      1@      @       @       @       @              @      "@      @      @        
-
&dnn/dnn/logits_fraction_of_zero_values    
�
dnn/dnn/logits_activation*�	    ��@   �N�@      P@!   ��)A)�O�i�B2��fe�Y	�@rW<���@1`B%��@�bnV�@��߻@;H`����@!�����@�0d��@86��:g�@"���q�@s�����@��b�(�@)�l�T��@
��<n�@��&���@q�݆L��@0�Z�:��@�<�@P�w\�u�@{i�.�@n��r ��@Fp4K�^�@�{���N�@�������:�              �?              @      @      $@       @      @      �?      @      @      @      @      @       @      @      �?       @      �?              �?       @      �?        

loss� �I�l��7       ���Y	� �!�P�A��:($tensorboard/DNN_regressor/model.ckpt��C