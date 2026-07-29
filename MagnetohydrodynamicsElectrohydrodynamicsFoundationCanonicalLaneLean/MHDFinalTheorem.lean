import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean.MHDAnalyticCertificate
import HautevilleHouse.MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean.MHDRegularityEndpointLayer

namespace HautevilleHouse
namespace MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact And.intro A.object.sourceKeyChecked A.object.theoremObjectChecked

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedMHDClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_mhd_endgame (A : AdmissibleClass) : ConstrainedMHDClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean
end HautevilleHouse
