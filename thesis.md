Heaven’sLightisOurGuide
|     | DEPARTMENT |            | OF  | COMPUTER |     |             | SCIENCE |     | & ENGINEERING |     |
| --- | ---------- | ---------- | --- | -------- | --- | ----------- | ------- | --- | ------------- | --- |
|     | RAJSHAHI   | UNIVERSITY |     |          | OF  | ENGINEERING |         |     | & TECHNOLOGY, |     |
BANGLADESH
| Object-Level |     | Time-to-Contact |     |     |     | Estimation |     | from | Monocular | Video |
| ------------ | --- | --------------- | --- | --- | --- | ---------- | --- | ---- | --------- | ----- |
via Geometry-Consistent Pretraining under Limited Supervision
Author
|     |     |            |            |     | Md.        | Atik           | Mouhtasim |     |             |     |
| --- | --- | ---------- | ---------- | --- | ---------- | -------------- | --------- | --- | ----------- | --- |
|     |     |            |            |     | Roll       | No.            | 2003118   |     |             |     |
|     |     | Department |            | of  | Computer   |                | Science   | &   | Engineering |     |
|     |     | Rajshahi   | University |     |            | of Engineering |           | &   | Technology  |     |
|     |     |            |            |     | Supervised |                | by        |     |             |     |
|     |     |            |            |     | Farjana    |                | Parvin    |     |             |     |
|     |     |            |            |     | Assistant  |                | Professor |     |             |     |
|     |     | Department |            | of  | Computer   |                | Science   | &   | Engineering |     |
|     |     | Rajshahi   | University |     |            | of Engineering |           | &   | Technology  |     |

ACKNOWLEDGEMENT
With profound gratitude and unwavering belief in divine grace, I acknowledge the Almighty’s
guidance throughout my thesis journey. Without His benevolence, this task would have been
insurmountable. MayHiswisdomcontinuetoleadus.
In this endeavor, I am immensely indebted to the esteemed Farjana Parvin, Assistant Profes-
sor, Department of Computer Science & Engineering, Rajshahi University of Engineering &
Technology,Rajshahi. Hisunwaveringsupportandinvaluableassistancethroughoutthisstudy
have been instrumental in its successful completion. At every step, his wise counsel and en-
couragement motivated me to strive for excellence and evolve into an independent researcher.
His compassion and generosity served as a source of solace during times of mental strain. I
considermyselfincrediblyfortunatetohavehimasoursupervisor,andhisinspirationhasbeen
thedrivingforcebehindthisthesis.
My sincere gratitude extends to the entire faculty, whose precious time, expertise, and efforts
havecreatedanenvironmentconducivetoacademicresearch. Theirdedicationtonurturingour
intellectandfosteringourgrowthisdeeplyappreciated.
Finally, I extend my heartfelt appreciation to my beloved parents, whose unwavering love and
unwaveringsupporthavebeenthepillarsofstrengththroughoutmyacademicjourney.
August 1, 2026 Md. Atik Mouhtasim
RUET, Rajshahi
ii

Heaven’sLightisOurGuide
| DEPARTMENT | OF COMPUTER |                | SCIENCE | & ENGINEERING |
| ---------- | ----------- | -------------- | ------- | ------------- |
| RAJSHAHI   | UNIVERSITY  | OF ENGINEERING |         | & TECHNOLOGY, |
BANGLADESH
CERTIFICATE
Thisistocertifythatthethesisreportentitled“Object-LevelTime-to-ContactEstimationfrom
MonocularVideoviaGeometry-ConsistentPretrainingunderLimitedSupervision”,submit-
ted by Md. Atik Mouhtasim, Roll:2003118, is the candidate’s own work. The work was com-
pletedundermysupervisioninpartialfulfillmentoftherequirementsforthedegreeofBachelor
of Science in Department of Computer Science & Engineering of Rajshahi University of Engi-
neering&Technology. Thisthesishasnotbeensubmittedforanyotherdegree.
| Supervisor                   |     |     | ExternalExaminer             |     |
| ---------------------------- | --- | --- | ---------------------------- | --- |
| ——————————————–              |     |     | ——————————————–              |     |
| FarjanaParvin                |     |     | ExternalName                 |     |
| AssistantProfessor           |     |     | ExternalDesignation          |     |
| DepartmentofComputerScience& |     |     | DepartmentofComputerScience& |     |
| Engineering                  |     |     | Engineering                  |     |
RajshahiUniversityofEngineering& RajshahiUniversityofEngineering&
| Technology    |     |     | Technology    |     |
| ------------- | --- | --- | ------------- | --- |
| Rajshahi-6204 |     |     | Rajshahi-6204 |     |
iii

ABSTRACT
Time-to-contact(TTC)istheamountofsecondsthatpassuntilavehicleisabouttoimpact
an object in front of it. It is an extremely important safety parameter for driver assistance and
autonomous driving. But it’s costly to obtain dense metric TTC labelings at scale. The image-
basedproxies(bounding-boxexpansionoropticalflow)areunabletohandlecameramovement,
perspective effects, and tracking jitter. The purpose of this thesis is to present MonoTTC. It
provides an assessment of self-supervised geometric pretraining for the estimation of TTC at
theobjectlevel,withlimitedmetricsupervision,onasingleGPU.
The pipeline consists of a depth network (ResNet-18), a camera motion network, and a
Region-of-Interest(ROI)TTChead,alongsidefrozenRAFTopticalflow. Ground-truthtargets
arederivedfromnuScenes3Dtracksandcalibratedegoposesusingaconstant-velocitymodel
(τ = x/c). The dataset split is strictly scene-disjoint. We evaluate the method under a 25%
metric label budget within a forward collision corridor (|y | ≤ 2.5m) across five random
lat
seeds([42,123,2024,7,1337]).
The mean relative TTC error for the baseline model is 0.4131 ± 0.0186 (scene-balanced
error). With the inclusion of geometric consistency, the error is decreased to 0.3911±0.0178,
representing a 5.33% relative decrease in error. Four of the five paired seeds show smaller
errors. In the urgent 0–2 second window, absolute error drops from 2.11 s to 1.68 s. The 95%
confidence interval of the difference is [−0.0538,+0.0089], which includes 0, indicating that
thedifferenceisnotstatisticallysignificant. Thisperformanceimprovementislimitedbythree
physicalfactors: monocularscaleambiguity,limited25%metriclabelbudget,andnon-constant
velocity maneuvers during real-world braking or turning. Also, relative error for imminent
targets(0–2s)appearselevatedbecausesmallabsoluteerrorsaredividedbysmalltargettimes.
For critical targets (τ ≤ 2.0s), oracle risk classification achieves an AUROC of 0.8667±
0.0256andanAUPRCof0.2080±0.0493. Thisthesislaysthegroundworkforalabel-efficient
monocular TTC estimation baseline that is attainable and reproducible, though not providing
anend-to-endsafetyguarantee.
Keywords: Time-to-Contact (TTC), monocular depth estimation, self-supervised pretraining,
geometricconsistency,autonomousdriving,nuScenesbenchmark
iv

CONTENTS
Pages
| ACKNOWLEDGEMENT                              |              | ii  |
| -------------------------------------------- | ------------ | --- |
| CERTIFICATE                                  |              | iii |
| ABSTRACT                                     |              | iv  |
| CHAPTER1                                     | Introduction | 1   |
| 1.1 Introduction                             |              | 1   |
| 1.2 Motivation                               |              | 3   |
| 1.3 ResearchChallenges                       |              | 3   |
| 1.3.1 RelationshipsbetweenTheseChallenges    |              | 4   |
| 1.3.2 Threatswithrespecttoimage-spaceproxies |              | 4   |
| 1.4 ResearchGoals                            |              | 5   |
| 1.5 ProblemStatements                        |              | 5   |
| 1.6 UserRequirementAnalysis                  |              | 6   |
| 1.7 ResearchObjectives                       |              | 6   |
| 1.8 ResearchQuestions                        |              | 7   |
| 1.9 ResearchHypotheses                       |              | 7   |
| 1.10 ResearchContribution                    |              | 7   |
| 1.10.1 ImpactofthisResearch                  |              | 8   |
| 1.11 EnvironmentalSustainability             |              | 9   |
| 1.12 Ethics                                  |              | 9   |
| 1.12.1 ThesisManagementandTimeline           |              | 9   |
| 1.12.2 WorkBreakdownStructure(WBS)           |              | 10  |
| 1.12.3 GanttChartandTimeline                 |              | 11  |
| 1.13 ThesisOrganization                      |              | 11  |
| 1.14 Conclusion                              |              | 13  |
v

| CHAPTER2 | Background | Study and | Literature | Review |     |
| -------- | ---------- | --------- | ---------- | ------ | --- |
15
| 2.1 Introduction                                  |                                |     |     |     | 15  |
| ------------------------------------------------- | ------------------------------ | --- | --- | --- | --- |
| 2.2 AdvancedMathematicalandEngineeringKnowledge   |                                |     |     |     | 16  |
| 2.2.1 ProjectiveGeometryandCameraMotion           |                                |     |     |     | 16  |
| 2.2.1.1                                           | CameraCoordinatesandIntrinsics |     |     |     | 16  |
| 2.2.2 VisualOdometryandRelativeEgo-Motion         |                                |     |     |     | 17  |
| 2.2.3 Depth–PoseProjectionandGeometricFlow        |                                |     |     |     | 18  |
| 2.2.4 MonocularDepthandSelf-SupervisedGeometry    |                                |     |     |     | 18  |
| 2.2.5 OpticalFlowandTemporalMotion                |                                |     |     |     | 19  |
| 2.2.6 SupervisionofTTCandROIatObjectLevel         |                                |     |     |     | 21  |
| 2.2.7 RegressionandLearningObjectives             |                                |     |     |     | 21  |
| 2.3 ModernEngineeringTools                        |                                |     |     |     | 21  |
| 2.3.1 ComputingPlatformandHardwareConstraints     |                                |     |     |     | 22  |
| 2.3.2 SoftwareandCoreLibraries                    |                                |     |     |     | 22  |
| 2.3.3 DataProcessingandAnalysis                   |                                |     |     |     | 22  |
| 2.3.4 VersionControlandReproducibility            |                                |     |     |     | 22  |
| 2.4 LiteratureReview                              |                                |     |     |     | 23  |
| 2.4.1 Self-SupervisedMonocularDepth               |                                |     |     |     | 23  |
| 2.4.2 OpticalFlowandTime-to-ContactFormulations   |                                |     |     |     | 24  |
| 2.5 DataAnalysisTechniques                        |                                |     |     |     | 25  |
| 2.5.1 TargetPreparationandFiltering               |                                |     |     |     | 25  |
| 2.5.2 GeometricFeatureExtraction                  |                                |     |     |     | 26  |
| 2.5.3 ModelTrainingandTTCRegression               |                                |     |     |     | 26  |
| 2.5.4 PerformanceEvaluationandStatisticalAnalysis |                                |     |     |     | 26  |
| 2.5.5 VisualizationandReporting                   |                                |     |     |     | 27  |
| 2.6 Conclusion                                    |                                |     |     |     | 27  |
| CHAPTER3                                          | Methodology                    |     |     |     |     |
31
| 3.1 Introduction                    |     |                       |     |     | 31  |
| ----------------------------------- | --- | --------------------- | --- | --- | --- |
| 3.2 DatasetDescriptionandProtocols  |     |                       |     |     | 32  |
| 3.2.1 PrimaryDataset:               |     | nuScenesv1.0-trainval |     |     | 32  |
| 3.2.2 SecondaryEvaluationBenchmarks |     |                       |     |     | 34  |
| 3.2.3 AuthorizedDatasetRoles        |     |                       |     |     | 35  |
vi

| 3.2.4 AuditRecordandTarget-CacheProvenance        |     | 35  |
| ------------------------------------------------- | --- | --- |
| 3.2.5 DerivationofMetricTargetsinEgo-ForwardFrame |     | 36  |
| 3.2.6 EligibilityFiltersandRejectionLogic         |     | 37  |
3.3 ProposedWorkflowofMethodology 37
3.4 ProposedMethodology 39
| 3.4.1 SharedEncoderwithFeatureFlow      |     | 39  |
| --------------------------------------- | --- | --- |
| 3.4.2 Inverse-DepthDecoder              |     | 40  |
| 3.4.3 ConstructionofPoseNetandTransform |     | 41  |
| 3.4.4 FrozenRAFT-SmallReference         |     | 42  |
| 3.4.5 DenseTTCHead                      |     | 43  |
| 3.4.6 DataPre-processing                |     | 44  |
| 3.4.7 Stage-AGeometryPretraining        |     | 45  |
3.4.7.1 PhotometricReconstruction 45
3.4.7.2 Edge-AwareSmoothness 46
3.4.7.3 GeometricConsistency 46
3.4.7.4 TreatmentandBaselineObjectives 46
| 3.4.8 Stage-BLabel-EfficientTTCAdaptation     |     | 46  |
| --------------------------------------------- | --- | --- |
| 3.4.9 TrainingConfiguration                   |     | 48  |
| 3.4.10 ExperimentalSetupandEvaluationProtocol |     | 49  |
| 3.4.11 EvaluationUnitsandMetrics              |     | 50  |
| 3.4.12 PairedBootstrapandWilcoxonProcedure    |     | 51  |
| 3.4.13 ReproducibilityChecklist               |     | 52  |
3.5 Conclusion 52
| CHAPTER4 | Result Analysis | and Discussion |
| -------- | --------------- | -------------- |
54
4.1 Introduction 54
4.2 EvaluationScope 55
4.3 PrimaryCollision-CorridorResults 55
| 4.3.1 OverallCollision-CorridorComparison |     | 55  |
| ----------------------------------------- | --- | --- |
| 4.3.2 Five-SeedVariation                  |     | 56  |
| 4.3.3 UrgentTTCRangesError                |     | 57  |
| 4.3.4 InterpretationandClaimBoundaries    |     | 58  |
4.4 Conclusion 58
vii

| CHAPTER5 | Conclusions |     | and Future | Directions |     |     |
| -------- | ----------- | --- | ---------- | ---------- | --- | --- |
61
| 5.1 Introduction                    |                            |                                      |                                 |             |       | 61  |
| ----------------------------------- | -------------------------- | ------------------------------------ | ------------------------------- | ----------- | ----- | --- |
| 5.2 SummaryofThesisFindings         |                            |                                      |                                 |             |       | 62  |
| 5.2.1                               | Two-StageMonoTTCFramework  |                                      |                                 |             |       | 62  |
| 5.2.2                               | CoreEmpiricalResults       |                                      |                                 |             |       | 63  |
| 5.2.3                               | AnswerstoResearchQuestions |                                      |                                 |             |       | 63  |
| 5.3 MethodologicalLessons           |                            |                                      |                                 |             |       | 64  |
| 5.4 FutureResearchRoadmap           |                            |                                      |                                 |             |       | 64  |
| 5.4.1                               | Priority1:                 | ConfirmationProtocolcompleted        |                                 |             |       | 64  |
| 5.4.2                               | Priority2:                 | Targetsensitivityanalysisimprovement |                                 |             |       | 64  |
| 5.4.3                               | Priority3:                 | Detector-CoupledStudycompleted       |                                 |             |       | 65  |
|                                     | 5.4.3.1                    | Priority4:                           | MeasureEfficiencyandCalibration |             |       | 65  |
| 5.4.4                               | Priority5:                 | TestGeneralization                   |                                 |             |       | 65  |
|                                     | 5.4.4.1                    | Priority6:                           | EnableextensionoftheMotionModel |             |       | 65  |
| 5.5 Conclusion                      |                            |                                      |                                 |             |       | 66  |
| CHAPTERA                            | Supplementary              |                                      | Protocol                        | and Failure | Modes | 67  |
| A.1 Scene-RoleandLabel-BudgetMatrix |                            |                                      |                                 |             |       | 67  |
| A.2 ImplementationFailureModes      |                            |                                      |                                 |             |       | 68  |
| REFERENCES                          |                            |                                      |                                 |             |       | 69  |
viii

LIST OF TABLES
Sl TableName Pages
1.1 MonoTTCstudycoretermsandmeanings. 2
1.2 ScopeoftheMonoTTCthesis. 8
2.1 Rolesandscopeboundariesofcoresoftwarecomponents. 23
2.2 Taxonomyofrelatedmonoculardepth,flow,andTTCformulations. 24
3.1 PrimaryandsecondarydatasetsummaryfortheMonoTTCprotocol. 34
3.2 AuthorizeddatasetroleswithintheMonoTTCprotocol. 35
3.3 Target-cachemanifestprovenancefields. 36
3.4 EligibilityfilteringrulesformetricTTCtargetextraction. 37
3.5 PrincipalMonoTTCtrainingconfigurationanditsrole. 49
4.1 Forward collision corridor Oracle comparison under a 25% metric TTC label
budget(mean±standarddeviationacrossfiveseeds). 56
4.2 Scene-balancedrelativeTTCerrorbyrandomseedintheforwardcollisioncor-
ridor. 57
4.3 OraclerelativeTTCerrorpartitionedbytarget-TTCrange. 57
A.1 SceneroleandlabelbudgetmatrixoftheMonoTTCprotocol. 67
ix

LIST OF FIGURES
Sl FigureName Pages
1.1 Thechainofthoughtfromvehicledetectiontopotentialcollision. Theillustra-
tion is not an evaluated prediction, but rather an explanation of the meaning of
time-to-contact[6]. 3
1.2 GanttchartfortheMonoTTCthesistimelinefromJanuary2026toAugust2026. 12
2.1 Geometryofapinholecameramapping3DpointP = (X,Y,Z)to2Dprojec-
tionplanepixelcoordinate(u,v)[6]. Differentiablespatialprojectionandcon-
tinuous texture sampling enable gradient flow through the rendering pipeline
[12]. 17
2.2 Comparisonofvisualodometry,SLAM,andgloballocalizationforvehicleego-
motion [16]. Visual odometry estimates relative 6-DoF rigid body transforma-
tionsframe-by-frame. 18
2.3 Self-supervised monocular depth estimation pipeline. Target-frame depth pre-
diction, relative pose estimation, source-view reprojection, photometric recon-
struction loss, and edge-aware smoothness loss form the Stage-A pretraining
pipeline[2]. 19
2.4 Decomposition of 2D optical flow into 3D scene motion, camera ego-motion,
anddepthprojection[17]. 20
3.1 Relational metadata schema of nuScenes and nuImages [39]. Sample records
link camera calibration, object annotations, category taxonomy, and ego-pose
trackingmetadata. 33
3.2 Two-stageMonoTTCworkflow. StageApretrainsgeometryontemporalvideo
tripletsusingphotometric,smoothness,andgeometricflow-consistencylosses.
Stage B transfers encoder weights and adapts a dense TTC head under 25%
metricsupervision. 38
3.3 Temporalimage triplet(I ,I ,I ) sampledbythe Stage-Aloader withres-
t−1 t t+1
olution192×640. 39
x

3.4 SharedfeatureencoderarchitectureusedinResNet-18. Fourstagesofresidual
layers take single RGB input frames (192×640). The network outputs multi-
scalefeaturemaps(e ,e ,e ,e )with64,128,256,and512channels. 40
1 2 3 4
3.5 The inverse-depth decoder pipeline at multi-scale. Upsampling blocks employ
2× bilinear interpolation, skip connections from ResNet-18 and 3 × 3 convo-
lutions (256, 128, 64, 32 channels) to generate a single channel inverse depth
maps. 41
3.6 Figure6-DoFPoseNetcameraposeestimationpipeline. Asequenceoftempo-
ralRGBframes(6×192×640)isfedintotheconvolutionalfeaturelayersand
a512dimensionalbottleneck,whichregress3Dtranslationtandrotationr. 42
3.7 FrozenRAFT-SmallOpticalFlowReferenceArchitecture. AdjacentRGBframes
are fed to shared feature encoders, and a context encoder along with a correla-
tionvolumearefedtoarecurrentGRUblocktoestimatedense2Dopticalflow. 43
3.8 The dense TTC estimation network architecture. Decoder depth features and
flowresidualfeaturesarethenmergedtogether,processedby3×3convolutions
andclippedbyaclippedsigmoidtogenerateadenseTTCmap. 44
3.9 ROI-alignedTTClosscontract. DenseTTCpredictionsarepooledovera7×7
gridperobject,averaged,andsupervisedwithROI-equalizedHuberloss. 48
xi

Chapter 1
Introduction
1.1 Introduction
Time-to-contact (TTC) is the time an object would take to arrive at the current plane of the
ego-vehicle, if it continued to close on the ego-vehicle. This can be beneficial for the analysis
of short-term vehicle/visible road user interaction. The use of monocular video is attractive
due to the ubiquitousness of the camera, but is unable to directly deliver metric distances or
velocities. A robust system requires a fusion of the image evidence, geometric information,
andawell-definedtarget,asdoneinbinaryTTc[1]andMonodepth2[2].
Inthisthesis,theobject-levellongitudinalTTCforclosingvisibleroadusersisstudied. The
work emphasizes that it runs in a resource-limited environment, namely on one Kaggle P100
or T4 GPU and with limited nuScenes metric TTC supervision. The study splits the unlabeled
videopretrainingandtheTTCfinetuning,andexaminestheroleofageometry-consistencyterm
underanassumedlabelbudget. Thischapterpresentsbackgroundinformationontheproblem,
researchquestions,scopeandtheorganizationofthethesis.
TTC is a possible collision situation, not a definite collision. The value derived from the
currentstatemightnolongerrepresentthefutureinteractioniftheleadvehiclebrakes,changes
lane,turnsoraccelerates. Targetofthisthesisishenceforthreferredtoaslongitudinalconstant-
velocityTTC.Itisthenameoftheusefultimeinterpretationaswellasthephysicalassumption
onwhichitdepends.
The classical TTC definition is based on the separation divided by the positive closing ve-
locity for the target object [3, 1, 4]. Let x(t) denote the separation in the longitudinal direction
1

andc(t)betheclosingspeed,c(t) = −x˙(t) :
x(t)
τ(t) = , c(t) > 0. (1.1)
c(t)
The number is different from the binary collision label and only distance label [1]. A distant
objectclosinginatspeedmaybemoreofanemergencythatanobjectmovingawayslowlythat
is close. Additionally, TTC does not guarantee that a collision will occur. It is a time quantity,
undertheassumptionofastatedmotion,thatismodeled.
A complete forward-collision warning system [5] would include uncertainty, calibration,
latency, a decision policy, and TTC integrated with object detection and tracking. The present
thesis is aimed at separating the object-level regression part. This allows to investigate the
impact of the geometry-consistency treatment without a result of an oracle-ROI as an end-to-
endsafetyresult.
The differences listed in Table 1.1 are throughout the book. They ensure that related, but
differentamounts,arenotusedinterchangeably.
Table1.1: MonoTTCstudycoretermsandmeanings.
Term Meaninginthisthesis
Only positive-closing Longitudinalconstant-velocitytime-to-contact,τ = x/c.
objects were kept for
TTC
Metricsupervision TTCtargetsreconstructedfromcalibratednuScenestracksandego
poses,notjustfromimagespaceexpansion.
StageA Temporal self-supervised geometry pretraining with photometric,
smoothnessandoptionalconsistencylosses.
StageB Metric TTC adaptation with bounded dense head, projected ROIs
andROI-equalizedsupervision.
OracleROI A region estimated from an audited object annotation (excluding
detectormiss).
Development evi- Evidence used to diagnose or to refine a protocol, but is not neces-
dence sarilyfinal-validationevidence.
2

1.2 Motivation
TTC is different from a simple collision-event label. It is an ongoing measure of the time
involvedwithongoingclosingmotion. TheprojectproposesthedefintionofTTCbasedonthe
positionoftrackedobjectsandtheegoposition,andsavethetargetforqualifiedclosingobjects.
This difference is important because the quantity that the model is asked to estimate must be
manifestedinthetarget.
The difficulty lies in the reliable supervision of metrics. The protocol we plan involves
usingnuScenestrainscenesfortwodistincttasks: StageA,whereTTClabelsarehiddenduring
geometry pretraining; and Stage B, where a subset of TTC targets is declared for adaptation.
The official nuScenes validation scenes are only available in the locked final evaluation role.
The study asks the question: Can this limited label setting be made more effective with an
additionalconsistencysignal?
Figure1.1showsaconceptualdescriptionofTTCasaprocessthatgoesfromthedetection
ofavehicleaheadtoapotentialcollision. It’sathoughtexperiment,notasafetymeasurement.
Figure 1.1: The chain of thought from vehicle detection to potential collision. The illustration
isnotanevaluatedprediction,butratheranexplanationofthemeaningoftime-to-contact[6].
1.3 Research Challenges
The first challenge is in the metric supervision. With monocular vision, the distance of the
object ahead or the speed at which it is approaching is not easily apparent. Thus, the target
should be built based on information from a calibrated camera, tracked objects and ego pose.
3

Faultsinanyoftheseelementsmayalsoimpactthetarget.
Motion ambiguity poses the second challenge. Optical flow is a measure of image motion,
whereasTTCisbasedonobjectmotionwithrespecttotheegovehicle. Thegeometricresidual
betweenthefrozenRAFTflowanddepth-poseflowisemployedasafeaturebyTTChead[7]
butisnotnecessarilyavelocity.
Challenge number 3 is data leakage. The protocol needs to keep disjoint training, devel-
opment, and final validation scenes. Based on the development split, the thresholds, model
selections and label budgets must be determined. Official validation scenes should be kept
closeduntilthefinalevaluation.
Limited compute is the fourth challenge. The model should be able to fit on one GPU
with a maximum of 16GB memory. We use ResNet-18 encoder [8], mixed precision, frozen
RAFT-Small[7]andresumablecheckpointsinourdesign. Butinthefinalanalysisofthestudy,
coverage,errorandfailurecasesshouldbereportedinthecompleteevaluationset.
1.3.1 Relationships between These Challenges
These challenges must be tackled together. The otherwise good representation will look bad if
ithasanoisytarget. Leakysplitwillmaketheweakmethodlookgood. Failureofthedetector
will be treated as a regression failure and the computational cost of finding the region will be
hiddenbyanoracleregionofinterest(ROI).Additionally,alargermodelwillleadtobetterdev
metrics, but will not fit on the available GPU. The target, split, ROI source, compute budget,
andreportingruleareconsideredthepartsofasingledesignofthestudy.
1.3.2 Threats with respect to image-space proxies
Though helpful as diagnostic tools, the bounding box expansion and the flow divergence are
not targets in themselves. The expansion relies upon the shape of the object, the movement of
thecamera,theresolutionoftheimageandtheboxjitter. Dependingonthetexture,occlusion,
non-rigid motion, and calibration, the flow divergence may be different. The current pipeline
takestheimagemotionasaninputfeatureandsupervisesthetargetwiththeauditedlongitudinal
target,τ = x/c. Thisdesignstopthiscovertlybecomingthegroundtruthfortheproxy.
Let’snowexaminewhyweshouldsetalabelbudget. Limitedlabels’makesnosensewith-
out denominator and selection rule. Uniform per object, per frame or per scene 25% budget
4

willyielddifferentbudgetsanddifferentleakagerisk. TheMonoTTCprotocoldefinesthe25%
metric label budget, scene roles, the seed set and checkpoint/evaluation path. The specific se-
lectionlogicisdescribedinthetargetandprotocolappendicestoenablefuturerunstofacilitate
achangeofoneselectiondesignwithoutnegatingtheoriginalevidence.
1.4 Research Goals
The overall goal is to evaluate whether geometry-consistent pretraining on unlabeled driving
videoimproves object-levelmetric TTCestimation whenonly limited nuScenesTTC supervi-
sion is available [9]. The study is designed as a controlled comparison. The photometric and
smoothness baseline and the consistency treatment use the same principal protocol, while the
consistencytermistheintendedprimarydifference.
Thethesisalsoaimstomakethetargetconstructionandevaluationtraceable. Thisincludesa
target-cacheaudit,scene-disjointroles,declaredlabelbudgets,oracleanddetectedROImodes,
five standard seeds, and paired scene-level statistics. These controls define the scope of the
conclusions.
The study is intentionally narrower than the general problem of driving-risk prediction. It
includesobject-levellongitudinalTTCforeligiblevehiclesvisibleinthecalibratedfrontcam-
era, metric target construction from nuScenes tracks and ego poses, temporal self-supervised
geometry, limited-label TTC adaptation, and a paired comparison of two Stage-A objectives
withinaforwardcollisioncorridor.
1.5 Problem Statements
Fourrelatedproblemsareaddressedinthisresearch. Theforwardseparationandclosingspeed
arerequiredforthemetricobjectTTCsothattheimageclassificationcannotgivethetarget. In-
tegratingself-supervisedgeometricsignalsmightassist,butthereisaneedforatargetandROI
supervision. A limited-label study may be misleading if there is a mixture of these data roles,
targetcache,orthresholdchoices. Aresource-constrainedmodelmustalsohaveareproducible
reportingonaccuracyandcoverage.
The study does not mean to solve all of the driving-risk prediction. It does not guaran-
tee collision prediction, TTC without TTC labels, or zero-shot nuScenes TTC evaluation after
5

utilizingnuScenestrainingscenes.
1.6 User Requirement Analysis
ThecontextofacademicstudyneedsareproducibledefinitionofobjectTTC,anauditabletarget
cache, and a fair comparison between pretraining objectives. The results should be traceable
back to scene tokens, object records, seeds, configurations and checkpoints. A label-budget
study is helpful only if the budget, splitting and selection rules are specified prior to the final
evaluation.
Anengineeringpointofviewisthatthedesiredsystemshouldbeabletooperateonmonocu-
larvideoandbeaffordableusingasingleGPU.Itshouldrevealiferrorsareduetothegeometry
model, the TTC head, the ROI source, or the detector. The requirements drive to the separate
evaluation of oracle-ROI and detected-ROI and failure analysis. The reporting is done in the
samewayastheseparation.
1.7 Research Objectives
Thegoalsofthisthesisareto:
1. define and audit a metric object-level TTC target for nuScenes tracks, ego poses, cali-
bratedcamerageometryandtemporaldifferences;
2. deployatwo-stagePyTorchpipelineofgeometry-consistentpretrainingandlabel-efficient
TTCadaptation;
3. comparethephotometric-smoothnesspretrainingwiththesameobjectiveplusgeometric
consistencyunderthefull25%risk-awarelabelbudget;
4. compare the model against scene balanced TTC errors, Critical risk metrics, coverage,
pairedbootstrapconfidenceintervalsandWilcoxontests;
5. document the completed 25% risk-aware development result, but not as final-validation
orend-to-endsafetyevidence;and
6. recordtheprotocol,checkpoints,targetmanifestsandlimitationsinsuchawaythateach
headlineresultcanbetracedbacktoitssourceartifacts.
6

1.8 Research Questions
Thequestionsthatinformthethesisarethefollowing:
1. DoesgeometryconsistencyobjectiveataconstrainedTTClabelbudgetimprovetheob-
jectlevelTTCerrorforphotometricandsmoothnesspretraining?
2. Whatisthedifferenceinsizebetweenthebaselineandconsistencytreatmentfor5seeds
andscenelevelpairedevaluation?
3. Howisthemethod’sperformanceintheTTCrangeandintheindividualcollision-corridor
developmentanalysis?
4. What are the drawbacks of target construction, object distance, ROI source, detector de-
pendence,scenecoverageandtheresourceconstraint?
1.9 Research Hypotheses
Our main hypothesis for the consistency treatment is that it will lead to a reduction in scene-
balanced TTC error, compared to the baseline of the photometric-smoothness condition, with
allotherprimarysettingsfixed. Asecondhypothesisisthatthemagnitudeofthedifferencewill
depend on the TTC target range, with smaller TTC ranges still being challenging. Empirical
testsarenottestsofthehypothesesthattheconsistencyresidualisaphysicalvelocity.
1.10 Research Contribution
Thenoveltyofthisthesisisacontrolledevaluationofgeometry-consistentunlabeledvideopre-
trainingforlabel-efficientmetricobjectTTC.TheworkbringstogetherareproduciblenuScenes
target derivation, scene-disjoint roles, nested label budgets, a dense TTC representation, and
ROI-normalizedsupervision,inadditiontoa5-seedcomparison. Itisaprotocolandempirical
contribution that sets itself in contrast to well-known monocular-depth, optical-flow, and TTC
formulations [2, 7, 10, 4]. None of the tasks of depth, optical flow, pose estimation or object
levelTTCareinthemselvesnovel.
The study does not contain an assertion for fully self-supervised metric TTC as Stage B is
supervisedbymetricTTC.Itdoesnotcontainzero-shotnuScenesevaluationsincethetwo-stage
7

protocol relies on nuScenes training scenes. It is not accompanied by a guaranteed physical
collisiontimeasthetargethasassumedlongitudinalconstantvelocity. Itdoesnotfeatureafull
detectorcoupledsafetyresultastheverifiedheadlineanalysisisbasedonprojectedROIsinthe
Oracle framework. Lastly, it does not say that BDD100K boxes are metric TTC ground truth
ortheapproachisalwaysbetterthanpreviousTTCsystems.
Table 1.2 clarifies the difference between an implemented component, a measured result,
andanopenrequirement.
Table1.2: ScopeoftheMonoTTCthesis.
| Question |     |     | Currenttreatment | Interpretation |     |     |     |
| -------- | --- | --- | ---------------- | -------------- | --- | --- | --- |
Bounded model TTC Implemented dense head A model capability under the tar-
| value |     |     | andROIpooling | getandROIcontract. |     |     |     |
| ----- | --- | --- | ------------- | ------------------ | --- | --- | --- |
Does consistency change Five-seed 25% forward A bounded empirical finding for
| corridorTTCerror? |     |     | corridorcomparison | thedeclaredprotocol. |     |     |     |
| ----------------- | --- | --- | ------------------ | -------------------- | --- | --- | --- |
In deployment does it Notmeasuredend-to-end Detected ROIs, latency, calibra-
| warnreliably? |     |     |     | tion, | and safety | evaluation | re- |
| ------------- | --- | --- | --- | ----- | ---------- | ---------- | --- |
quired.
Is metric TTC learnt with- No; Stage B uses metric StageAisself-supervised,butthe
| outlabels? |     |     | TTClabels | complete | task | is not | fully self- |
| ---------- | --- | --- | --------- | -------- | ---- | ------ | ----------- |
supervised.
Is the residual equal to the No; it is a difference in Causes are geometry, motion, cal-
| relativevelocity? |          |            | flowfeature | ibration,occlusion.           |            |               |         |
| ----------------- | -------- | ---------- | ----------- | ----------------------------- | ---------- | ------------- | ------- |
| Does              | corridor | evaluation | No          | Does                          | it provide | an oracle-ROI |         |
| provide           | an       | end-to-end |             | evaluation?                   | Yes.       | Does          | the re- |
| safetyguarantee?  |          |            |             | sultgetboundedtoitsdocumented |            |               |         |
|                   |          |            |             | protocolandpopulation?        |            |               | Yes.    |
| 1.10.1            | Impact   | of this    | Research    |                               |            |               |         |
Thisworkhasamethodologicalimpact. ItexplainshowamonocularTTCstudycanbeassessed
onalimitedmetricsupervisionandhowthetargetandsplitdecisionsinfluencethequalityofthe
evidence. This can assist future work to make more exact comparisons between label budgets
8

andgeometryobjectives.
Theresultsarenotintendedtobeinterpretedasacertifiedsafetysystem. TTCisdetermined
in a closing-motion model and is not a guaranteed collision time. The thesis never says that it
is ready for deployment or safe to deploy. If it were to be used for safety in the future, there
wouldneedtobefurtherevidence,analysisofdetectors,latencymeasurementandtesting.
1.11 Environmental Sustainability
Theprojectdoesnotaimtobuildalargedistributedsystem,buttouseasingleKaggleP100or
T4 GPU. It employs a lightweight ResNet-18 backbone, fixed RAFT-Small, mixed precision,
resumablecheckpoints,andlabelbudgets. Thesedecisionsminimisereuseofcalculationsinthe
development process, but the environmental impact of experiments was not quantified in this
thesis. Thestudydoesnotofferaquantitativecarbonclaimbutrathercomputationalefficiency
asadesignconstraint.
1.12 Ethics
The study leverages the nuScenes dataset and its associated metadata under the terms of the
dataset. Itisnotanewmethodofcollectinghumansubjects. Researchevaluationisperformed
usingimagesandannotations,andthethesismaintainstheexplicitnessoftheprovenanceofthe
datasetsandtheirtargetconstruction.
Academic integrity is dealt with through distinction between verified results and planned
experiments and negative or mixed results are retained. The method is not termed as fully
self-supervised metric TTC, zero-shot nuScenes evaluation, first or state-of-the-art. External
methodsarereferredtointherepositorybibliographyandonlydescribedifseenvisually.
1.12.1 Thesis Management and Timeline
The thesis work was divided into nine interrelated phases. In each phase research work was
groupedtogetherandresultswerefedtothenextphase. ThefollowingWorkBreakdownStruc-
ture(WBS)liststheworkcompletedbetweenJanuary2026andAugust2026.
9

| 1.12.2  | Work Breakdown                        | Structure | (WBS) |
| ------- | ------------------------------------- | --------- | ----- |
| Phase1: | LiteratureReviewandProblemFormulation |           |       |
(a) Review Monocular depth, optical flow, self-supervised learning and TTC re-
search.
(b) Write down the key datasets of the models, designs, loss functions, and noted
limitations.
(c) State the research questions related to the camera-motion ambiguity and few
metricTTClabels.
| Phase2: | DataAcquisition,BenchmarkSetup |     |     |
| ------- | ------------------------------ | --- | --- |
(a) Generate nuScenes v1.0-trainval as the primary source for metrics-TTC.
Inspect calibration, camera metadata, frame timing, annotation and data sets
permissions.
(b) Definescene-disjointrolesttc_train,ttc_devand ttc_final_val.
| Phase3: | DerivationofMetricTargetsandAudit |     |     |
| ------- | --------------------------------- | --- | --- |
(a) Compute the ego-forward coordinate transformation for nuScenes tracks and
egoposes.
(b) Calculateclosingspeedusingallowedcentredorone-sidedfinitedifferences.
(c) Addthevehicle,visibility,ROI,motionandTTCfilters,andgeneratetheman-
ifestverifiedtargetcache.
| Phase4: | Stage-AArchitectureDesignandImplementation |     |     |
| ------- | ------------------------------------------ | --- | --- |
(a) AdoptthecommonResNet-18encoderandtheinverse-depthdecoder.
(b) UsePoseNetforrelativetransformestimationofcamera.
(c) AddfrozenRAFT-Smallflowfortheimage-motionreference.
| Phase5: | Self-SupervisedGeometryPretraining(StageA) |     |     |
| ------- | ------------------------------------------ | --- | --- |
(a) Includespatialreprojectionmodule,projectedgeometricflow.
(b) Writeoutthelossesofphotometric,smoothnessandgeometricconsistency.
10

(c) PretrainthegeometryrepresentationonunlabeledtemporalnuScenestriplets.
| Phase6: | Stage-BLabel-EfficientTTCAdaptation |     |
| ------- | ----------------------------------- | --- |
(a) UseboundedROITTCheadwithROI-equalizedHubersupervision.
(b) Run the 5-seed 25% metric label budget evaluation process for the declared
roles.
(c) Applycollision-corridorriskobjectiveandthresholdselection.
| Phase7: | EvaluationandErrorAnalysis |     |
| ------- | -------------------------- | --- |
(a) AnalyzeTTCerror,coverage,target-TTCrangesandcriticalriskmetrics.
(b) Partition oracle-ROI regression evidence from the pending detected-ROI sys-
temanalysis.
(c) Includeseedvariation,figures,andlimitationsofevidenceandevaluationscope.
| Phase8: | WritingtheThesisBook |     |
| ------- | -------------------- | --- |
(a) DraftChapters1and2.
(b) DraftChapter3(derivationoftarget,model,losses,evaluationprotocol).
(c) Draft Chapters 4 and 5 using the verified 25% results, limitations and future
work.
| 1.12.3 | Gantt Chart | and Timeline |
| ------ | ----------- | ------------ |
Figure 1.2 shows the relative timing of the eight phases and their main subtasks from January
2026toAugust2026.
| 1.13 | Thesis Organization |     |
| ---- | ------------------- | --- |
The rest of this thesis comprises four chapters. Every chapter deals with one aspect of the
MonoTTCstudy,rangingfromthetechnicalbasisuptotheresultsandfutureperspectives.
| • Chapter2: | RelatedWorkandTechnicalBackground |     |
| ----------- | --------------------------------- | --- |
This chapter explains some of the mathematical and engineering concepts that are re-
quiredtocomprehendMonoTTC.Itincludesmonoculardepth,camerapose,opticalflow,
11

2026
Phase/WorkBreakdownSubtask
Jan Feb Mar Apr May Jun Jul Aug
1.Phase1:LiteratureReview Phase1
(a)Searchandsurveydepth/TTCliterature
(b)Annotatemethods,datasets,andlosses
(c)Formulategapsandresearchquestions
2.Phase2:DataAcquisition Phase2
(a)Gatherandorganizetheresearchdatasets
(b)Verifycalibration,timing,andpermissions
(c)Establishscene-disjointsplitboundaries
3.Phase3:MetricTargetDerivationandAudit Phase3
(a)Formulate3Drelativecoordinatetransforms
(b)Deriveclosingspeedswithfinitedifferences
(c)Applyfiltersandauditthetargetcache
4.Phase4:Stage-AArchitectureSetup Phase4
(a)ImplementResNet-18andinverse-depthdecoder
(b)ImplementPoseNetrelativecameratransformation
(c)IntegratefrozenRAFT-Smallflow
5.Phase5:Stage-AGeometricPretraining Phase5
(a)Implementspatialreprojectionandgeometricflow
(b)FormulatethethreeStage-Alossterms
(c)Pretrainonunlabeledtemporaltriplets
6.Phase6:Stage-BTTCAdaptation Phase6
(a)ImplementboundedROIheadandHuberloss
(b)Executefive-seed25%corridorprotocol
(c)Selectcheckpointsandthresholdsondevelopmentdata
7.Phase7:EvaluationandErrorAnalysis Phase7
(a)EvaluateTTCerrorsandcritical-riskmetrics
(b)Analyseoracle-ROIandpendingdetected-ROIpaths
(c)Documentresults,seedvariation,andlimitations
8.Phase8:WritingtheThesisBook Phase8
(a)DraftChapters1and2
(b)DraftChapter3
(c)DraftChapters4and5
Figure1.2: GanttchartfortheMonoTTCthesistimelinefromJanuary2026toAugust2026.
12

geometric flow and TTC at the object level. It also surveys previously related works in
thefieldsofestimatingTTCandlearninggeometry.
• Chapter3: Methodology
In this chapter we introduce the dataset roles, TTC target construction, and two-stage
training pipeline. It outlines the architecture of the model, the features included in ge-
ometric flows, the loss functions, the ROI supervision, the label-budget protocol, the
checkpointprocedureandtheevaluationdesign.
• Chapter4: ExperimentsandResults
This chapter presents the major results of this evaluation for five seeds under the 25%
metric label budget. It addresses TTC errors, coverage, target-range behaviour, limita-
tionsandtheboundaryofevidence.
• Chapter5: ConclusionandFutureWork
Themainfindingsandresponsestotheresearchquestionsareincludedinthefinalchapter.
Itdiscussesthecontributionsandlimitationsofthestudy. Italsoliststhefurthervalidation
andmethodologicalimprovementsrequiredforfutureresearch.
1.14 Conclusion
Thischapterconcludedwiththethesisitselfbeingacontrolledstudyontheobjectlevelmetric
TTC with limited supervision. It has brought two-stage design, the scene and target hygiene
requirements, primary comparison, and claim boundary. The technical background for under-
standingthemodelandtheevaluationarepresentedinthenextchapter.
Thecentralissueistoensurethatthenumberpredictedisconsistentintermsofmeaningin
targetconstruction,trainingandevaluationreport. ATTCvalueisonlymeaningfuliftheobject
isidentified,forwardseparationisspecified,closingdirectionisknownandthetimeintervalis
valid. Thethesisisconsideredasacomponentofthescientificmethod. Ifthenetworkchanges
andthepopulationofthemodelchanges,thenthemodelcannotbefairlyevaluated.
ThechapteralsoprovidedanunderstandingofthenecessitytodiscussmonocularTTCwith
caution. Depthandmotionareonlypartlyobservablefromasinglecamera. Thetemporalcues
can limit the solution, but do not resolve ambiguities arising from camera motion, occlusion,
texture, and/or variations in object behavior. For this reason, the study chooses to employ the
13

geometriclearningmethodasarepresentationmethodandadoptsthemetricTTClabelsinStage
B. The wording of the thesis follows this distinction. For the image reconstruction, stage A is
self-supervised,andthefullobject-leveltaskofTTCislabel-assisted.
Definitions have a direct impact on the scope of experiments. The main comparison is to
twostage-Agoalsunderthesamestage-Badaptationpathway. Itemploysadeclared25%TTC
labelbudget,5seedsandanoracleprojectedROIinaforwardcollisioncorridor. Thetestofthe
methodisconductedintheforwardcorridorandtheshorthorizonbehaviourisseparatedfrom
the overall average. This does not account for detector errors, deployment latency, warning
calibration,orarbitraryfuturemanoeuvresofthetargetvehicle.
This is a positive aspect of the study. It identifies the measured component of the system
and the open component. A smaller regression error within an audited ROI is conducive to a
representation-levelconclusion. Butaloneit’snotevidenceofafullcollision-warningsystem.
This separation is maintained in the later chapters when they describe the target cache, the
trainingprotocol,thefive-seedcomparisonandtheplanforfuturevalidation.
The following chapter expands upon these ideas in the design, associating the camera pro-
jection,depth,pose,opticalflowandlongitudinalmotion. Itthenoverlaystheproposedpipeline
withexistinggeometryandTTCformulations. Thisbackgroundisnecessarysincethemainre-
sult relies on various quantities that are interrelated. It is important to know their assumptions
andtounderstandwhatasmallchangeinthefinalerrormeans.
14

Chapter 2
Background Study and Literature Review
2.1 Introduction
Spaceandmotionnearavehiclearekeyaspectsofmonocularcomputervision. Thecamerais
able to capture 2D image projections. It is not directly giving the metric depth, camera motion
or time of arrival of a closing object to reach the ego car. A robust system requires a fusion of
imageevidence,geometricinformation,andawell-definedtarget[2,1].
ThischapterprovidesamathematicalandengineeringbackgroundaboutMonoTTC.Itfur-
ther provides a review of the related work and the techniques used for data analysis. The dis-
cussion offers support to the methodology in Chapter 3 and the evidence reported in Chapter
4.
Thetopicsarediscussedintheorderofsystemdependencies. Howapixelcanbeprojected
betweenframesisdeterminedbycameraintrinsicsandpose. Thethree-dimensionalpointper-
tainingtoeachpixelisdeterminedbydepth. Opticalflowistheobservedimagedisplacement,
and the TTC target is a function of forward separation and closing speed. Though used in the
model in combination, these quantities should not be confused. In particular, no image flow
canbemeasureddirectlyinthedirectionoflongitudinalmotion.
Thisdifferenceisofgreatestimportancewhendeterminingthemotionofobjectsontheroad.
Ambiguitycanarisewhenthecamerarotates,whenthereisanearbystationaryobject,because
ofanindependentlymovingvehicle,orbecauseofadiscrepancybetweenestimateddepthand
actualscenegeometry. Therecanbemultiplephysicalexplanationsforthesamevisualpattern.
While self-supervised reconstruction enables the model to discover a useful representation of
geometry,itoptimizesreconstructiononly,whichdoesnotspecifytheobject-levelTTCtarget.
15

TheconnectionisestablishedviaROIsupervisionandanauditedtargetdefinition.
The background also provides a rationale for conservative evaluation. The proposed con-
sistency feature is based on comparing two image motion descriptions: the first from frozen
RAFT-Small and the second from learned depth–pose projection. Agreement can be helpful,
butdisagreementcanoccurinavarietyofways: underestimationofdepth,movingobjects,oc-
clusion boundaries, calibration errors, or optical flow errors. The feature is passed to the TTC
head without claiming it to be physical relative velocity. This formulation retains the practical
significanceofthefeaturewhilemaintainingscientificrigor.
Finally,the mathematical assumptions are tied directly to the data protocol. A longitudinal
constant-velocity target is easier to audit than a target attempting to predict arbitrary future
maneuvers. Itremainsanestimate. Thevaluemaydifferfromsubsequentactualtrajectoriesif
theleadvehiclebrakes,accelerates,changeslanes,orcutsin. Thistargetcontractismaintained
consistently across chapters, enabling the findings to be evaluated clearly even under limited
labelbudgets.
2.2 Advanced Mathematical and Engineering Knowledge
MonoTTCisacombinationofprojectivegeometry,temporalmotion,andneuralfeaturelearn-
ing. Thefollowingsectionsdefinethefoundationalconceptsrequiredforthisformulation.
2.2.1 Projective Geometry and Camera Motion
2.2.1.1 CameraCoordinatesandIntrinsics
TheintrinsicmatrixK ofacameramapsthree-dimensionalpointstotheimageplane. Forself-
supervisedmonoculardepth,calibratedpinholereprojectionfollowsGodardetal.[2]. Apoint
p inthesourceframeisprojectedfromtargetframepixelpwithdepthD (p)andrelativepose
s t
T :
t→s
p = KT D (p)K
−1p.
(2.1)
s t→s t
Here, p is the projected 2D point in the source view, K is the 3 × 3 camera intrinsic matrix
s
(containing focal lengths and principal points), D (p) is the estimated metric depth at target
t
pixel p, and T is the 4 × 4 rigid camera transformation matrix. The implementation uses
t→s
calibratedcameraintrinsicsperclip,updatingthemafterimageresizingorcropping.
16

Thepinholecameramodel[11]maps3Dscenepointsto2Dimagecoordinates. A3Dpoint
P = (X,Y,Z) lies on a ray passing through the camera center C, as illustrated in Figure 2.1.
Therayintersectstheimageplaneatpixelcoordinates(u,v)alongopticalaxisd. Differentiable
rendering maps 3D coordinates to 2D pixel locations via ray casting [12], using bilinear sam-
plingforcontinuous,differentiabletextureinterpolationduringend-to-endbackpropagation.
Figure 2.1: Geometry of a pinhole camera mapping 3D point P = (X,Y,Z) to 2D projection
plane pixel coordinate (u,v) [6]. Differentiable spatial projection and continuous texture sam-
plingenablegradientflowthroughtherenderingpipeline[12].
2.2.2 Visual Odometry and Relative Ego-Motion
Visual odometry computes relative camera motion across image sequences by estimating 6-
DoFrigidbodytransformationsbetweenframepairs[13,14]. PoseNet[15]servesasthevisual
odometrymoduleinself-supervisedmonocularlearning,estimatingframe-to-frameego-motion
to reproject target pixels into source views [2]. A comparison of visual odometry, SLAM, and
globallocalizationisillustratedinFigure2.2.
17

Figure 2.2: Comparison of visual odometry, SLAM, and global localization for vehicle ego-
motion [16]. Visual odometry estimates relative 6-DoF rigid body transformations frame-by-
frame.
2.2.3 Depth–Pose Projection and Geometric Flow
Thedisplacementvectorbetweenprojectedpixelp andoriginaltargetpixellocationpdefines
s
theprojectedgeometricflowfield(OF ). Avalid-projectionmaskexcludespointswithnon-
geo
positiveprojecteddepthorout-of-boundsimagecoordinates.
2.2.4 Monocular Depth and Self-Supervised Geometry
The depth–pose learning pipeline is summarized in Figure 2.3. Inverse depth is predicted for
the target image, while PoseNet estimates relative camera motion between adjacent frames.
Targetpixelsarereprojectedintosourceframes,andphotometricandsmoothnesslossesguide
learning[2].
18

Figure 2.3: Self-supervised monocular depth estimation pipeline. Target-frame depth predic-
tion, relative pose estimation, source-view reprojection, photometric reconstruction loss, and
edge-awaresmoothnesslossformtheStage-Apretrainingpipeline[2].
Temporal appearance consistency replaces dense ground-truth depth labels. Minimum re-
projection loss handles occlusions [2], while auto-masking ignores static or camera-rate mov-
ing pixels. However, dynamic objects, reflections, and non-rigid motion break static-scene
assumptions. Geometric consistency introduces an auxiliary feature comparing optical flow
withprojectedgeometrywithoutground-truthflowsupervision.
2.2.5 Optical Flow and Temporal Motion
Opticalflowmeasures2Dpixelmotionbetweenconsecutivevideoframes. Observed2Dflow
combinescameramotion,scenedepth,and3Dobjectmotion,asshowninFigure2.4. MonoTTC
employsfrozenRAFT-Smalltoextractdense2Dopticalflowasanimage-motionreference.
19

Figure 2.4: Decomposition of 2D optical flow into 3D scene motion, camera ego-motion, and
depthprojection[17].
RAFTdefinesopticalflowasdense2Ddisplacement[7]:
u(p) = [∆u(p),∆v(p)]T, (2.2)
Here, u(p) denotes horizontal displacement ∆u(p) and vertical displacement ∆v(p) of pixel p
between consecutive frames. It describes observed image motion without separating camera
motion,objectmotion,oropticalflowerror.
Accurate depth–pose geometry should align with optical flow in static scene regions. The
geometric flow residual feature is calculated as the difference between RAFT optical flow and
depth–posegeometricflow[2,7]:
∆OF(p) = OF (p)−OF (p). (2.3)
RAFT geo
Here,OF (p)isdenseopticalflowfromfrozenRAFT-Small[7],andOF (p)isprojected
RAFT geo
flowfromestimateddepthandpose.
Whentrackingobjectcentersattimest−∆tandt+∆t,longitudinalclosingvelocityx˙(t)
isestimatedviafinitedifferences[18]:
x(t+∆t)−x(t−∆t)
x˙(t) ≈ , (2.4)
(t+∆t)−(t−∆t)
where x is forward longitudinal distance and x˙ is rate of change of separation. Centered dif-
ferencesarepreferred;one-sideddifferencesareusedonlyatsequenceboundarieswithinvalid
timestampconstraints.
20

| 2.2.6 | Supervision | of TTC | and | ROI | at Object | Level |     |     |
| ----- | ----------- | ------ | --- | --- | --------- | ----- | --- | --- |
Longitudinal time-to-contact τ for closing objects is defined as the ratio of forward distance x
topositiveclosingspeedc[1,4]:
|     |     |     |     | x   | dx  |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
−
|     |     |     | τ = | ,   | c = | > 0. |     | (2.5) |
| --- | --- | --- | --- | --- | --- | ---- | --- | ----- |
|     |     |     |     | c   | dt  |      |     |       |
Time-to-contact τ is measured in seconds, distance x in meters, and closing speed c in meters
≤
persecond. Targetsareauditedandretainedforc > 0.5m/sand0 < τ 10s. Non-closingor
| departingobjects(c |     | ≤ 0)areexcluded. |     |     |     |     |     |     |
| ------------------ | --- | ---------------- | --- | --- | --- | --- | --- | --- |
To evaluate dense TTC predictions per object, ROIAlign [19] extracts a 7 × 7 grid R for
i
each projected 2D bounding box. A bounded sigmoid output transform caps predictions to
| [0.1,10.0] | seconds:                             |              |      |            |             |     |     |       |
| ---------- | ------------------------------------ | ------------ | ---- | ---------- | ----------- | --- | --- | ----- |
|            |                                      |              | τˆ = | 0.1+9.9    | sigmoid(z), |     |     | (2.6) |
| wherez     | israwlogitoutputfromthedenseTTChead. |              |      |            |             |     |     |       |
| 2.2.7      | Regression                           | and Learning |      | Objectives |             |     |     |       |
MonoTTCframesTTCasacontinuousregressiontarget. StageAlearnsscenegeometryfrom
temporal image agreement. Stage B adapts the representation to metric TTC supervision. The
following ROI-equalized objective is the thesis-defined adaptation of robust regression to the
object-leveltarget[20]:
|     |     |     |     | XN obj | X   |     |     |     |
| --- | --- | --- | --- | ------ | --- | --- | --- | --- |
|     |     |     | 1   | 1      |     |     |     |     |
−τ
|     |     | L   | =   |     | Huber(τˆ |     | ).  | (2.7) |
| --- | --- | --- | --- | --- | -------- | --- | --- | ----- |
|     |     | TTC | N   | 49  |          | i,p | i   |       |
obj
|     |     |     |     | i=1 | p∈Ri |     |     |     |
| --- | --- | --- | --- | --- | ---- | --- | --- | --- |
where L represents the average object-level Huber loss, N is the number of valid object
|     | TTC |     |     |     |     | obj |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
ROIs,R denotesthe7×7gridpointsforobjecti,τˆ ispredictedTTCatpointp,andτ
|     | i   |     |     |     | i,p |     |     | i isthe |
| --- | --- | --- | --- | --- | --- | --- | --- | ------- |
targetscalar. TheHuberlossreducessensitivitytoextremeoutlierresiduals[20].
| 2.3 | Modern | Engineering |     | Tools |     |     |     |     |
| --- | ------ | ----------- | --- | ----- | --- | --- | --- | --- |
Cloudhardware,deeplearninglibraries,versionedtargetmanifests,andscientificPythontools
supporttheexperimentalframework.
21

| 2.3.1 Computing |     | Platform |     | and Hardware | Constraints |
| --------------- | --- | -------- | --- | ------------ | ----------- |
Experiments are configured for execution on single Kaggle Tesla P100 or T4 GPUs (16 GB
VRAMlimit). Datasets(nuScenesv1.0-trainval[9],KITTI[21],BDD100K[22])arestored
inversionedstructures,whilecheckpoints,targetcaches,andfiguresaremaintainedinisolated
paths.
| 2.3.2 Software |     | and | Core | Libraries |     |
| -------------- | --- | --- | ---- | --------- | --- |
ThecodebaseusesPython3.10andPyTorch[23]fortensorcomputationandautomaticdiffer-
entiation(AMP).PretrainedResNet-18encoders[8]areinstantiatedviatimm[24],Kornia[25]
providesgeometrictransformations,frozenRAFT-Small[7]generatesopticalflowreferences,
andthenuScenesdevkit[9]handlessensorcalibration,egoposes,and3Dannotations.
| 2.3.3 Data | Processing |     | and | Analysis |     |
| ---------- | ---------- | --- | --- | -------- | --- |
NumPy [26] and SciPy [27] support numerical operations and bootstrap significance testing.
OpenCVhandlesimagedecoding,transformations,andvideoextraction. Scikit-learn[28]com-
putesevaluationmetrics,andMatplotlib[29]/Seabornproducevisualizationfigures.
| 2.3.4 Version | Control |     | and | Reproducibility |     |
| ------------- | ------- | --- | --- | --------------- | --- |
Code changes are tracked with Git/GitHub. Target cache manifests record data hashes, scene
tokens, and protocol parameters. Table 2.1 summarizes software component roles and scope
boundaries.
22

Table2.1: Rolesandscopeboundariesofcoresoftwarecomponents.
| Component | Role |     | Interpretationboundary |     |
| --------- | ---- | --- | ---------------------- | --- |
PyTorch Model definition, autograd, and Framework tool; execution re-
|     | trainingexecution |     | quires verified | manifest check- |
| --- | ----------------- | --- | --------------- | --------------- |
points.
timm ImageNet-pretrained ResNet-18 Feature initialization; does not
|     | backbone |     | supplymetricdepthscale. |     |
| --- | -------- | --- | ----------------------- | --- |
torchvision Frozen RAFT-Small and Flowisanauxiliaryinputfeature,
|     | ROIAlignoperations |     | notground-truthTTC. |     |
| --- | ------------------ | --- | ------------------- | --- |
Kornia Differentiable grid sampling and Geometric transformation utili-
|     | warping |     | ties. |     |
| --- | ------- | --- | ----- | --- |
nuScenesdevkit Sensorcalibration,3Dboxes,and Target extraction and bounding-
|     | ego-motion |     | boxprojection. |     |
| --- | ---------- | --- | -------------- | --- |
Parquet/JSON Versionedtarget-cachestorage Provenance storage for repro-
duciblesplitsandtargets.
Tectonic LaTeXmanuscriptcompilation Compilationverifiesmarkup,not
underlyingscientificclaims.
| 2.4 Literature | Review |     |     |     |
| -------------- | ------ | --- | --- | --- |
This section reviews self-supervised depth, optical flow, and TTC estimation methods across
predictionunits,supervisiontypes,andevaluationprotocols.
| 2.4.1 Self-Supervised | Monocular | Depth |     |     |
| --------------------- | --------- | ----- | --- | --- |
Self-supervised monocular depth estimation was established by SfMLearner [30] and Mon-
oDepth [31]; MonoDepth2 introduced minimum reprojection and auto-masking [2]. GeoNet
and EPC++ coupled scene geometry and optical flow [32, 33], while SC-DepthV3 addressed
dynamic scene violations [34]. These methods optimize photometric appearance reprojection
butdonotdirectlyoutputobject-levelTTC.
23

| 2.4.2 Optical | Flow and | Time-to-Contact | Formulations |     |     |
| ------------- | -------- | --------------- | ------------ | --- | --- |
RAFTestimatesdense2Dopticalflowviaall-pairscorrelationvolumes[7]. BinaryTTCformu-
lates collision risk as binary classification [1]. TSTTC provides an object-oriented benchmark
[10], and oTTC models object-level TTC for autonomous driving [4]. Table 2.2 categorizes
thesemethods.
Table2.2: Taxonomyofrelatedmonoculardepth,flow,andTTCformulations.
| Work | Predictionunit | Supervision | Relevanceandboundary |     |     |
| ---- | -------------- | ----------- | -------------------- | --- | --- |
MonoDepth2[2] Pixeldepth Temporal self- Photometric reconstruction, min-
|     |     | supervision | imum reprojection, | auto-masking |     |
| --- | --- | ----------- | ------------------ | ------------ | --- |
baseline.
GeoNet[32] Pixel depth, Unsupervised Dynamic scene flow coupling;
|     | flow,pose | geometry | pixel target | differs from | object |
| --- | --------- | -------- | ------------ | ------------ | ------ |
TTC.
EPC++[33] Pixel geometry/- Unsupervised Holistic motion reasoning; does
|     | motion | geometry | notevaluatemetricobjectTTC. |     |     |
| --- | ------ | -------- | --------------------------- | --- | --- |
RAFT[7] Pixelflow Supervisedflow Frozen image-motion reference;
notadirectTTCpredictor.
BinaryTTC[1] Pixel/gridrisk Supervised clas- Binaryriskclassification(current
|     |     | sification | focusiscontinuousobjectregres- |     |     |
| --- | --- | ---------- | ------------------------------ | --- | --- |
sion).
TSTTC[10] ObjectTTC Monocular External benchmark context; dif-
|     |     | benchmark | ferent protocol | and dataset | as- |
| --- | --- | --------- | --------------- | ----------- | --- |
sumptions.
oTTC[4] ObjectTTC Object supervi- Object-level formulation; re-
|     |     | sion | quires matched | protocol | for |
| --- | --- | ---- | -------------- | -------- | --- |
directcomparisons.
MonoTTC ObjectROITTC Stage-A self- Controlled 5-seed evaluation un-
|     |     | supervision | + der25%metriclabelbudget. |     |     |
| --- | --- | ----------- | -------------------------- | --- | --- |
|     |     | Stage-B     | metric                     |     |     |
labels
24

The gap addressed by this thesis is not the invention of monocular depth, optical flow,
orTTC.Thenarrowerquestioniswhetheranauditablegeometric-consistencysignalimproves
object-levelTTCafterlimited-labeladaptation. ThestudyusesnuScenescalibration,3Dboxes,
and ego-motion to derive metric targets. Training, development, and validation scenes are dis-
joint. Because nuScenes training scenes are used, the fine-tuned model is not zero-shot on
nuScenes. Thethesisdoesnotclaimnoveltyforstandalonedepth,flow,pose,ordetectorcom-
ponents.
2.5 Data Analysis Techniques
The evaluation pipeline encompasses target preparation, geometric feature extraction, model
training,andstatisticalreporting.
2.5.1 Target Preparation and Filtering
Targetrecordsareauditedagainststricteligibilitycriteria:
• Validmotorvehicleclassvisibleinthefrontcamera;
• Clipped2DROIwithpositivearea(≥ 8×8pixels)afterimagescaling;
• Forwardlongitudinalseparationx ∈ [1,80] m;
• Consecutivetimestampswithframeinterval∆t ≤ 1.5s;
• Positiveclosingspeedc > 0.5m/sandtargetTTCτ ∈ (0,10] s;
• Associatedlidarorradarpointreturns.
The scene split is disjoint. Training uses a declared 25% metric label budget. The primary
evaluation protocol discussed in Chapter 4 uses this 25% budget within a forward collision
corridor. Development scenessupport modeland thresholdselection. The finalvalidation role
is read only by the locked evaluation path. Oracle ROI evaluation uses projected nuScenes
boxes. DetectedROIevaluationusesadetectorfixedonthedevelopmentsplit.
25

| 2.5.2 Geometric |     | Feature | Extraction |     |     |     |     |
| --------------- | --- | ------- | ---------- | --- | --- | --- | --- |
Thepipelinedecodesandresizesthecalibratedimagepair,updatestheintrinsicmatrix,predicts
inverse depth, and estimates relative camera motion. It then projects the target frame into the
source frame. Frozen RAFT-Small provides a second flow estimate. The difference between
the two flows is passed to the TTC model as a geometric-consistency feature. ROI alignment
samplesafixed7×7gridforeacheligibleobject.
| 2.5.3 Model | Training |     | and TTC | Regression |     |     |     |
| ----------- | -------- | --- | ------- | ---------- | --- | --- | --- |
Stage A trains the depth and pose components with photometric reconstruction, edge-aware
smoothness,andgeometricconsistency. AsharedResNet-18encoderandU-Net-styledecoder
predict inverse depth. PoseNet predicts the six-degree-of-freedom transform. Stage B adapts
therepresentationtometricTTClabels. ThedenseTTCheadusestheboundedoutputdefined
in Section 2.2. AdamW updates the trainable parameters. The controlled comparison changes
thegeometric-consistencytreatmentwhilekeepingtheremainingprotocolfixed.
| 2.5.4 Performance |     | Evaluation |     | and Statistical | Analysis |     |     |
| ----------------- | --- | ---------- | --- | --------------- | -------- | --- | --- |
Continuous predictions can be described with MAE, RMSE, relative TTC error, log error, and
coverage. Thesestandardforecast-errordefinitionsarewrittenforTTCpredictionsbelow[35]:
v
u
|     |     | XN  |        |      | u   | XN      |       |
| --- | --- | --- | ------ | ---- | --- | ------- | ----- |
|     |     | 1   |        |      | 1   |         |       |
|     |     |     | |τˆ −τ | |,   | t   | −τ      |       |
|     | MAE | =   |        | RMSE | =   | (τˆ )2. | (2.8) |
|     |     |     | i      | i    |     | i i     |       |
|     |     | N   |        |      | N   |         |       |
|     |     | i=1 |        |      |     | i=1     |       |
Here, N is the number of valid predictions, τˆ is the predicted TTC, and τ is the target TTC.
|     |     |     |     | i   |     | i   |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
Coverageisreportedwitheveryerrorvalue.
Fortheprimaryevaluation,theheadlinecontinuousmetricisscene-balancedmeanrelative
TTC error. MAE in seconds is used as a supporting measure for the short-TTC bin. The final
Chapter4comparisonfocusesoncontinuouserror,seedvariation,andtarget-TTCranges. This
set matches the verified exports and avoids implying that a regression comparison is already a
completewarning-policyevaluation.
Objects from one scene are correlated. The primary comparison uses a paired scene boot-
strap with 10,000 resamples and a 95% confidence interval [36]. The secondary test is a two-
sided Wilcoxon signed-rank test across paired scene differences [37]. Holm correction [38] is
26

used across declared secondary families. Results are reported across the five standard seeds
[42,123,2024,7,1337]. ErrorvaluesarealwayspairedwithcoverageandROImode.
2.5.5 Visualization and Reporting
Thecompletedreportusestarget-TTCrangeplots,pairedseedplots,andqualitativediagnostics
thatarepresentintheverifiedexports. Trainingcheckpointspreservescalarlosssummariesand
selectedepochs. Acompleteepoch-by-epochloss-curveanalysisisnottreatedasaresultunless
thefullhistoryisavailable. Tablesreportthetarget-cacheaudit,sceneroles,labelbudget,seed
spread, confidence interval, and ROI context. These reports distinguish oracle results from
detector-coupled results and do not treat a successful compilation as evidence of a successful
experiment.
2.6 Conclusion
This chapter introduced the projective geometry, temporal motion, TTC target, ROI supervi-
sion, literature position, software roles and data-analysis pipeline for MonoTTC. It detached
theimageflowfromtheclosingspeedinrealityanddetachedthelearningofStage-Ageometry
from the learning of Stage-B metrics. It also introduced the concept of ”scene-disjoint eval-
uation”, ”label-budget reporting” and ”scene-level statistical analysis”. The boundaries will
enable the description of the implementation as an auditable protocol in Chapter 3, and the
interpretationofresultsinChapter4withouttheintroductionofanyhiddenassumptions.
ThemostcriticalbackgroundresearchisthatTTCisasequenceoftransformationsderived
fromabunchofrelatedvalues. Apictureiscalibrated,thengivesrisetoaray,andtheestimated
depth gives rise to a point on it. The pose links the point with the other camera frame. Object
tracking results in a longitudinal series, the finite difference of the series estimates the closing
speed. Lastly,thetargetfilterconvertstheclosingspeedtoatimevalue. Errorscanchangethe
target and/or input representation at each step. The model score should be used together with
thetargetfilters,thecameramodel,thetemporalintervalandtheROIcontract.
Projectiveequationsalsoshowthefromthelimitationsofself-supervision. Ifapairofdepth
andposeproducesanimage,thenthepaircanprovidearewardforphotometricreconstruction
but the pair is not uniquely metric. The appearance consistency will be separated from the
geometric constraints if there is no texture, reflections, motion, or occlusions. Auto-masking
27

andminimumreprojectionresolvesomeoftheseissues,butdonotprecludeadynamicsceneor
the visibility of the scale. Consistency term adds another relation between the representations.
Itdoesn’tmakethereconstructiongoaltobecomeTTCsupervision.
The treatment of optical flow is similar. RAFT-Small provides a rich motion-image refer-
ence. The depth–pose field is a geometrical reference and is projected. Differences highlight
discrepancies between the two representations. They can include information on motion of
objects, calibration errors, and estimation errors. To keep the residual as a feature instead of
simplyavelocity,providesamorebalancedunderstandingoftheexperiment.
The background review is the research background of the thesis. Previous research pro-
vides good foundations for computing monocular depth, optical flow, and TTC. There is no
assertion that each piece is new in this paper. The key point of the study is the well-designed
formulation of self-supervised geometric phase and label-efficient object TTC phase, as well
asatransparentcomparisonunderafixedresourcebudget. Thesignificanceofthestudyisthe
protocoldefinitionandthedifferenceintheresultsinerror.
The selection of the evaluation concepts above also helps to explain the selection of eval-
uation metrics in Chapter 4. The experiment is protected by the dominance of the crowds on
the average error by scene-balanced relative error. The MAE provides an absolute-time per-
spective of the most urgent range. Seed-level error testifies to the validity of the average at
the seed level. The use case scenarios are identified in target-range summaries. For a modest
effect these perspectives offer a more complete view of the performance than does any single
aggregatemetric.
In chapter 3, these ideas are put into practice. There it tracks the dataset role, target-cache
lineage,eligibility,architecturalconsiderations,stagebreakdownsandstatisticalmethodology.
Then, in Chapter 4, only the finalised v2 evidence is presented, and can be mapped to those
definitions. This argument is very limited. If only partial supervision is provided, consistency
inthegeometrymayhelpthelearnedrepresentation,butitshouldbelimitedtothetarget,ROI,
splitandresourcelimitationsoutlinedinthischapter.
Anotherkeydistinctionbetweenlearningarepresentationandpredictingatargetisthatthe
former involves encoding a representation into the model, while the latter involves mapping
a target onto the model. In Stage A, we are able to learn features that preserve the temporal
information,butdon’tneedtohaveareliablescaleformetricestimationforeveryobject. Stage
BgivesthetaskrelatedinputthatlinksthosefeaturestothelongitudinalTTC.Thisenablesthe
28

methodtobeviablewithalabelbudgetconstraint,butitalsolimitstheabilityofanimprovement
to be solely due to self-supervision. Lastly the comparison is made in the event of a change in
theStage-Aobjective,withtheStage-Bpathunchanged.
It is the same principle when it comes to the auxiliary flow feature. Residuals between
RAFTflowandgeometricflowcanhelprevealmissinginformationineitherofthefields. For
instance, when two disagree, the head can be used to indicate areas which are moving that
cannot be accounted for by a static-scene camera model. But disagreement between the pixels
isnotaprecisemappingofobjectmotion. Interpretationmustbeabletotakeinmorethanone
cause. This is what the methodology is referring to when it says that the residual is an input
feature; this is why the result chapter makes no causal claim that the feature accounts for the
relativevelocitydirectly.
Further,errorsourcesthataresuggestedbythemathematicalbackgroundforfurtherstudies
are exhibited. The errors associated with camera calibration, image resizing, affect the projec-
tion; the errors associated with pose errors affect the geometric flow of the ball; the errors
associated with the depth scale affect the reconstructed point; the errors associated with the
track association and finite-difference intervals affect the closing speed; the errors associated
withROIprojectionaffectthefeaturesoftheimageavailabletotheTTChead;errorsassociated
with the loss and aggregation rule affect which error will be dominant in the score. Coupled
sourceoferrorscanbecontrolledindividually. So,theextensionofthethesisshouldcorrespond
tothechangesinthemodelswiththetargetandtheevaluationaudit.
A similar understanding is found in the literature. The utility of temporal reconstruction in
training geometry in a single camera has been demonstrated by existing techniques, the power
ofdenseflowtocharacterizeimagemotionhasbeendemonstratedbyexistingtechniques,and
theusefulnessofTTCasacontinuousorthresholdquantityhasbeendemonstratedbyexisting
techniques. Thisresearchaffordsanopportunitytoexplicitlycharacterizetheirinterfaceinthe
case of limited supervision. The interface details are included in the ROI contract, the target
cache, the label-budget denominator, the scene-balanced aggregation and the claim boundary.
Interface details determine if two seemingly similar experimental scenarios address the same
question.
Thebackgroundallowsonetoappreciatethesignificanceofaminimaloutcomefortheright
reason. Ifthedifferenceissmall,butthetesthasbeenconductedinacontrolledenvironmentand
indicatesaclearnexttest,thenthedifferenceisnotinsignificant. Now,ifthescenepopulation,
29

targetfilterortheROIsourcewaschanged,evenalargerdifferencewillbedifficulttobelieve.
ThecontrolinthefirstcaseisrecordedinChapter3. Thecurrentevidencepresentedinchapter
4 and assumptions made. Chapter 5 explains the procedures used to determine whether the
differenceobservedisstrongoverawidervarietyofprotocolstobefinished.
30

Chapter 3
Methodology
3.1 Introduction
In this chapter, the approach to develop such a framework, called MonoTTC, for object-level
time-to-contact (TTC) estimation in autonomous driving with a label-efficient method is de-
scribed. Most of the current methods are based on dense metric annotations or static photo-
metric reconstruction. This study instead makes use of two training stages. The first learns
geometry from a video but it does not have TTC labels. The second is a limited supervised
boundedobject-levelTTCregression.
MonoculardepthandTTCsystemsmaylackaccuracyindrivingscenariosinvolvingmov-
ingvehiclesandocclusion. Inaddition3Dsensortracksandcalibratedcameradataareneeded
for metric TTC labels. MonoTTC takes advantage of the photometric reconstruction by self-
supervision and geometrically consistency loss during video pretraining. First a geometry
model is frozen and carried by a frozen RAFT flow field, prior to the small labeled subsets
beingadaptedtoappendtoaboundedTTChead.
Ego forward frame audited target construction, data protocol and roles of data sets are
first introduced. It then explains the temporal frame processing, shared ResNet-18 features,
multi-scale inverse-depth decoding, PoseNet camera tracking and optical-flow residual map-
ping. Later parts discuss the two training stages, the loss functions, ROI-aligned supervision
andstatisticalassessment.
The details are provided for the label-efficient TTC experiment to be reproduced and ex-
tended.
31

3.2 Dataset Description and Protocols
This section details the primary dataset, secondary evaluation benchmarks, sensor modalities,
scene-disjointsplitroles,andtargetcacheauditprotocols.
3.2.1 Primary Dataset: nuScenes v1.0-trainval
The primary benchmark for pretraining and TTC evaluation is nuScenes v1.0-trainval [9].
The dataset comprises 1,000 driving scenes recorded in urban traffic, featuring synchronized
front-camera RGB images (1600 × 900), 32-beam LiDAR, FMCW radar, and high-precision
ego-pose tracking. Front-camera images are resized to 192 × 640 for model input while pre-
servingcalibratedpinholecameraintrinsics.
nuScenes provides 3D bounding box trajectories and calibrated sensor transformation ma-
tricesrequiredtoreconstructmetrictargetsintheego-forwardreferenceframe. Officialtraining
scenesarepartitionedintothreestrictlyscene-disjointsets: ttc_train(467scenesforStage-A
pretrainingandStage-Blabelsubsets),ttc_dev(200scenesfordevelopmentandhyperparam-
eterselection),andlockedttc_final_val(146scenesforfinalvalidation).
Figure 3.1 illustrates the relational metadata structure linking camera samples, sensor cali-
brations,objectannotations,categorytaxonomies,andego-poserecords[39].
32

nuImages schema
Asterisks (*) indicate modifications compared to the nuScenes schema.
|               | Vehicle | Extraction       | Annotation        | Taxonomy    |
| ------------- | ------- | ---------------- | ----------------- | ----------- |
|               | log     | sample*          | surface_ann*      | category    |
| logfile       |         | timestamp        | sample_data_token | name        |
| vehicle       |         | log_token        | category_token    | description |
| date_captured |         | key_camera_token | mask              |             |
location
| calibrated_sensor* |     | sample_data    | object_ann*       | attribute   |
| ------------------ | --- | -------------- | ----------------- | ----------- |
| sensor_token       |     | sample_token   | sample_data_token | name        |
| translation        |     | ego_pose_token | category_token    | description |
calibrated_sensor_token
| rotation |     |     | attribute_tokens |     |
| -------- | --- | --- | ---------------- | --- |
filename
| camera_intrinsic |     |     | bbox |     |
| ---------------- | --- | --- | ---- | --- |
fileformat
| camera_distortion |     | width | mask |     |
| ----------------- | --- | ----- | ---- | --- |
height
timestamp
is_key_frame
next
prev
|          | sensor | ego_pose*   |     |     |
| -------- | ------ | ----------- | --- | --- |
| channel  |        | translation |     |     |
| modality |        | rotation    |     |     |
timestamp
rotation_rate
acceleration
speed
Figure 3.1: Relational metadata schema of nuScenes and nuImages [39]. Sample records link
cameracalibration,objectannotations,categorytaxonomy,andego-posetrackingmetadata.
Table3.1summarizesdatasetcharacteristicsacrosstheprimaryandsecondarybenchmarks.
33

Table3.1: PrimaryandsecondarydatasetsummaryfortheMonoTTCprotocol.
| Attribute | nuScenesv1.0-trainval |     | Secondary | Benchmarks |
| --------- | --------------------- | --- | --------- | ---------- |
(KITTI/BDD100K)
| DatasetName | nuScenesv1.0-trainval |     | KITTIEigenSplit/BDD100K |     |
| ----------- | --------------------- | --- | ----------------------- | --- |
PrimaryModality Front Camera RGB + 3D An- Stereo RGB (KITTI) / Video
|                    | notations |        | Clips(BDD100K)           |     |
| ------------------ | --------- | ------ | ------------------------ | --- |
| RawImageResolution | 1600×900  | pixels | 1242×375(KITTI)/1280×720 |     |
(BDD100K)
| ModelInputResolution | 192×640 | pixels | 192×640 | pixels |
| -------------------- | ------- | ------ | ------- | ------ |
TotalScenes/Videos 1,000drivingscenes 697 test frames (KITTI) /
100,000videos(BDD100K)
SplitPartition 467Train/200Dev/146Val Standard Eigen Split / MOT
TrackingSubset
EligibleTTCRecords 75,683auditedtargetrows LiDAR Depth Ground
|     |     |     | Truth | (KITTI) / Box Proxy |
| --- | --- | --- | ----- | ------------------- |
(BDD100K)
ProtocolRole Pretraining (Stage A), Fine- Depth Evaluation (KITTI) / Un-
|                 | tuning(StageB) |            | labeledPretraining(BDD100K) |     |
| --------------- | -------------- | ---------- | --------------------------- | --- |
| 3.2.2 Secondary | Evaluation     | Benchmarks |                             |     |
Twosecondarybenchmarksevaluatedepthgeneralizationandcross-domainpretraining:
• KITTIEigenSplit: Usedforquantitativemonoculardepthevaluation[21]. KITTIprovides
synchronized stereo RGB pairs and LiDAR depth maps. It is used exclusively to evaluate
Stage-Adepthrepresentations.
• BDD100KVideoDataset: Usedforcross-domainunlabeledvideopretraining[22]. BDD100K
boundingboxexpansionsservestrictlyasanimage-spaceproxybaseline,notasabsolutemet-
ricgroundtruth.
34

| 3.2.3 Authorized | Dataset | Roles |     |     |
| ---------------- | ------- | ----- | --- | --- |
To prevent data leakage, dataset roles are strictly controlled and enforced, as detailed in Ta-
ble3.2.
Table3.2: AuthorizeddatasetroleswithintheMonoTTCprotocol.
| Role | Permitteduse |     |     | Forbiddenuse |
| ---- | ------------ | --- | --- | ------------ |
Stage-A Video Temporal unlabeled video pre- ReadingTTCtargetsortuning
| (ttc_train) | training |     |     | onvalidationscenes |
| ----------- | -------- | --- | --- | ------------------ |
Stage-B Train Declared 25% metric TTC label Modifying scene tokens after
| (ttc_train) | subsets |     |     | observingresults |
| ----------- | ------- | --- | --- | ---------------- |
Stage-B Dev Model checkpoint and hyperpa- Presentingdevmetricsasfinal
| (ttc_dev) | rameterselection |     |     | validationproof |
| --------- | ---------------- | --- | --- | --------------- |
Final Val Locked final evaluation after Repeated tuning or ex-
| (ttc_final_val) | freezingcode |     |     | ploratorytargetinspection |
| --------------- | ------------ | --- | --- | ------------------------- |
KITTIEigenSplit Monoculardepthevaluation Fine-tuning the TTC regres-
sionhead
BDD100KVideos Unlabeledgeometrypretraining Treating box expansions as
metricTTCtargets
| 3.2.4 Audit | Record and | Target-Cache | Provenance |     |
| ----------- | ---------- | ------------ | ---------- | --- |
The target cache is stored in a versioned columnar format and accompanied by a JSON man-
ifest. The manifest records the protocol identifier, source roles, configuration values, target-
construction logic, and a hash for the target artifact. The locked target-manifest hash used by
thethesisis3aee4eb9245a9104. Ahashisnotasubstituteforasemanticaudit,butitprevents
alaterrunfromsilentlyusingadifferentfileunderthesamefilename.
The audited training-scene record contains 75,683 eligible rows before Stage-B subset se-
lection. The split mapping records 467 scenes for ttc_train, 200 scenes for ttc_dev, and
146eligibleofficialvalidationscenesforttc_final_val. Thesecountsdescribetarget-cache
roles, while the forward collision-corridor evaluation covers 831 objects per seed across 87
evaluationscenes.
35

|                  | Table3.3: | Target-cachemanifestprovenancefields. |        |     |          |            |     |
| ---------------- | --------- | ------------------------------------- | ------ | --- | -------- | ---------- | --- |
| Field            |           | Purpose                               |        |     |          |            |     |
| protocol_version |           | Identifies                            | active |     | protocol | definition |     |
(monottc-label-efficient-ttc-v1)
manifest_hash Verifiesintegrityanddetectstargetcachemodification
scene_token Definesscene-disjointgroupingunitforpairedstatistics
sample_token Linkstargetrecordtospecificcameraframeandtimestamp
| instance_token |     | Tracksobjectidentityacrosstemporalsequences |     |     |     |     |     |
| -------------- | --- | ------------------------------------------- | --- | --- | --- | --- | --- |
ego_pose/ calib Storestransformationmatricesfor3D-to-2Dprojection
finite_difference_mode Records finite difference mode (+1 for central, −1 for one-
sided)
| roi_box |     | StoresprojectedboundingboxcoordinatesforROIAlign |     |     |     |     |     |
| ------- | --- | ------------------------------------------------ | --- | --- | --- | --- | --- |
ttc_target/ speed Contains ground-truth TTC value (τ = x/c) and closing
speed
| 3.2.5 Derivation | of Metric | Targets | in Ego-Forward |     | Frame |     |     |
| ---------------- | --------- | ------- | -------------- | --- | ----- | --- | --- |
| (t)              |           |         |                | (t) |       |     |     |
Let P e be the global position of the ego vehicle, P o be the global 3D center of the target
object, and f be the unit vector along the current ego-forward heading in global coordinates.
t
| Longitudinalseparationx | (t)iscomputedas[9]: |     |     |     |     |     |     |
| ----------------------- | ------------------- | --- | --- | --- | --- | --- | --- |
i
fT (t)−P
|     |     | x (t) = | [P  | (t)]. |     |     | (3.1) |
| --- | --- | ------- | --- | ----- | --- | --- | ----- |
|     |     | i       | t o | e     |     |     |       |
Closing speed c (t) is derived via central finite differences when adjacent temporal obser-
i
vationsareavailable[18]:
|     |     | x       | (t+∆t)−x      | (t−∆t) |     |     |       |
| --- | --- | ------- | ------------- | ------ | --- | --- | ----- |
|     |     | −       | i             | i      |     |     |       |
|     |     | c (t) = |               |        | .   |     | (3.2) |
|     |     | i       | (t+∆t)−(t−∆t) |        |     |     |       |
At a boundary, a one-sided difference can be used only when the adjacent interval satisfies the
protocol limit. The target is then τ = x /c . The target extractor rejects a record before this
|     |     | i   | i i |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
divisionwhenthedenominatorisnotfiniteordoesnotexceedtheclosing-speedthreshold.
36

| 3.2.6 Eligibility | Filters and | Rejection | Logic |     |     |
| ----------------- | ----------- | --------- | ----- | --- | --- |
Thefiltersareappliedinafixedordersothattheauditcanexplainwhyacandidatewasrejected.
Thecategorymustbelongtotheconfiguredvehicleclasses. Theobjectmustprojectvisiblyinto
the front camera with a positive clipped ROI. Its forward separation must lie in (1,80] metres,
the closing speed must exceed 0.5 m/s, and the resulting TTC must lie in (0,10] seconds. At
least one lidar or radar point must support the annotation, and the transformed ROI must be
at least 8 × 8 pixels. Non-closing objects are not assigned a ten-second target merely to fill a
regressionbatch.
The rejection reason is as important as the retained row. A candidate can fail because its
category is outside the vehicle set, its timestamp interval is unordered, its projection is behind
the camera, its box is clipped away, its motion is non-closing, its TTC is outside the bound,
its quality support is insufficient, or its transformed ROI is too small. Recording these reasons
makesitpossibletodistinguishadata-availabilityissuefromamodelfailure.
Table3.4: EligibilityfilteringrulesformetricTTCtargetextraction.
| Check | Acceptedcondition |     | Reasonforthecheck |     |     |
| ----- | ----------------- | --- | ----------------- | --- | --- |
Category Motorvehicleclasses Restrictsevaluationtoroadvehicles
Visibility Visibleinfrontcamera Ensuresvalidopticalprojection
| Separation | 1.0 < x | ≤ 80.0m | Excludesextremenear/farrangenoise |     |     |
| ---------- | ------- | ------- | --------------------------------- | --- | --- |
≤
| TemporalInterval | ∆t 1.5s    |     | Preventsfinitedifferencedrift  |     |     |
| ---------------- | ---------- | --- | ------------------------------ | --- | --- |
| ClosingSpeed     | c > 0.5m/s |     | Rejectsstatic/departingobjects |     |     |
TTCTargetRange 0.1 < τ ≤ 10.0s Alignswithboundedpredictionhead
≥
PointCloudSupport 1LiDAR/radarpoint Validates3Dannotationquality
≥ 8×8pixels
| ROIBoxDimensions |     |     | Prevents unstable | ROIAlign | interpola- |
| ---------------- | --- | --- | ----------------- | -------- | ---------- |
tion
| 3.3 Proposed | Workflow | of Methodology |     |     |     |
| ------------ | -------- | -------------- | --- | --- | --- |
Theworkflowbeginswithatemporalimagetriplet(I ,I ,I ). Theframesaretransformed
t−1 t t+1
consistently and passed through the shared geometry modules. The depth and pose branches
supportphotometricreconstructionandprojectedgeometricflow. FrozenRAFT-Smallprovides
37

optical flow for the consistency feature [7]. The selected Stage-A weights are then transferred
toStageB,wherethedenseTTCheadisadaptedwithauditedobjecttargetsandROI-equalized
supervision.
The Stage-A and Stage-B paths are not merged into one label-free claim. Stage A does
not read TTC targets. Stage B is the metric-supervised adaptation stage. Figure3.2 shows this
separationandlabelstheTTCmapasanintermediaterepresentation.
Stage A — self-supervised geometry pretraining
Text
minimum reprojection
ResNet-18 U-Net
L_photo
I(t-1), I(t), I(t+1) T (t → src) geometric flow OF_geo edge-aware
OF_RAFT Text valid-projection masked
Stage B — label-efficient object TTC adaptation
transfer weights
select w ed ei g g h eo ts metry bounded output τ = 0.1 + 9.9·σ(z) proj τ e * c t = e d x / b c oxes L_ttc
3D tracks + ego poses per-ob H je u c b t e m r ean ·
Figure 3.2: Two-stage MonoTTC workflow. Stage A pretrains geometry on temporal video
triplets using photometric, smoothness, and geometric flow-consistency losses. Stage B trans-
fersencoderweightsandadaptsadenseTTCheadunder25%metricsupervision.
The temporal loader returns three float32 tensors in the range [0,1], exact scaled camera
intrinsics and their inverse, source timestamps, scene and sample-data tokens, and transform
metadata. Framesaresampledsequentially. Thetimeintervalistakenfromtimestampsinstead
ofahard-codedframerate. Figure3.3showsoneinspectedtripletwiththemodelinputshape.
38

Figure3.3: Temporalimagetriplet(I ,I ,I )sampledbytheStage-Aloaderwithresolution
t−1 t t+1
192×640.
3.4 Proposed Methodology
The proposed model uses a shared ResNet-18 encoder initialized from ImageNet weights. Its
feature pyramid feeds an inverse-depth decoder, a separate PoseNet, and a TTC head. The
decoderproducessigmoid-activatedinversedepthatmultiplescales. PoseNetreceivesthecur-
rent and source images concatenated along the channel dimension and predicts translation and
axis-anglerotation. Therotationandtranslationareconvertedtoahomogeneoustransform.
ThefrozenRAFT-Smallbranchreceivesthetransformedimagepairthroughthetransform
associated with its loaded torchvision weights. It returns flow in model-input pixels. Forward
and backward flow are available for occlusion diagnostics. RAFT is not fine-tuned in the pri-
marymethod.
The geometric residual is formed by subtracting projected depth-pose flow from RAFT
flow. Thedefaultconsistencymaskisthevalid-projectionmask. Atrimmedlow-residualinlier
mask, a Charbonnier residual with forward-backward occlusion handling, and a dynamic-box
exclusion variant are secondary estimator choices. The trimmed mask is not called semantic
staticsegmentation.
3.4.1 Shared Encoder with Feature Flow
AsharedResNet-18backbone[8]pre-trainedonImageNet[40]isusedinthenetwork. Ittakes
individualRGBimagesofdimension192×640×3. Bysharingoneoftheseencodersamong
the tasks, the number of parameters can be kept small. This design will be able to fit into our
one-GPUmemorylimit.
The architecture of the encoder and the flow of multi-scale features is shown in figure 3.4.
Thefirstblockisa7×7convwith64convfiltersandstride2,withmaxpooling. Thesefeatures
39

areprocessedinfourresiduallayerstages:
• Layer1: 2BasicBlocksthatproduce1/4resolution(48×160)64-channelfeaturemaps(e ).
1
• Layer 2: 2 BasicBlocks that generate 128 channel feature maps (e ) and 1/8 resolution
2
(24×80).
• Layer3: TwoBasicBlocksthatproduce256channelfeaturemaps(e )at1/16scale(12×40).
3
• Layer 4: Two BasicBlocks that output 512 channel feature maps (e ) at 1/32 resolution
4
(6×20).
These hierarchical features are used at the depth decoder during the Stage-A pretraining. The
weightsofthefrozenencoderaremovedtoStageBtoconditionthedenseTTChead.
Layer 1 Layer 2 Layer 3 Layer 4
2 Basic 2 Basic 2 Basic 2 Basic Inverse-Depth
Im RG ag B e 6 s 4 tr f i i d lt e e r 2 s 3 × 3 B 6 l 4 o c c k h s 1 B 2 lo 8 c c k h s 2 B 5 lo 6 c c k h s 5 B 1 lo 2 c c k h s outputs L f a ro ye m r 4 Layer 1 – Decoder
Figure 3.4: Shared feature encoder architecture used in ResNet-18. Four stages of residual
layers take single RGB input frames (192 × 640). The network outputs multi-scale feature
maps(e ,e ,e ,e )with64,128,256,and512channels.
1 2 3 4
3.4.2 Inverse-Depth Decoder
Weuseaninverse-depthdecoder,whichisbasedonaU-Netupsamplingarchitecturewithskip
connections [2, 41]. Contains very fine spatial features from the encoder and deep semantic
features.
Thefourmulti-scaledecodingstagesaredescribedindetailinfigure3.5:
• Stage 1: Bilinearly interpolates e features by 2× to upsample, concatenates them with e
4 3
skipfeatures,andapplies3×3convolutions(256channels).
• Stage2: UpsamplesStage1featuresby2×,concatenateswithe skipfeatures,andprocesses
2
with3×3convolutions(128channels).
40

UpsamplesStage2featuresby2×,concatenateswithe
| • Stage3: |     |     |     | skipfeatures,andprocesses |     |
| --------- | --- | --- | --- | ------------------------- | --- |
1
with3×3convolutions(64channels).
• Stage4: UpsamplesStage3featuresby2×andapplies3×3convolutions(32channels).
|     |     | ∈   |     |     | ×   |
| --- | --- | --- | --- | --- | --- |
The normalized inverse depth v(p) (0,1) is then obtained by a last final 3 3 conv with
sigmoid activation. The network has the inverse depth to metric depth conversion function of
theformD(p) = 1/(a·v(p)+b). Theparametersaandblimittherangeofthemetricdepthto
[0.1,100.0] metres. Multi-scale depth predictions enable calculation of the photometric losses
atfourdifferentresolutions.
|     |     | Decoder Stage 1 |     | Decoder Stage 2 |     |
| --- | --- | --------------- | --- | --------------- | --- |
multi-scale
|     |                 | Upsample    | Conv + ReLU     | Upsample    | Conv + ReLU |
| --- | --------------- | ----------- | --------------- | ----------- | ----------- |
|     |                 | ×2 bilinear | 3×3, 256 ch     | ×2 bilinear | 3×3, 128 ch |
|     | Decoder Stage 3 |             | Decoder Stage 4 |             |             |
|     | Upsample        | Conv + ReLU | Upsample        | Conv + ReLU |             |
|     | ×2 bilinear     | 3×3, 64 ch  | ×2 bilinear     | 3×3, 32 ch  |             |
1×H×W
2×
Figure 3.5: The inverse-depth decoder pipeline at multi-scale. Upsampling blocks employ
bilinear interpolation, skip connections from ResNet-18 and3×3 convolutions (256, 128, 64,
32channels)togenerateasinglechannelinversedepthmaps.
| 3.4.3 | Construction | of PoseNet | and Transform |     |     |
| ----- | ------------ | ---------- | ------------- | --- | --- |
PoseNet[15]predictstherelative6-DoFcameraposeforpairsofconsecutivevideoframes. It
workswithoutadditionalcalibrationofthesensorsnorIMUtrackingduringtraining.
Figure 3.6 shows the pose estimation pipeline. PoseNet is fed with a concatenation of two
frames(6×192×640)astargetframeI
|     |     |     | andsourceframeI | . Theconvolutionallayerslearn |     |
| --- | --- | --- | --------------- | ----------------------------- | --- |
|     |     |     | t               | t+k                           |     |
41

jointspatiotemporalmotionfeatures,andoutputa512dimensionalvector. Thefullyconnected
| outputlayersregressa6-DoFvectorx |     | = [t,r]  | ∈ R6:  |       |       |
| -------------------------------- | --- | -------- | ------ | ----- | ----- |
|                                  |     | )T,      |        | )T.   |       |
|                                  | t = | (t ,t ,t | r = (r | ,r ,r | (3.3) |
|                                  |     | x y z    | x      | y z   |       |
Here,tisa3Dtranslation,andrisa3Daxis-anglerotation.
The Rodrigues’ formula [42] takes an axis-angle vector r, and transforms it into a rotation
∈
matrix R SO(3) [43]. The rigid homogeneous transform of the camera from time t to
t→src
| thesourceisT | ∈ SE(3) obtainedbycombiningR |     |       | ,andt. |     |
| ------------ | ---------------------------- | --- | ----- | ------ | --- |
|              | t→src                        |     | t→src |        |     |
2 3
R t
4 t→src 5
|     |     | T = |     | .   | (3.4) |
| --- | --- | --- | --- | --- | ----- |
t→src
0T
1
PoseNet is not dependent on the depth decoder. This isolation guarantees that pose errors and
deptherrorswillbeseparateinviewsynthesisandopticalflowprojection.
| Input Frames |     | Feature Extraction & Regression |     |     |     |
| ------------ | --- | ------------------------------- | --- | --- | --- |
target view
|     |     | conv feature | 512-d vector |     |     |
| --- | --- | ------------ | ------------ | --- | --- |
maps
Translation (3) + Rotation (3)
source view
Figure 3.6: Figure 6-DoF PoseNet camera pose estimation pipeline. A sequence of temporal
RGBframes(6×192×640)isfedintotheconvolutionalfeaturelayersanda512dimensional
bottleneck,whichregress3Dtranslationtandrotationr.
| 3.4.4 Frozen | RAFT-Small | Reference |     |     |     |
| ------------ | ---------- | --------- | --- | --- | --- |
MonoTTC adopts an external dense optical flow reference (frozen RAFT-Small network) [7].
RAFT offers very rich flow estimates on a pixel level without introducing trainable flow pa-
rametersintoourmodel.
TheRAFTopticalflowpipelineisshowninfigure3.7. Thesizeoftheprocessedconsecu-
tiveframesisI andI (H ×W ×3). Itiscomprisedoffourmajorcomponents,namely:
t t+1
• Feature Encoder: Extracts multi-scale feature maps from both the input frames with the
sameCNNparameters.
42

| • ContextEncoder: | OnlyusesthecontextfeaturesfromI |     | .   |     |
| ----------------- | ------------------------------- | --- | --- | --- |
t
• CorrelationVolume: Computesadot-productcorrelationvolumebetweenallpairsoffeature
maps.
• Recurrent GRU Update Block: iteratively update the flow estimates and output the dense
| opticalflowOF | ∈ RH×W×2. |     |     |     |
| ------------- | --------- | --- | --- | --- |
RAFT
RAFT-Small is totally frozen during training (with torchvision RAFT_Small_Weights). It
serves as a ”static” visual motion oracle. The geometric flow residual field which is used in
L isobtainedbysubtractingtheprojecteddepth-poseflowOF fromOF .
| consist      |                 |             | geo | RAFT |
| ------------ | --------------- | ----------- | --- | ---- |
| Input Frames | Encoding        |             |     |      |
| Frame I(t)   | Feature Encoder | Correlation |     |      |
Volume
| H x W x 3 | shared weights | all-pairs matching |     |     |
| --------- | -------------- | ------------------ | --- | --- |
Dense Optical
Flow
H x W x 2
Frame I(t+1) Context Encoder
H x W x 3 from I(t) only
Figure 3.7: Frozen RAFT-Small Optical Flow Reference Architecture. Adjacent RGB frames
are fed to shared feature encoders, and a context encoder along with a correlation volume are
fedtoarecurrentGRUblocktoestimatedense2Dopticalflow.
| 3.4.5 Dense TTC | Head |     |     |     |
| --------------- | ---- | --- | --- | --- |
The dense TTC head provides scalar time to contact (STTC) candidate predictions throughout
the image plane. It is a fusion based on fine depth representations and optical flow motion
residualfeatures.
ThedensearchitectureforTTCheadisshowninFigure3.8. Thehead’smovementfollows
foursteps:
• Input Concatenation: Concatenates the fine-scale depth features from Stage A with the
−OF
| geometricflowresidualfeatures(OF |     | ).  |     |     |
| -------------------------------- | --- | --- | --- | --- |
RAFT geo
Performsjointfeaturesusing3×3convolutions(sequentially)with
• ConvolutionalBlocks:
ReLUactivation.
43

• Projection Layer: Projects feature channels to a raw scalar logit map z(p) by using a 1×1
convolution.
• ActivationandScaling: Scalespredictionstobewithintherangeof[0.1,10.0]secondswith
theuseofsigmoidactivation:
τˆ(p) = τ +(τ −τ )·σ(z(p)) = 0.1+9.9·σ(z(p)). (3.5)
min max min
The output τˆ(p) is a dense intermediate representation. In stage B, the grid points within the
bounding boxes of the projected objects are downsampled 7×7 (roi_align) [19]. This allows
toobtaintheobject-levelTTCpredictionτˆ forHuberlosssupervision.
i
Inputs
TTC Decoder Head
Depth Features
Con F c e a a te tu n r a e tion Conv Block Conv Block 1×1 Conv Dense TTC Map
Flow Residual
Features
Activation & Scaling
TTC = 0.1 + 9.9·σ(z) Sigmoid
Figure 3.8: The dense TTC estimation network architecture. Decoder depth features and flow
residual features are then merged together, processed by 3 × 3 convolutions and clipped by a
clippedsigmoidtogenerateadenseTTCmap.
3.4.6 Data Pre-processing
RGBimagesaretransformedtothecommonmodelresolutionof192×640. Thesamegeometric
transformisappliedtoallframesinatriplet,andthecameraintrinsicsarerescaledafterresizing
or cropping. The loader records timestamps and tokens so that a prediction can be paired with
itssourcesceneandobject.
Target construction uses the current ego rotation for all positions in the finite difference. It
keeps only finite, ordered intervals and closing objects. Empty or invalid projected ROIs are
rejectedbeforeROIalignment. Non-closingobjectsremainseparatenegativeexamplesforany
futurethreshold-riskclassificationanalysisandarenotgivenanarbitraryregressiontarget.
44

| 3.4.7 Stage-A | Geometry |     | Pretraining |     |     |     |     |     |     |
| ------------- | -------- | --- | ----------- | --- | --- | --- | --- | --- | --- |
StageAminimizesthefollowingthesis-definedcompositeobjective. Itsphotometricandsmooth-
nesstermsfollowself-supervisedmonocular-depthtraining,whileitsconsistencytermusesthe
frozen-flowreferencedescribedbyRAFT[2,7]:
|     |     | L   | = L     | +λ  | L      | +λ L      | .   |     | (3.6) |
| --- | --- | --- | ------- | --- | ------ | --------- | --- | --- | ----- |
|     |     |     | A photo | s   | smooth | c consist |     |     |       |
Inthisobjectivefunction,L representsthephotometricreprojectionloss[2],L denotes
|     |     | photo |     |     |     |     |     | smooth |     |
| --- | --- | ----- | --- | --- | --- | --- | --- | ------ | --- |
the edge-aware inverse-depth smoothness loss, L is the geometric flow-consistency loss,
consist
| andλ = 0.001,λ | = 0.01 | arelossweightingfactors. |     |     |     |     |     |     |     |
| -------------- | ------ | ------------------------ | --- | --- | --- | --- | --- | --- | --- |
| s              | c      |                          |     |     |     |     |     |     |     |
The photometric term uses SSIM [44] and L1 error, minimum reprojection over the pre-
vious and next frames, valid warps, and auto-masking, following established self-supervised
monocular-depth practice [2]. The smoothness term is edge-aware and mean-normalized. The
consistencytermcompares RAFTflow [7]withprojected geometricflow onvalid pixels. The
primary ablation removes the complete consistency term while keeping the other components
unchanged.
×
The default Stage-A training configuration uses image size 192 640, batch size 8, three
frames, AdamW optimizer [45, 46], mixed precision [47], gradient clipping at 1.0, 20 epochs,
learning rate 10−4, cosine scheduling [48], and one warm-up epoch. Exact numeric values
remainsubjecttodevelopment-settuningundertheprotocol.
| 3.4.7.1 PhotometricReconstruction |     |     |     |     |     |     |     |     |     |
| --------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
ForasourceframeI warpedintothetargetframeI ,theper-pixelphotometricerrorpe(I ,I )
|     | s   |     |     |     | t   |     |     |     | t s→t |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- |
combinesstructuralsimilarityandabsolutepixelerror[2,44]:
1−SSIM(I
|     |         |         |     |     | ,I ) |          |     |       |       |
| --- | ------- | ------- | --- | --- | ---- | -------- | --- | ----- | ----- |
|     |         |         |     | t   | s→t  | +(1−α)∥I |     | −I ∥  |       |
|     | pe(I ,I | s→t ) = | α   |     |      |          |     | s→t , | (3.7) |
|     | t       |         |     | 2   |      |          | t   | 1     |       |
Here, SSIM(·) denotes the structural similarity index [44], ∥·∥ is the L1 norm, and α = 0.85
1
balances SSIM and L1 terms. The target uses the minimum valid reprojection across previous
and next source frames. Auto-masking removes pixels where identity reconstruction yields a
smallererrorthanmotion-basedreconstruction.
45

| 3.4.7.2 Edge-AwareSmoothness |     |     |     |     |     |     |     |     |     |     |     |
| ---------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
regularizespredictedinversedepthv∗(p)usingimage
Theinverse-depthsmoothnesslossL
smooth
colorgradientsasedgeweights[2]:
|     |     |     | X(cid:0) |     |     |     |     |     |     | (cid:1) |     |
| --- | --- | --- | -------- | --- | --- | --- | --- | --- | --- | ------- | --- |
1
|     |        |     |     | |∂  | ∗ (p)|e −∥∂xIt(p)∥ | +|∂ |     | ∗ (p)|e | −∥∂yIt(p)∥ |     |       |
| --- | ------ | --- | --- | --- | ------------------ | --- | --- | ------- | ---------- | --- | ----- |
|     | L      | =   |     | v   |                    |     | v   |         |            | .   | (3.8) |
|     | smooth |     | |Ω| | x   |                    |     | y   |         |            |     |       |
p∈Ω
In this equation, v∗(p) = v(p)/v¯represents mean-normalized inverse depth at pixel p, Ω is the
image spatial domain, and ∂ ,∂ denote horizontal and vertical partial image derivatives. The
|     |     |     | x   | y   |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
exponentialweighte−∥∂It ∥ suppressesdepthsmoothingacrosssharpobjectboundaries.
| 3.4.7.3 GeometricConsistency |     |     |     |     |     |     |     |     |     |     |     |
| ---------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
The geometric consistency loss L is a thesis-defined adaptation of the optical-flow and
consist
depth–posesignalsdescribedbyRAFTandMonoDepth2[7,2]:
P
|     |     |         |     |     | M(p)∥OF | (p)−OF |     | (p)∥ |     |     |       |
| --- | --- | ------- | --- | --- | ------- | ------ | --- | ---- | --- | --- | ----- |
|     |     |         |     | p∈Ω | PRAFT   |        |     | geo  | 1   |     |       |
|     |     | L       | =   |     |         |        |     |      | .   |     | (3.9) |
|     |     | consist |     |     | 2       | M(p)   |     |      |     |     |       |
p∈Ω
In this formulation, OF (p) is optical flow from frozen RAFT-Small [7], OF (p) is pro-
|     |     | RAFT |     |     |     |     |     |     |     | geo |     |
| --- | --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
jected depth-pose flow, M(p) ∈ {0,1} is the valid geometric projection mask, and Ω is the
imagepixeldomain.
| 3.4.7.4 TreatmentandBaselineObjectives |     |     |     |     |     |     |     |     |     |     |     |
| -------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Thebaselineandtreatmentobjectivesbelowarethesis-definedablationvariantsbuiltfromthe
precedingself-supervisedcomponents[2,7]:
|     |     |     | L     | = L   | +λ L     | ,   |           |     |     |     | (3.10) |
| --- | --- | --- | ----- | ----- | -------- | --- | --------- | --- | --- | --- | ------ |
|     |     |     | base  | photo | s smooth |     |           |     |     |     |        |
|     |     |     | L     | = L   | +λ L     | +λ  | L         | .   |     |     | (3.11) |
|     |     |     | treat | photo | s smooth |     | c consist |     |     |     |        |
Here,L isolatespureself-superviseddepth-posegeometrypretraining,whereasL incor-
| base                                            |     |     |     |     |     |     |     |     |     |     | treat |
| ----------------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- |
| poratestheadditionalflow-consistencyconstraintλ |     |     |     |     |     | L   | .   |     |     |     |       |
c consist
| 3.4.8 Stage-B |     | Label-Efficient |     |     | TTC Adaptation |     |     |     |     |     |     |
| ------------- | --- | --------------- | --- | --- | -------------- | --- | --- | --- | --- | --- | --- |
StageBbeginsfromaselectedStage-Acheckpoint. Theprimaryprotocolfreezestheencoder,
depthdecoder,PoseNet,andRAFT,andtrainstheTTCheadonthedeclaredTTClabelbudget.
46

× 10−5,
The default Stage-B configuration uses 10 epochs, learning rate 5 cosine scheduling,
onewarm-upepoch,andtheROI-equalizedHuberloss[20].
ThedenseTTCmapisconvertedtoboundedsecondsusingτˆ = 0.1+9.9 sigmoid(z). For
eachobject,theprojectedROIispooledwithroi_align[19]ata7×7grid.
More explicitly, for aligned grid R of object i, the following average-pooling step is the
i
thesisimplementationofthealignedROIrepresentation[19]:
X
1
|     |     | τˆ = | τˆ . | (3.12) |
| --- | --- | ---- | ---- | ------ |
|     |     | i    | i,p  |        |
49
p∈Ri
Here,τˆ representsdensepredictedTTCatgridcellpinR ,andτˆ istheobject-levelprediction.
| i,p                       |     |                                   | i i |     |
| ------------------------- | --- | --------------------------------- | --- | --- |
| Theobject-levelHuberlossL |     | usesthelossintroducedbyHuber[20]: |     |     |
TTC
XN
1 obj
−τ
|     | L =   | H (τˆ | ), δ = 1.0. | (3.13) |
| --- | ----- | ----- | ----------- | ------ |
|     | TTC N | δ     | i i         |        |
obj
i=1
Here,N isthenumberofvalidobjectROIsinthebatch,τ isthemetricTTCtarget,andH (·)
| obj |     |     | i   | δ   |
| --- | --- | --- | --- | --- |
is the Huber loss with threshold δ = 1.0s [20]. The 49 grid values are averaged before the
| objectlossesareaveraged. | Eachobjectreceivesthesameweight. |     |     |     |
| ------------------------ | -------------------------------- | --- | --- | --- |
47

τᵢ
Text
Figure 3.9: ROI-aligned TTC loss contract. Dense TTC predictions are pooled over a 7 × 7
gridperobject,averaged,andsupervisedwithROI-equalizedHuberloss.
3.4.9 Training Configuration
Table 3.5 records the principal configuration family. Values that define the primary protocol
arekeptdistinctfromoptionsthatwereavailableincodebutnotreportedasseparateresults.
48

|              | Table3.5: | PrincipalMonoTTCtrainingconfigurationanditsrole. |       |                                |     |     |     |     |
| ------------ | --------- | ------------------------------------------------ | ----- | ------------------------------ | --- | --- | --- | --- |
| Parameter    |           | Principalsetting                                 |       | Reasonorboundary               |     |     |     |     |
| Inputtriplet |           | (I ,I                                            | ,I )  | Providestemporalcontextforview |     |     |     |     |
|              |           | t−1                                              | t t+1 |                                |     |     |     |     |
synthesis.
192×640
| Imagesize |     |     |     | Fits the | single-GPU | design |     | and is |
| --------- | --- | --- | --- | -------- | ---------- | ------ | --- | ------ |
sharedbythetransformedtriplet.
| Stage-Aoptimizer |     | AdamW |     | Optimizes | geometry |     | representa- |     |
| ---------------- | --- | ----- | --- | --------- | -------- | --- | ----------- | --- |
tion;checkpointstateissaved.
| Stage-Alearningrate |     | 10−4 |     | Principal | starting | value; | selection |     |
| ------------------- | --- | ---- | --- | --------- | -------- | ------ | --------- | --- |
mustremaindevelopment-scoped.
Stage-Aschedule Cosine with one warm- Reducesabruptearlyupdates.
upepoch
Stage-Anominalduration 20epochs A protocol default, not evidence
thatallrunsconverged.
| Stage-Blearningrate |     | 5×10−5 |     | Adapts | the TTC | head | from | the se- |
| ------------------- | --- | ------ | --- | ------ | ------- | ---- | ---- | ------- |
lectedgeometrycheckpoint.
| Stage-Bnominalduration |     | 10epochs |     | Primaryconfigurationfamily. |     |         |        |     |
| ---------------------- | --- | -------- | --- | --------------------------- | --- | ------- | ------ | --- |
| Gradientclipping       |     | 1.0      |     | Limits extreme              |     | updates | during | ge- |
ometrytraining.
| TTCbounds |     | (0.1,10] | s   | Matches | target | range and | bounded |     |
| --------- | --- | -------- | --- | ------- | ------ | --------- | ------- | --- |
denseoutput.
| ROIpooling |     | 7×7roi_align |     | Converts | dense | values | into | equal- |
| ---------- | --- | ------------ | --- | -------- | ----- | ------ | ---- | ------ |
izedobjectsupervision.
Seeds [42,123,2024,7,1337] Fixed paired seed set for the com-
pletedcomparisons.
| 3.4.10 | Experimental | Setup and | Evaluation | Protocol |     |     |     |     |
| ------ | ------------ | --------- | ---------- | -------- | --- | --- | --- | --- |
The primary comparison is between ssl_photo_smooth and ssl_photo_smooth_consist.
Thetwovariantsusethesamesceneroles,inputprotocol,labelbudget,seeds,checkpointrule,
and evaluation implementation. The consistency term is the intended one-component differ-
49

ence. Thestandardseedsetis[42,123,2024,7,1337].
The evaluation reports oracle ROI and detected ROI modes separately. Oracle mode uses
projected nuScenes annotation boxes. Detected mode uses a frozen detector selected onttc .
dev
Error is reported with coverage. The metric library includes MAE, RMSE, relative TTC error,
logerror,andoptionalriskdiagnostics. Fortheprimaryheadlineresult,reportingisfocusedon
scene-balanced mean relative TTC error, short-TTC MAE, target-range summaries, and five-
seedvariation. TherationaleforthisfocusedsetisgiveninChapter4.
The primary statistical test uses paired scene bootstrap resampling with 10,000 resamples
and a 95% confidence interval, following the general resampling logic of Efron [36]. A two-
sided Wilcoxon signed-rank test is secondary [37]. The final evaluation path reads the official
validationrole only after configuration and thresholdchoices are frozen. Checkpoints, caches,
andmanifestsrecordprotocol,split,target,andsourcehashes.
3.4.11 Evaluation Units and Metrics
The scene is the principal resampling unit because objects within a scene share camera condi-
tions,roadlayout,illumination,andtemporalcontext. Theobjectistheprincipalregressionunit
because the target is defined per visible road user. A complete result therefore reports both the
numberofscenesandthenumberofevaluatedobjects. Meanscene-balancederroriscalculated
by first summarising eligible objects within each scene and then averaging across scenes, so a
crowdedscenedoesnotdominatetheaverage.
Forpredictionsτˆ andtargetsτ ,thereportedcontinuousevaluationquantitiesusestandard
i i
forecast-errordefinitions,adaptedheretoTTCvalues[35,2]:
XN
1
MAE = |τˆ −τ |, (3.14)
i i
N
v i=1
u
u XN
t 1
RMSE = (τˆ −τ )2, (3.15)
i i
N
i=1
1
XN
|τˆ −τ |
i i
e = , (3.16)
rel
N τ
i
i=1
XN
1
e = |log(τˆ)−log(τ )|. (3.17)
log i i
N
i=1
In these metric definitions, MAE is Mean Absolute Error in seconds, RMSE is Root Mean
Squared Error in seconds, e is Mean Relative TTC Error (primary headline metric), e is
rel log
50

Mean Absolute Log Error, and N is the total count of valid predicted objects. Coverage is the
fraction of eligible targets for which the selected ROI and model produce a valid prediction.
Critical-risk metrics are evaluated with a declared threshold such as τ ≤ 2 s, but a threshold
scoreisnotadeploymentguarantee. Thedevelopmentsplitistheonlyplacewhereathreshold
orcheckpointmaybeselected.
3.4.12 Paired Bootstrap and Wilcoxon Procedure
Let
m(b)
and
m(t)
denote the baseline and treatment scene summaries. The paired difference
s s
for scene s is d = m(t) − m(b) . Each bootstrap draw samples complete scene indices with
s s s
replacement, computes the mean of the sampledd , and stores the result. The 2.5th and 97.5th
s
percentilesformtheconfidenceinterval. Thisprocedurepreservesthepairingbetweenvariants
andthewithin-scenegroupingofobjects.
TheWilcoxonsigned-ranktestisasecondarycheckonthenon-zeropairedscenedifferences
[37]. It is not used to turn a small effect into a deployment claim, and it does not remove the
need to report the magnitude and spread. If several secondary analyses are formally tested, a
Holmcorrection[38]isappliedtothedeclaredfamilybeforetheresultsareseen.
Checkpoint and Resume Contract: A resumable experiment saves the stage, epoch, global
step, and seed, model parameters, optimizer state, scheduler state, the version of the protocol,
the split identifier, the target manifest hash, and the best development metric. Resuming will
load the same protocol and target identifiers. No checkpoint or a different checkpoint is a stop
condition, it does not invite to silently restart with a new seed. This rule safeguards the inter-
pretationofamulti-seedcomparisonandkeepsfullcompute.
Thenexttworulesareforfailure: Stoppingorinvalidmarkingofoutputifthetargetcache
hash does not match, one of the scenes tokens is in an incompatible role, one of the models’
components is missing, or if a loss is non-finite, or if the evaluation configuration does not
match the declared one. The held-out evaluation role is read only once the model, checkpoint,
threshold, and protocol selection is done. While code structure can be verified using a local
syntaxcheckorPDFcompilationorstaticmappingcheck,noneofthesecheckscanreplacean
activeruntimeevidenceaudit.
51

3.4.13 Reproducibility Checklist
Prior to including a result in the thesis, the experiment record will contain the version of the
protocol, the hash of the manifest and the split hash, as well as the scenes and seeds. The
experimentrecordincludestheselectedcheckpointandtherationalebehindtheselectionofthe
checkpoint. ROI mode, coverage criterion, aggregation method, as well as evidence status are
noted. The figure and the table should be from the same export. See Appendix E for more
informationinthechecklist.
There are some limitations of method before training. The quality of the target extractor is
asgoodastrackedannotations,calibration,ego-pose,temporalassociationandconstantveloc-
ity approximation. The geometry learner will be unable to handle dynamic objects, occlusion,
variations in exposure, and invalid projections. Calibrated pinhole projection, usable temporal
association,andpairingatscenelevelareotherbackgroundequationsusedfortheunitofgen-
eralization. The TTC head can be an effective representation for oracle boxes and at the same
time, it can be sensitive to detector failures. Limited model size and variations in the protocol
duetooneGPUarchitecture. Thisisoneofthedrawbacksofthemethod.
3.5 Conclusion
In this chapter, the entire methodology for label-efficient estimation of the time-to-contact has
been explained. The thesis conducted a dataset audit of nuScenes dataset roles to prevent any
possible data leakage. The targets for the ground truth TTC were obtained in the ego-forward
frame. There is physical eligibility filtering – this is called Target generation – which re-
moves invalid bounding boxes. The two-stage method consists of geometric self-supervised
pre-trainingandaspecialTTChead.
AtstageAthenetworkistrainedwiththeunlabeledvideoinformationondepthandvisual
flow. To remove dynamic motion, use a Geometric Consistency Loss. ROI-normalized loss
is used by the dense head to estimate the metric TTC in Stage B. The formulation is able to
maintain that the unlabeled video pre-training remains independent of TTC supervision. Fur-
thermore,thereisanoticeabledifferencebetweentheoracleROIregressionandtheend-to-end
detectedROIboundingboxes.
Toensurethattheresultsoftheempiricalevaluationscanbereproduced,theseareisolated
with regards to the main benchmark setups using strict stopping rules and checksum manifest.
52

Aprotocolbias-freereportoftheperformancemeasureswillbeprovidedinChapter4.
53

Chapter 4
Result Analysis and Discussion
4.1 Introduction
ThischaptershowstheoutcomeofthecoreevaluationofMonoTTCwithafixedbudgetof25
Exploratory material that has been performed outside of the corridor (or with threshold
dependentmetrics)isnotcountedasheadlineevidence. Theoperatingpointsusedinthedevel-
opment of threshold dependent metrics changed little. If they have been included, this would
implythattheresultissomewhatlargerormoreconclusivethanthatreportedinthemaincon-
tinuousassessment.
The numbers are also explained in this chapter. The difference between the two objectives
ofStageAisgiveninthetables. Thesizeofthisdifferenceandwhenitstopsaregiven. There
aremultiplesourcesofuncertaintyintheestimationofTTCusingmonocularvision. Reported
errorsareaffectedbyrepresentation,targetcache,projectedregion,temporalinterval,andscene
population.
The primary evaluation contract is the same for both the baseline and the treatment. The
same forward corridor, budget, seed list, ROI mode and continuous regression target are used
for both. This “double” method reduces some of the potential comparative “noise.” It isn’t
goingtoremoveanyofthe”noise”intheoptimizationprocessortargetitself. Thelowaverage
does not mean that a neutral seed, hard TTC region or unchanged absolute-time error is not
found. Chapter3keepsthesedetailsandallowsnoonepositivesummary.
Thecomparisonfocusesontwofocusedquestions. Itverifieswhetherthelearnedrepresen-
tation is changed based on this protocol under the treatment. It is used to determine the differ-
ence between the modification of seeds and target ranges. It is not a decision to approve/dis-
54

approve the model for an operational warning system. No testing of detector errors, latency,
calibrationoractionstocomeareincludedintheheadlineanalysisandonlyfororacleregions.
4.2 Evaluation Scope
Theevaluationspans87validationscenescontaining831eligibletargetobjectsperseedwithin
the forward collision corridor under Oracle ROI conditions. Using projected ground-truth
bounding boxes isolates feature representation quality from detector-induced errors (such as
missingdetections,falsepositives,boundingboxjitter,orlatency).
Evaluation metrics are extracted from five-seed run exports, paired scene summaries, and
target-TTCrangedistributions. Theprimarymetricisscene-balancedmeanrelativeTTCerror,
which weights each scene equally to prevent crowded scenes from dominating the average.
MeanAbsoluteError(MAE)insecondsmeasuresabsolutedeviation.
4.3 Primary Collision-Corridor Results
4.3.1 Overall Collision-Corridor Comparison
Thescene-balancedmeanrelativeTTCerrorofthephotometric-smoothnessbaselineis0.4131±
0.0186. Incorporatinggeometricflowconsistencyreducesthiserrorto0.3911±0.0178,repre-
sentinga5.33%descriptiverelativereduction:
0.413133−0.391099
×100% = 5.33%. (4.1)
0.413133
Table4.1summarizesheadlinemetricsunderthe25%metricTTClabelbudget.
55

Table4.1: ForwardcollisioncorridorOraclecomparisonundera25%metricTTClabelbudget
(mean±standarddeviationacrossfiveseeds).
Metric Photo–smooth Photo–smooth–consist Treatmentminusbaseline
Scene-Balanced 0.4131±0.0186 0.3911±0.0178 −0.02203
RelativeError
Paired95%CI(87 – – [−0.05378,+0.00893]
scenes)
MAE(seconds) 1.8043 1.8052 +0.0009
PredictionCoverage 95.52% 95.52% 0.00percentagepoints
Table4.1showsamodestreductionintheprimaryrelative-errormeasure. Italsoshowswhy
theclaimmuststaynarrow. Thepairedconfidenceintervalcrosseszero,sotheavailablescene
sample does not establish a reliable overall treatment effect. MAE is almost unchanged. The
twometricsmeasuredifferentthings: scene-balancedrelativeerrorcapturesproportionalerror
within each scene, while MAE measures seconds and responds more to absolute deviations at
longerTTCvalues. Thecomparisonsuggestsasmallshiftinrelativeaccuracy. Itdoesnotshow
abroadchangeinmetricscale.
Thelimitedgainiscredibleforthisproblemsetting. EstimatingmetricTTCfrommonocu-
larvideorequiresdepth,ego-motion,andobject-motioninformationthatisnotuniquelydeter-
minedbytheimagesequence. The25%labelbudgetandtherestrictedcorridorfurtherlimitthe
amount and diversity of direct TTC supervision. The consistency term regularizes the learned
representation, but it does not remove target noise, departures from the constant-velocity as-
sumption, occlusion, or calibration sensitivity. These constraints make a modest average gain
thescientificallyexpectedoutcome.
4.3.2 Five-Seed Variation
Table4.2breaksdownscene-balancedrelativeTTCerroracrossthefiverandomseeds.
56

Table4.2: Scene-balancedrelativeTTCerrorbyrandomseedintheforwardcollisioncorridor.
|     | Seed | Photo–smooth | Photo–smooth–consist |     | Difference |
| --- | ---- | ------------ | -------------------- | --- | ---------- |
−0.0103
|     | 42  | 0.4172 |     | 0.4069 |         |
| --- | --- | ------ | --- | ------ | ------- |
|     | 123 | 0.3822 |     | 0.3838 | +0.0016 |
−0.0670
|     | 2024 | 0.4329 |     | 0.3659 |         |
| --- | ---- | ------ | --- | ------ | ------- |
|     | 7    | 0.4165 |     | 0.4091 | −0.0074 |
|     | 1337 | 0.4168 |     | 0.3898 | −0.0270 |
Theflow-consistencytreatmentachieveslowerrelativeerrorinfouroutoffiveseeds,with
the largest reduction observed in seed 2024 (−0.0670). Seed 123 exhibits a slight increase
(+0.0016). Thisvariancehighlightsthesensitivityofsmall-budgetoptimizationtoinitialization
andbatchsampling.
| 4.3.3 | Urgent TTC | Ranges Error |     |     |     |
| ----- | ---------- | ------------ | --- | --- | --- |
Table 4.3 categorizes performance across target-TTC intervals aggregated over all five seed
runs.
Table4.3: OraclerelativeTTCerrorpartitionedbytarget-TTCrange.
TargetTTC Baselinemean Treatmentmean Baselinemedian Treatmentmedian n
|     | 0–2s  | 1.6501 | 1.3270 | 1.3269 | 0.8822 140   |
| --- | ----- | ------ | ------ | ------ | ------------ |
|     | 2–5s  | 0.4701 | 0.4353 | 0.3864 | 0.3670 1,105 |
|     | 5–10s | 0.2423 | 0.2482 | 0.2141 | 0.2218 2,910 |
Thislargeerrorinthe0–2sregimeisduetothenatureofthemetric,andthedistributionof
values. Relative error is the result of dividing absolute error by the desired TTC. For a target
which is near to zero, the same absolute error will be much bigger. The relative error 1.3270
isnottheabsoluteerror132.70s. Theseproblematicintervalsencompass140aggregatedsam-
ples,andthe5–10sintervalencompasses2,910samples. Intheshorthorizoncase,itisdifficult
becauseoffastclosing,constructionnoiseoftarget,andviolationofconstantvelocityassump-
tion. With the same aggregation (0-2 s), the absolute MAE reduces from 2.1075 s to 1.6826 s
aftervalidation. Areductioninrelativeerrorisequivalenttoareductioninabsoluteerror.
Thistechniqueprovidesreductionofmedianandaveragerelativeerrorsintwomostcritical
regimes,butitisslightlylesseffectiveintheregime5–10s. Itmeansthatthistechniqueisonly
57

so far with regards to the claim. There are regimes that it doesn’t work. This is perhaps be-
causetherisk-basedobjectiveappliesmorepressureofrepresentationfortheshort-TTCregime,
whereas longer-TTC regime relies primarily on uncertainty of scales and motion. This expla-
nationisstillatestableinterpretationofthecurrentexport,astherearenocausalconclusions.
4.3.4 Interpretation and Claim Boundaries
Theempiricalevidencesupportsthefollowingconclusions:
1. Stage-Ageometricflowconsistencyprovidesmodestdescriptiveimprovementsinscene-
balanced relative TTC error and short-range (0–2 s) absolute error under a 25% label
budget.
2. The overall paired 95% confidence interval spans zero, indicating that the overall effect
isnotstatisticallysignificantacrossthe87validationscenes.
3. Headline results evaluate regression within projected Oracle ROIs and do not constitute
end-to-endsafetyorcollision-warningsystemguarantees.
4.4 Conclusion
The main evaluation comparison revealed a descriptive reduction of TTC error across scenes
of5.33
Thisoutcomeisbestviewedasastudyofrepresentation,albeitonethatislimited. Thecon-
sistencytermprovidesthenetworkwithanextrapropertyrelatinglearntgeometryandseenim-
agemotion. Thisrelationshipcanbeusedtostructurefeaturesthatcanbeusedforobject-level
regression. It is not able to provide a missing metric information in the case of an ambiguous
imagesequence. ItcanalsonotfixanimperfectTTCtarget(theprojectedROIthatdoesn’tcon-
tainpixelsoftheusefulobject)andafuturemanoeuvrethatdoesn’tfulfilltheconstant-velocity
assumption. The small average change is consistent with the functioning of the mechanism as
ahelpfulbutnotacompletesolution.
Thethreecomparisonsthatwerekeptprovideanoverallpictureoftheevidence. Theover-
all table indicates a favourable descriptive direction, the paired interval contains zero and the
absolute-time MAE is nearly unchanged. From the seed table, it can be seen that four runs are
improved and one run is slightly increased upwards and that the magnitudes are not uniform.
58

The range table in the TTC has the most unambiguous positive results in the urgent range, and
also exhibits a weak regression for the long-range targets. These results warrant a small next
step: arepetitionofthecomparisonfollowingastrongerprotocol,butwiththesamedefinitions
oftargetandevaluationmeasures.
This has a number of implications. In a future study, there could be even more indepen-
dent scenes and reproduction of the entire label budget curve. No confusion of Oracle and the
detected ROI results. Before reaching a conclusion at the system level the latency, memory
consumption, calibration and detector coverage should be taken into account. In addition, it is
importanttoconsiderwhetherthe”short-TTC”patternremainsstableornotwhenthetemporal
interval is changed, as well as when the definition of the corridor or the target quality filtering
aremodified. Thesearetestsdirectlyonthehypothesesthatareproposedinthischapter.
The chapter concludes with a well-defined claim border. Geometric consistency (with the
documented primary protocol) suggests a small relative reduction in TTC error for the scene
balanced primary protocol, and good short-TTC error behavior for the majority of the pair of
seeds. Theresultsdonotofferastatisticallysignificantoverallimprovementorcalibratedcol-
lision probability or end-to-end safety gain. The mixed result reporting is important to make
thethesisreproducibleandprovideaclearbasisforfutureworktobeconfirmed.
A final note is made about the difference between the relative error measure and the MAE
measure. Relative error is used when the goal is to give each scene the same ’weight’ in the
analysis and when it is needed to compare the errors on different target scales. If the problem
is about the number of seconds off the predicted value is from the target value, then use MAE.
All of these measures provide information relevant to, but not answering the same question.
A procedure could boost the ranking efficiency in scenes in a proportional manner, without
altering the average number of seconds by which the prediction was incorrect. Both statistics
mustbeinterpretedtogether,astheyanswertwodifferentquestions.
Seedvaluesarealsoacheckagainstover-interpretationofthemean. Forinstance,seed2024
givesrisetothebigdecrease,whileseed123givesrisetothelittleincrease. Ifjustthemostef-
fectiverunhadbeenreported,theeffectreportedwouldhavebeenmuchmorenoticeable. Table
5 shows the sensitivity of the optimization procedure. It also suggests a motivation for paired
scene-level uncertainties: Five means are not enough samples of the full driving experience.
Thesizeofthisexperimentallowsvariationtobediscernedbutnoteliminated.
Targetrangeistheobviousfollowupdirectiontopursuefromthisresult. Themostimpor-
59

tant, and loud, interval is short-TTC. It has fewer samples and denominator which magnifies
relative error. This benefit needs to be verified for this interval in the current export, but for
otherintervalsandtargetqualitycriteria. Thelargerintervalisrelatedtoalargersamplesizeand
willbenearlythesamewiththesametreatment. Thesefactssuggestthatfuturedatacollection
anddatalossshouldbebasedonthetargetrangeandnotontheoverallmean.
As a whole, the tables provide the answer to the posed research question according to the
available data. They demonstrate that the consistency treatment can alter the TTC regression
after25
60

Chapter 5
Conclusions and Future Directions
5.1 Introduction
This chapter summerises the MonoTTC research and identify what needs to be done to extend
theconclusionstohaveawiderapplication. Thethesishasinvestigatedthegeometry-awarepre-
trainingofobject-levelTTCfromlittlemetricsupervision. Split,labelbudget,targetdefinition
andevaluationexportshavebeenvalidatedtolimittheconclusions.
Thechapterwillworktowardstworelatedaims. Firstly,itbringstogetherthemethodolog-
ical and empirical results in one answer to the research questions. Secondly, it translates the
identified constraints into a step-wise future-work plan. A future experiment must be able to
be used to solve a problem that can be measured. So to achieve this the priorities below start
off with confirmation of current comparison. Then they progress towards target sensitivity,
detectorcoupling,efficiency,calibration,generalization,andgreatermotion.
The order is deliberate. There isn’t a simple way to fix an undefined target or an evolving
assessment population with more complex modelling. Similarly, a detector coupled system
can’tbeinterpretedwithoutastableoraclereferenceoftheregressioncomponent. Thecurrent
thesissuppliesthatreferenceinaslimmeddownversion. ItdoesNOTprovidethereferenceasa
fulldrivingsystem. Thischaptercontinueswiththesamedistinction,andprovidesinformation
abouthowthestudycanbeexpanded.
The final explanation also distinguishes among an observation, a prediction, and an expla-
nation. The consistency treatment subsequently led to a decrease in the primary relative error,
on average the confidence interval contains the value zero, the absolute MAE is almost unaf-
fected and the long-TTC bin remains unaffected. The following facts are observations. This
61

mightbeduetoRepresentationRegularization,TargetNoise,ScaleAmbiguity,orDistribution
of Short Horizon examples. They are still hypothesis until they can be separated from other
chemicalsbyfurtherexperiments.
The thesis can be considered as having three levels of evidence. Implementation evidence
comprises model, target construction, manifests, and training phases and constitutes a pipeline
that can be reproduced. The five-seed forward-corridor export is a comparative evidence that
shows the differences between two Stage-A objectives, with one protocol declared. Before a
detectorisdeployed,warningevidencewouldhavetobeobtainedthroughoperationalevidence,
including detector coupling, latency, calibration, robustness, and safety outcomes. The current
workisatthefirstlevelandatthesecondleveloffersboundedevidence.
This distinction is a valuable means of establishing a realistic level of performance for the
nextexperiment. Theaimofthenextexperimentistochecktheresultisrobust;thatis,itholds
up at a tougher test. This involves keeping the original definition of the target, documenting
all label budget changes and increasing the coverage of scenes and seed and splitting off any
new ablation system elements from the original ablation. Even if the result is smaller with
these controls, it is still a good result, because it could indicate that the original result was
data-sensitive. Stableresultwouldbealotmoresupportive.
Thesections”Futurework”areorganizedinadependencychain. Generalstatementsshould
beprecededbyconfirmation. Theorderofthetargetsshouldbeincreasedfromtargetsensitiv-
ity to richer motion targets, and oracle and detected ROI studies should be combined prior to
considerationofthesystem-levelaccuracy. Theefficiencyandcalibrationshouldbemeasured
prior to considering the use at operational level. Testing of cross domain should maintain the
evaluationlogicuntilgeneralizationisclaimed. Finally,amotionmodelbasedoneithertempo-
ral or lateral motion should be compared with a target reflecting the new motion models. This
progressionmaintainsaprogressionofmeasurablechangestoeachnewend.
5.2 Summary of Thesis Findings
5.2.1 Two-Stage MonoTTC Framework
MonoTTC decouples self-supervised geometry pretraining on unlabeled driving video (Stage
A)fromtask-specificmetricTTCregressionunderlimitedsupervision(StageB).
• Stage A: Pretrains ResNet-18 inverse-depth and PoseNet camera tracking using temporal
62

nuScenes triplets (I ,I ,I ) with photometric reconstruction, edge-aware smoothness,
t−1 t t+1
and geometric flow-consistency losses relative to a frozen RAFT-Small optical flow refer-
ence.
• Stage B: Adapts the learned features to a bounded dense TTC head supervised by ROI-
equalizedHuberlossonauditedobjecttargets.
5.2.2 Core Empirical Results
Undertheprimary25%metricTTClabelbudgetwithintheforwardcollisioncorridor(|y | ≤
lat
2.5m)across87validationscenes(831objectsperseed,5randomseeds):
• Photometric-smoothness baseline achieves a scene-balanced relative TTC error of 0.4131±
0.0186.
• Flow-consistencytreatmentachievesascene-balancedrelativeTTCerrorof0.3911±0.0178,
representinga5.33%descriptiverelativereduction.
• Paired95%confidenceintervalacross87scenes[−0.05378,+0.00893]spanszero,indicating
thatoverallimprovementsaredescriptivelypositivebutnotstatisticallysignificant.
• OverallMAEremainsvirtuallyunchanged(1.8043 svs1.8052 s).
• Intheurgent0–2sTTCinterval,absoluteMAEimprovesfrom2.1075 sto1.6826 s.
5.2.3 Answers to Research Questions
1. Q1: DoesgeometricflowconsistencyimprovedownstreammetricTTCerror?
Yes. Flow consistency yields a modest 5.33% descriptive reduction in scene-balanced rela-
tiveTTCerrorundera25%labelbudgetwithintheforwardcollisioncorridor.
2. Q2: Howdoesperformancevaryacrossrandomseeds?
Four of five random seeds exhibit lower relative error under the treatment (most notable in
seed2024witha−0.0670errorreduction),whileseed123showsaslightincrease(+0.0016),
underscoringthenecessityofmulti-seedreporting.
3. Q3: Howdoesperformancevaryacrosstarget-TTCranges?
Theflow-consistencytreatmentachievesnoticeablerelativeandabsoluteerrorreductionsin
63

urgent short-horizon ranges (0–2 s and 2–5 s), while longer ranges (5–10 s) remain largely
unaffected.
4. Q4&Q5: Whataretheprimaryscopeboundariesandlimitations?
Headline results rely on constant-velocity target assumptions, oracle projected ROIs, and
nuScenesurbandrivingscenesunderasingle-GPUcomputebudget.
5.3 Methodological Lessons
1. Target Integrity: Target extraction rules (separation boundaries, positive closing speeds,
timestampintervals)areintegraltomodelperformanceandmustbeexplicitlyaudited.
2. Oracle vs. Detected ROIs: Oracle ROIs evaluate feature representation quality, whereas
detectedROIsmeasureend-to-endperceptionsystemperformance. Conflatingthesemasks
trueregressioncapability.
3. Multi-Metric Evaluation: Proportional relative error (e ) and absolute error (MAE) cap-
rel
turedistinctaspectsofperformanceacrossvaryingTTCscalesandmustbereportedtogether.
5.4 Future Research Roadmap
5.4.1 Priority 1: Confirmation Protocol completed
Thenextmoveonthetimelineshouldbea“versioned”confirmationstudywhererelatedchanges
areallrolledupintoasingleprotocol. Itneedstomaintainthedesiredmanifestandsceneroles,
executetheentirenestedlabel-budgetcurveandexecuteadocumenteddevreviewpriortoread-
ing a held-out validation. Each amendment should be a progress file and artifact directory to
ensurethatthecompletedevidenceisstillavailable.
5.4.2 Priority 2: Target sensitivity analysis improvement
Stress test the target in closing speed, time interval, forward distances, minimum ROI size,
annotation quality and collision-corridor width. These analyses should include the number of
rowsretainedorrejected,andthemodificationstothetargetdistribution. Ifreliablemotiondata
64

is available a richer motion target could be compared to the constant velocity target; the new
targetmusthoweverbeauditedseparatelybeforemodelcomparison.
5.4.3 Priority 3: Detector-Coupled Study completed
The next system-level experiment should be performed on a frozen detector/tracker on devel-
opment data. It should identify when objects are matched, report localization error, record
distancecoverage,recordtarget-TTCrangeandreportthenumberofmissedandduplicateob-
jects. These are then to be evaluated using the same TTC head as both oracle and detected
ROIs in order to be able to separate the regression and detector contribution. The end to end
performancestatementofthethesiscouldonlybecompletedafterthisstep.
5.4.3.1 Priority4: MeasureEfficiencyandCalibration
The inference latency, throughput, peak memory usage and energy usage should be measured
and reported on a specified hardware platform. If the risk score is to be used for a threshold
decision, the risk score should be calibrated and reliability diagrams and Brier-type metrics
[49, 50] should be reported on held out data. A model with a lower regression error, but less
well calibrated warnings, could be unsuitable for operational use. The questions of efficiency
andcalibrationarenotquestionsaboutthecurrentarchitecturedescription,butquestionstothe
future.
5.4.4 Priority 5: Test Generalization
The current evidence is related to nuScenes [9]. The target definition of a generalization study
and evaluation logic should be the same as the original study, if at all possible, and should
be explicitly stated which parts of the target cannot be transferred. Video pretraining and/or
qualitativeanalysiscanbecarriedoutbyBDD100K[22]anddepthevaluationcanbeconducted
byKITTI[21]ifthematchingloaderandsplitareconfirmed. NOTE:DONOTsimplyassume
thateitherdatasetisametricTTCgroundtruthbecausetheydohaveboxesorvideo.
5.4.4.1 Priority6: EnableextensionoftheMotionModel
Not all interactions can be expressed in the three-frame design and constant-velocity target. A
temporal TTC head could model the acceleration and braking trends and a lateral-interaction
65

branch could model the cut-ins and cross-traffic. These extensions should be judged at a new
target, in line with the new motion assumptions. The physical limitation would not be solved
byaddingatransformerorrecurrentmodule,andleavingthetargetunchanged.
5.5 Conclusion
In this thesis, we explored self-supervised pretraining on geometry data for monocular time-
to-contact estimation (TTE) with scarce metric supervision. Temporal nuScenes driving video
without TTC labels were used for learning inverse depth and camera pose in stage A. Stage B
usedadensecontinuousTTChead,andonlyalimitedbudgetof25
Empirical results are based on a select study, not an exhaustive collision-warning study.
The runs from paired five-seed were seen to vary from random initializations. The average
was improved by the use of geometric consistency, but not for all of the seeds was it able to
outperform the baseline. The relative error was also the largest for the critical TTC of 0–2 s.
The primary benchmark was based on Oracle object boxes. These details explain why seed
spreads,detectorerrorsshouldbeseparatenumberstoregressionquality.
Thisworksetsawelldefined,traceablereferenceforlabel-efficientmetricTTCestimation.
It splits the physical building of the target machines from the optimisation of the models. It
also prevents mixing up the development evidence with the held-out validation. There are six
priorities that will be addressed in the future, including end-to-end detector coupling, latency
profiling, cross-domain generalization, and richer motion models. The methodology and ap-
pendicesofferarepeatableframeworkforvisualperceptioninautonomousdrivingthatcanbe
usedtomakethemostofdata.
66

| Appendix      | A   |          |     |         |     |
| ------------- | --- | -------- | --- | ------- | --- |
| Supplementary |     | Protocol | and | Failure |     |
Modes
| A.1 Scene-Role | and | Label-Budget | Matrix |     |     |
| -------------- | --- | ------------ | ------ | --- | --- |
The scene-role and label-budget matrix defines the training and evaluation scene-role split as-
signments and supervision limits for MonoTTC. The official validation set (ttc_final_val)
is reserved exclusively for final evaluation after all development choices and hyperparameters
arefrozen.
TableA.1: SceneroleandlabelbudgetmatrixoftheMonoTTCprotocol.
| Role | Scenescope | TTClabelaccess |     | Permitteddecisions |     |
| ---- | ---------- | -------------- | --- | ------------------ | --- |
Stage-AVideo 467 training-role Hidden from Stage- Train temporal geometry
|     | scenes | Aloss |     | representation. |     |
| --- | ------ | ----- | --- | --------------- | --- |
ttc_train 467 training-role Nested 1%, 5%, Fine-tune Stage-B TTC
|     | scenes | 10%, | 25%, 100% | regressionhead. |     |
| --- | ------ | ---- | --------- | --------------- | --- |
budgets
ttc_dev 200 development Unlocked for devel- Hyperparameter tuning,
|     | scenes | opment |     | checkpoint | selection, |
| --- | ------ | ------ | --- | ---------- | ---------- |
andcorridoranalysis.
ttc_final_val 146 validation Lockeduntilchoices Final evidence report in
|     | scenes | arefrozen |     | confirmationruns. |     |
| --- | ------ | --------- | --- | ----------------- | --- |
67

The label budget specifies the proportion of metric targets available during Stage-B fine-
tuning. Scene token boundaries, selection seeds, and subset manifest hashes are strictly main-
tainedacrossbudgetlevels.
A.2 Implementation Failure Modes
Duringpipelineexecution,thefollowingerrorconditionsaremonitoredasimplementationfail-
uremodes:
InvalidProjection
Geometry points project behind the camera or fall outside image boundaries. In-
validpixelsaremaskedoutratherthancontributingtolosscalculations.
EmptyROIBatch
NovalidtargetobjectROIreachestheROIAlignoperation. Adifferentiablezero
lossisreturned,andtheemptybatchcountislogged.
Non-FiniteLoss
Loss values evaluate to NaN or Infinity due to numerical instability. Training
executionhaltsimmediatelyandtherunismarkedinvalid.
HashMismatch
Target cache or split manifest hashes differ from active protocol specifications.
Executionstopstopreventstaleorcorruptedevaluation.
RoleLeakage
Developmentsplitdataisinadvertentlyevaluatedasfinalvalidationevidence. The
runisinvalidateduntilscene-disjointboundariesareverified.
SuperficialVerification
Code compiles cleanly or passes static tensor checks without empirical runtime
verification. Static checks confirm syntax but do not validate experimental evi-
dence.
68

REFERENCES
[1] A.Badki,O.Gallo,J.Kautz,andP.Sen,“Binaryttc: Atemporalgeofenceforautonomous
navigation,”in2021IEEE/CVFConferenceonComputerVisionandPatternRecognition
(CVPR),pp.12941–12950,2021.
[2] C. Godard, O. Mac Aodha, M. Firman, and G. J. Brostow, “Digging into self-supervised
monocular depth estimation,” in2019 IEEE/CVF International Conferenceon Computer
Vision(ICCV),pp.3827–3837,2019.
[3] D. N. Lee, “A theory of visual control of braking based on information about time-to-
collision,”Perception,vol.5,no.4,pp.437–459,1976.
[4] A. H. Khan, S. T. R. Rizvi, D. V. C. Macharavtu, and A. Dengel, “ottc: Object time-to-
contact for motion estimation in autonomous driving,” in 2024 International Conference
onDigitalImageComputing: TechniquesandApplications(DICTA),pp.343–350,2024.
[5] E.Dagan,O.Mano,G.P.Stein,andA.Shashua,“Forwardcollisionwarningwithasingle
camera,”in2004IEEEIntelligentVehiclesSymposium,pp.37–42,2004.
[6] OpenCV Documentation, “Pinhole camera model.” https://docs.opencv.org/2.
4.13.7/_images/pinhole_camera_model.png, 2014. Online image resource from
OpenCVdocumentation.Accessed: 2026-08-03.
[7] Z. Teed and J. Deng, “Raft: Recurrent all-pairs field transforms for optical flow,” in Eu-
ropeanConferenceonComputerVision(ECCV),pp.409–439,Springer,2020.
[8] K. He, X. Zhang, S. Ren, and J. Sun, “Deep residual learning for image recognition,”
in Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition
(CVPR),pp.770–778,2016.
[9] H. Caesar, V. Bankiti, A. H. Lang, S. Vora, V. E. Liong, Q. Qi, A. Krishnan, L. Yu,
A.Upadhyay,andO.Beijbom,“nuscenes: Amultimodaldatasetforautonomousdriving,”
69

inProceedingsoftheIEEE/CVFConferenceonComputerVisionandPatternRecognition
(CVPR),pp.11621–11631,2020.
[10] Y.Shi,Z.Huang,Y.Yan,N.Wang,andX.Guo,“Tsttc: Alarge-scaledatasetfortime-to-
contactestimationindrivingscenarios,”2023. arXivpreprintarXiv:2309.01539.
[11] Y. Ma, S. Soatto, J. Košečká, and S. S. Sastry, An Invitation to 3-D Vision: From Images
toGeometricModels,vol.26ofInterdisciplinaryAppliedMathematics. Springer,2004.
[12] J. Degrave, M. Hermans, J. Dambre, and F. wyffels, “A differentiable physics engine for
deeplearninginrobotics,”arXivpreprintarXiv:1611.01652,2016.
[13] D. Nistér, O. Naroditsky, and J. Bergen, “Visual odometry,” in Proceedings of the 2004
IEEEComputerSocietyConferenceonComputerVisionandPatternRecognition(CVPR),
vol.1,pp.I–652,IEEE,2004.
[14] R. Mur-Artal and J. D. Tardós, “Orb-slam2: An open-source slam system for monocular,
stereoandrgb-dcameras,”IEEETransactionsonRobotics,vol.33,no.5,pp.1255–1262,
2017.
[15] A. Kendall, M. Grimes, and R. Cipolla, “Posenet: A convolutional network for real-time
6-dof camera relocalization,” in Proceedings of the IEEE International Conference on
ComputerVision(ICCV),pp.2938–2946,2015.
[16] A. Geiger, “Self-driving cars course: Lecture 7.1 – visual odometry and slam.” Lecture
coursematerials,UniversityofTübingen,2020. Accessed: 2026-08-03.
[17] L. Patrick, “Self-mono-sf: Self-supervised monocular scene flow estimation.”
https://patrick-llgc.github.io/Learning-Deep-Learning/paper_notes/
self_mono_sf.html,2020. RetrievedAugust3,2026.
[18] B.Fornberg,“Generationoffinitedifferenceformulasonarbitrarilyspacedgrids,”Math-
ematicsofComputation,vol.51,no.184,pp.699–706,1988.
[19] K.He,G.Gkioxari,P.Dollár,andR.Girshick,“Maskr-cnn,”inProceedingsoftheIEEE
InternationalConferenceonComputerVision(ICCV),pp.2961–2969,2017.
[20] P. J. Huber, “Robust estimation of a location parameter,” The Annals of Mathematical
Statistics,vol.35,pp.492–518,1964.
70

[21] A. Geiger, P. Lenz, and R. Urtasun, “Are we ready for autonomous driving? the kitti
visionbenchmarksuite,”inProceedingsoftheIEEEConferenceonComputerVisionand
PatternRecognition(CVPR),pp.3354–3361,2012.
[22] F. Yu, H. Chen, X. Wang, W. Xian, Y. Chen, F. Liu, V. Madhavan, and T. Darrell,
“Bdd100k: A diverse driving dataset for heterogeneous multitask learning,” in Proceed-
ings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR),
pp.2636–2645,2020.
[23] A. Paszke, S. Gross, F. Massa, A. Lerer, J. Bradbury, G. Chanan, T. Killeen, Z. Lin,
N. Gimelshein, L. Antiga, et al., “Pytorch: An imperative style, high-performance deep
learning library,” in Advances in Neural Information Processing Systems (NeurIPS),
vol.32,pp.8026–8037,2019.
[24] R. Wightman, “Pytorch image models.” https://github.com/rwightman/
pytorch-image-models,2019.
[25] E. Riba, D. Mishkin, D. Ponsa, E. Rublee, and G. Bradski, “Kornia: an open source dif-
ferentiable computer vision library for pytorch,” inProceedings of the IEEE/CVF Winter
ConferenceonApplicationsofComputerVision(WACV),pp.3711–3720,2020.
[26] C.R.Harris,K.J.Millman,S.J.vanderWalt,R.Gommers,P.Virtanen,D.Cournapeau,
E.Wieser,J.Taylor,S.Berg,N.J.Smith,etal.,“Arrayprogrammingwithnumpy,”Nature,
vol.585,no.7825,pp.357–362,2020.
[27] P. Virtanen, R. Gommers, T. E. Oliphant, M. Haberland, T. Reddy, D. Cournapeau,
P.Burovski,EvgeniPeterson,W.Weckesser,J.Bright,etal.,“Scipy1.0: fundamentalal-
gorithmsforscientificcomputinginpython,”NatureMethods,vol.17,no.5,pp.261–272,
2020.
[28] F. Pedregosa, G. Varoquaux, A. Gramfort, V. Michel, B. Thirion, O. Grisel, M. Blondel,
P. Prettenhofer, R. Weiss, V. Dubourg, et al., “Scikit-learn: Machine learning in python,”
JournalofMachineLearningResearch,vol.12,pp.2825–2830,2011.
[29] J. D. Hunter, “Matplotlib: A 2d graphics environment,” Computing in Science & Engi-
neering,vol.9,no.3,pp.90–95,2007.
71

[30] T. Zhou, M. Brown, N. Snavely, and D. G. Lowe, “Unsupervised learning of depth and
ego-motionfromvideo,”inProceedingsoftheIEEEConferenceonComputerVisionand
PatternRecognition(CVPR),pp.1851–1858,2017.
[31] C.Godard,O.MacAodha,andG.J.Brostow,“Unsupervisedmonoculardepthestimation
with left-right consistency,” in Proceedings of the IEEE Conference on Computer Vision
andPatternRecognition(CVPR),pp.270–279,2017.
[32] Z.YinandJ.Shi,“Geonet: Unsupervisedlearningofdensedepth,opticalflowandcamera
pose,”inProceedingsoftheIEEEConferenceonComputerVisionandPatternRecogni-
tion(CVPR),pp.1983–1992,2018.
[33] C. Luo, Z. Yang, P. Wang, Y. Wang, W. Xu, R. Nevatia, and A. Yuille, “Every pixel
counts++: Joint learning of geometry and motion with 3d holistic understanding,” IEEE
TransactionsonPatternAnalysisandMachineIntelligence,vol.42,pp.2624–2641,2020.
[34] L. Sun, J. Bian, H. Zhan, W. Yin, I. Reid, and C. Shen, “Sc-depthv3: Robust self-
supervised monocular depth estimation for dynamic scenes,” IEEE Transactions on Pat-
ternAnalysisandMachineIntelligence,vol.46,pp.497–508,2024.
[35] R. J. Hyndman and A. B. Koehler, “Another look at measures of forecast accuracy,” In-
ternationalJournalofForecasting,vol.22,no.4,pp.679–688,2006.
[36] B. Efron, “Bootstrap methods: Another look at the jackknife,” The Annals of Statistics,
vol.7,pp.1–26,1979.
[37] F. Wilcoxon, “Individual comparisons by ranking methods,” Biometrics Bulletin, vol. 1,
no.6,pp.80–83,1945.
[38] S.Holm,“Asimplesequentiallyrejectivemultipletestprocedure,”ScandinavianJournal
ofStatistics,vol.6,no.2,pp.65–70,1979.
[39] Motional, “nuimages dataset schema and documentation.” https://www.nuscenes.
org/nuimages,2020. Availableonline: https://www.nuscenes.org/nuimages.
[40] J. Deng, W. Dong, R. Socher, L.-J. Li, K. Li, and L. Fei-Fei, “Imagenet: A large-scale
hierarchical image database,” in2009 IEEE Conference on Computer Vision and Pattern
Recognition(CVPR),pp.248–255,IEEE,2009.
72

[41] O. Ronneberger, P. Fischer, and T. Brox, “U-net: Convolutional networks for biomedical
image segmentation,” in Medical Image Computing and Computer-Assisted Intervention
(MICCAI),pp.234–241,Springer,2015.
[42] R. Hartley and A. Zisserman, Multiple View Geometry in Computer Vision. Cambridge
UniversityPress,2003.
[43] J.-L.Blanco,“Atutorialonse(3)transformationparameterizationsandon-manifoldopti-
mization,”Tech.Rep.012010,UniversityofMalaga,2010.
[44] Z. Wang, A. C. Bovik, H. R. Sheikh, and E. P. Simoncelli, “Image quality assessment:
from error visibility to structural similarity,” IEEE Transactions on Image Processing,
vol.13,no.4,pp.600–612,2004.
[45] D. P. Kingma and J. Ba, “Adam: A method for stochastic optimization,” in International
ConferenceonLearningRepresentations(ICLR),2015.
[46] I. Loshchilov and F. Hutter, “Decoupled weight decay regularization,” in International
ConferenceonLearningRepresentations(ICLR),2019.
[47] P. Micikevicius, S. Narang, J. Alben, G. Diamos, E. Elsen, D. García, B. Ginsburg,
M. Houston, O. Kuchaiev, G. Venkatesh, and H. Wu, “Mixed precision training,” in In-
ternationalConferenceonLearningRepresentations(ICLR),2018.
[48] I. Loshchilov and F. Hutter, “Sgdr: Stochastic gradient descent with warm restarts,” in
InternationalConferenceonLearningRepresentations(ICLR),2017.
[49] G.W.Brier,“Verificationofforecastsexpressedintermsofprobability,”MonthlyWeather
Review,vol.78,pp.1–3,1950.
[50] C. Guo, G. Pleiss, Y. Sun, and K. Q. Weinberger, “On calibration of modern neural
networks,” in Proceedings of the 34th International Conference on Machine Learning
(ICML), vol. 70 of Proceedings of Machine Learning Research, pp. 1321–1330, PMLR,
2017.
73

Page 2 of 92 - Integrity Overview Submission ID trn:oid:::3117:612116539
11% Overall Similarity
The combined total of all matches, including overlapping sources, for each database.
Match Groups Top Sources
103Not Cited or Quoted 9% 10% Internet sources
Matches with neither in-text citation nor quotation marks
8% Publications
18 Missing Quotations 1% 0% Submitted works (Student Papers)
Matches that are still very similar to source material
6Missing Citation 1%
Matches that have quotation marks, but no in-text citation
0Cited and Quoted 0%
Matches with in-text citation present, but no quotation marks
Integrity Flags
2 Integrity Flags for Review
Our system's algorithms look deeply at a document for any inconsistencies that
Replaced Characters would set it apart from a normal submission. If we notice something strange, we flag
78 suspect characters on 13 pages it for you to review.
Letters are swapped with similar characters from another alphabet. A Flag is not necessarily an indicator of a problem. However, we'd recommend you
focus your attention there for further review.
Hidden Text
94 suspect characters on 2 pages
Text is altered to blend into the white background of the document.
Page 2 of 92 - Integrity Overview Submission ID trn:oid:::3117:612116539

Page 2 of 86 - AI Writing Overview Submission ID trn:oid:::3117:612116539
*% detected as AI Caution: Review required.
AI detection includes the possibility of false positives. Although some text in It is essential to understand the limitations of AI detection before making decisions
this submission is likely AI generated, scores below the 20% threshold are not about a student’s work. We encourage you to learn more about Turnitin’s AI detection
capabilities before using the tool.
surfaced because they have a higher likelihood of false positives.
Disclaimer
Our AI writing assessment is designed to help educators identify text that might be prepared by a generative AI tool. Our AI writing assessment may not always be accurate (i.e., our AI models
may produce either false positive results or false negative results), so it should not be used as the sole basis for adverse actions against a student. It takes further scrutiny and human
judgment in conjunction with an organization's application of its specific academic policies to determine whether any academic misconduct has occurred.
Page 2 of 86 - AI Writing Overview Submission ID trn:oid:::3117:612116539