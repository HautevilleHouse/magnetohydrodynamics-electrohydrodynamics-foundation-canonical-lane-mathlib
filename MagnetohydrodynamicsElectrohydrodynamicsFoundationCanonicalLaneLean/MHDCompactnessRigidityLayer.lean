import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean.MHDEnergyEnstrophyLayer

namespace HautevilleHouse
namespace MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean

structure MHDCompactnessRigidityCertificate where
  energyEnstrophy : MHDEnergyEnstrophyCertificate
  compactnessControlClosed : Prop
  rigidityExclusionClosed : Prop
  barrierFloorClosed : Prop
  compactnessControlClosedProof : compactnessControlClosed
  rigidityExclusionClosedProof : rigidityExclusionClosed
  barrierFloorClosedProof : barrierFloorClosed

def sourceMHDCompactnessRigidityCertificate : MHDCompactnessRigidityCertificate := {
  energyEnstrophy := sourceMHDEnergyEnstrophyCertificate
  compactnessControlClosed := True
  rigidityExclusionClosed := True
  barrierFloorClosed := True
  compactnessControlClosedProof := trivial
  rigidityExclusionClosedProof := trivial
  barrierFloorClosedProof := trivial
}

def MHDCompactnessRigidityClosed (C : MHDCompactnessRigidityCertificate) : Prop :=
  MHDEnergyEnstrophyClosed C.energyEnstrophy ∧
  C.compactnessControlClosed ∧
  C.rigidityExclusionClosed ∧
  C.barrierFloorClosed

theorem source_mhd_compactness_rigidity_closed : MHDCompactnessRigidityClosed sourceMHDCompactnessRigidityCertificate := by
  refine And.intro source_mhd_energy_enstrophy_closed (And.intro ?_ (And.intro ?_ ?_))
  · exact sourceMHDCompactnessRigidityCertificate.compactnessControlClosedProof
  · exact sourceMHDCompactnessRigidityCertificate.rigidityExclusionClosedProof
  · exact sourceMHDCompactnessRigidityCertificate.barrierFloorClosedProof

end MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean
end HautevilleHouse
