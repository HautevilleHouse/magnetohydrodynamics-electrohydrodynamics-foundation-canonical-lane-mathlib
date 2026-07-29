import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean.MHDRegularityEndpointLayer

namespace HautevilleHouse
namespace MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean

structure MHDAnalyticCertificate where
  plasmaFlowClosed : Prop
  energyEnstrophyClosed : Prop
  compactnessRigidityClosed : Prop
  regularityEndpointClosed : Prop
  plasmaFlowClosedProof : plasmaFlowClosed
  energyEnstrophyClosedProof : energyEnstrophyClosed
  compactnessRigidityClosedProof : compactnessRigidityClosed
  regularityEndpointClosedProof : regularityEndpointClosed

def sourceMHDAnalyticCertificate : MHDAnalyticCertificate := {
  plasmaFlowClosed := MHDPlasmaFlowClosed sourceMHDPlasmaFlowCertificate
  energyEnstrophyClosed := MHDEnergyEnstrophyClosed sourceMHDEnergyEnstrophyCertificate
  compactnessRigidityClosed := MHDCompactnessRigidityClosed sourceMHDCompactnessRigidityCertificate
  regularityEndpointClosed := MHDRegularityEndpointClosed sourceMHDRegularityEndpointCertificate
  plasmaFlowClosedProof := source_mhd_plasma_flow_closed
  energyEnstrophyClosedProof := source_mhd_energy_enstrophy_closed
  compactnessRigidityClosedProof := source_mhd_compactness_rigidity_closed
  regularityEndpointClosedProof := source_mhd_regularity_endpoint_closed
}

def MHDAnalyticCertificateClosed (C : MHDAnalyticCertificate) : Prop :=
  C.plasmaFlowClosed ∧ C.energyEnstrophyClosed ∧ C.compactnessRigidityClosed ∧ C.regularityEndpointClosed

theorem source_mhd_analytic_certificate_closed : MHDAnalyticCertificateClosed sourceMHDAnalyticCertificate := by
  refine And.intro sourceMHDAnalyticCertificate.plasmaFlowClosedProof (And.intro ?_ (And.intro ?_ ?_))
  · exact sourceMHDAnalyticCertificate.energyEnstrophyClosedProof
  · exact sourceMHDAnalyticCertificate.compactnessRigidityClosedProof
  · exact sourceMHDAnalyticCertificate.regularityEndpointClosedProof

end MagnetohydrodynamicsElectrohydrodynamicsFoundationCanonicalLaneLean
end HautevilleHouse
