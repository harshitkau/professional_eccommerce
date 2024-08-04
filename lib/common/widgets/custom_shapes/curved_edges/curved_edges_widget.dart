import 'package:flutter/material.dart';
import 'package:prof_ecommerce/common/widgets/custom_shapes/curved_edges/custom_curved_edges.dart';

class TCurveEdgeWidget extends StatelessWidget {
  const TCurveEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TCustomCurvedEdges(), child: child);
  }
}
