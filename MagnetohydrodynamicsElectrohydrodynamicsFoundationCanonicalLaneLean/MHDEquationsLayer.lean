import MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

structure MHDOperators where
  curl : VectorField → VectorField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  advection : VectorField → VectorField
  lorentzForce : VectorField → VectorField → VectorField
  magneticDiffusion : VectorField → VectorField
  inductionTerm : VectorField → VectorField
  pressureProjection : VectorField → VectorField
  pressureProjectionIdempotent : ∀ u, pressureProjection (pressureProjection u) = pressureProjection u

def primitiveMHDOperators : MHDOperators := {
  curl := fun _ => zeroVectorField
  gradient := fun _ => zeroVectorField
  laplacian := fun u => u
  timeDerivative := fun _ => zeroVectorField
  advection := fun _ => zeroVectorField
  lorentzForce := fun _ _ => zeroVectorField
  magneticDiffusion := fun u => u
  inductionTerm := fun _ => zeroVectorField
  pressureProjection := fun u => u
  pressureProjectionIdempotent := by intro u; rfl
}

structure MHDFlow where
  velocity : VectorField
  magneticField : VectorField
  pressure : ScalarField
  viscosity : ℝ
  resistivity : ℝ
  operators : MHDOperators

def primitiveMHDFlow : MHDFlow := {
  velocity := zeroVectorField
  magneticField := zeroVectorField
  pressure := zeroScalarField
  viscosity := 1
  resistivity := 1
  operators := primitiveMHDOperators
}

def Incompressible (F : MHDFlow) : Prop :=
  F.operators.curl F.velocity = zeroVectorField

def MagneticDivergenceFree (F : MHDFlow) : Prop :=
  F.operators.curl F.magneticField = zeroVectorField

def InductionEquation (F : MHDFlow) : Prop :=
  F.operators.timeDerivative F.magneticField = 
    F.operators.inductionTerm F.velocity + F.operators.magneticDiffusion F.magneticField

def MomentumEquation (F : MHDFlow) : Prop :=
  F.operators.timeDerivative F.velocity = 
    F.operators.laplacian F.velocity + F.operators.lorentzForce F.velocity F.magneticField

def MHDSystemClosed (F : MHDFlow) : Prop :=
  Incompressible F ∧ MagneticDivergenceFree F ∧ InductionEquation F ∧ MomentumEquation F

theorem primitive_mhd_incompressible_checked : Incompressible primitiveMHDFlow := by rfl
theorem primitive_mhd_divergence_free_checked : MagneticDivergenceFree primitiveMHDFlow := by rfl
theorem primitive_mhd_induction_checked : InductionEquation primitiveMHDFlow := by rfl
theorem primitive_mhd_momentum_checked : MomentumEquation primitiveMHDFlow := by rfl
theorem primitive_mhd_system_closed_checked : MHDSystemClosed primitiveMHDFlow :=
  And.intro primitive_mhd_incompressible_checked
    (And.intro primitive_mhd_divergence_free_checked
      (And.intro primitive_mhd_induction_checked primitive_mhd_momentum_checked))

end MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean
end HautevilleHouse