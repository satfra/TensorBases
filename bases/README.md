# Writing a new basis

To define a new basis, you have to create a file BasisName.m inside this folder, where the following attributes are defined:

- (optional) `TBAutoDefine[BasisName] = True;` : If this is not set or set to `False`, the basis will not be processed by the package.
- `TBRequiredGroups[BasisName] = {{...},{...}};` : This setting informs the package what groups it requires. The groups are given in the format `{color, SUNfund, Nc}`, where the second argument must be a group known to `FormTracer`.
- `TBVertex["AA"] = "AA";` : An ordered list of fields corresponding to the basis.
- `TBVertexStructure["AA"] = Tensor[1, 2] + Tensor[2,1];` : This informs how to form a vertex from the basis elements. Internally, the package replaces `Tensor` with the respective basis element and the integers with the corresponding external indices.

TODO
