import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean

structure MagneticReynoldsCertificate where
  current : CurrentCertificate
  magneticReynoldsNumber : ℝ
  advectionDominant : Prop
  diffusionDominant : Prop
  frozenInCondition : Prop
  advectionDominantClosed : advectionDominant = (magneticReynoldsNumber > 1)
  diffusionDominantClosed : diffusionDominant = (magneticReynoldsNumber < 1)
  frozenInConditionClosed : frozenInCondition = (magneticReynoldsNumber ≫ 1)

def sourceMagneticReynoldsCertificate : MagneticReynoldsCertificate := {
  current := sourceCurrentCertificate
  magneticReynoldsNumber := 0.5
  advectionDominant := False
  diffusionDominant := True
  frozenInCondition := False
  advectionDominantClosed := by native_decide
  diffusionDominantClosed := by native_decide
  frozenInConditionClosed := by native_decide
}

def MagneticReynoldsLayerClosed (C : MagneticReynoldsCertificate) : Prop :=
  CurrentLayerClosed C.current ∧
  C.advectionDominant = (C.magneticReynoldsNumber > 1) ∧
  C.diffusionDominant = (C.magneticReynoldsNumber < 1) ∧
  C.frozenInCondition = (C.magneticReynoldsNumber ≫ 1)

theorem source_magnetic_reynolds_layer_closed :
    MagneticReynoldsLayerClosed sourceMagneticReynoldsCertificate := by
  exact And.intro source_current_layer_closed
    (And.intro sourceMagneticReynoldsCertificate.advectionDominantClosed
      (And.intro sourceMagneticReynoldsCertificate.diffusionDominantClosed
        sourceMagneticReynoldsCertificate.frozenInConditionClosed))

end MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean
end HautevilleHouse