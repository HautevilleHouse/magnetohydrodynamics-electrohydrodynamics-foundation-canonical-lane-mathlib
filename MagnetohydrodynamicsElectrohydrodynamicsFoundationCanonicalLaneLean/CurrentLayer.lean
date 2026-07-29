import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean

structure CurrentCertificate where
  plasma : PlasmaFlow
  currentDensity : VectorField
  ohmicDissipation : ℝ
  hallEffect : Bool
  electronInertia : Bool
  currentClosure : Prop
  ohmicDissipationClosed : ohmicDissipation = 0.0
  hallEffectClosed : hallEffect = false
  electronInertiaClosed : electronInertia = false
  currentClosureProof : currentClosure

def sourceCurrentCertificate : CurrentCertificate := {
  plasma := primitivePlasmaFlow
  currentDensity := zeroVectorField
  ohmicDissipation := 0
  hallEffect := false
  electronInertia := false
  currentClosure := True
  ohmicDissipationClosed := rfl
  hallEffectClosed := rfl
  electronInertiaClosed := rfl
  currentClosureProof := trivial
}

def CurrentLayerClosed (C : CurrentCertificate) : Prop :=
  C.ohmicDissipation = 0.0 ∧ C.hallEffect = false ∧ C.electronInertia = false ∧ C.currentClosure

theorem source_current_layer_closed :
    CurrentLayerClosed sourceCurrentCertificate := by
  exact And.intro sourceCurrentCertificate.ohmicDissipationClosed
    (And.intro sourceCurrentCertificate.hallEffectClosed
      (And.intro sourceCurrentCertificate.electronInertiaClosed
        sourceCurrentCertificate.currentClosureProof))

end MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean
end HautevilleHouse