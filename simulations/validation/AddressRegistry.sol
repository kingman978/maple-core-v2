// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.7;

import {
    IAccountingCheckerLike,
    IERC20Like,
    IFeeManagerLike,
    ILoanLike,
    IMapleGlobalsV1Like,
    IMapleGlobalsV2Like,
    IMapleProxyFactoryLike,
    IMigrationHelperLike,
    IMplRewardsLike,
    IPoolV1Like,
    IPoolV2Like,
    IPoolDeployerLike,
    IPoolManagerLike,
    IStakeLockerLike,
    ITransitionLoanManagerLike,
    IWithdrawalManagerLike
} from "./Interfaces.sol";

contract AddressRegistry {

    /******************************************************************************************************************************/
    /*** Multisigs / EOAs                                                                                                       ***/
    /******************************************************************************************************************************/

    // NOTE: Address for GovernorV1: eth:0x5C7842417FE6cEe08070d0F180c873D1Cd6Dd631
    address constant deployer          = address(0x4773bCf870B89b54000C4111a86B3DF9c5Ff5B6D);
    address constant globalAdmin       = address(0x53eBb2f8E7515992412fA4A850F8e2D6c317757E);
    address constant governor          = address(0xd6d4Bcde6c816F17889f1Dd3000aF0261B03a196);
    address constant mapleTreasury     = address(0xa9466EaBd096449d650D5AEB0dD3dA6F52FD0B19);
    address constant migrationMultisig = address(0x2AD93F308AA812961Ec412a08eD778F4f4933758);
    address constant securityAdmin     = address(0x6b1A78C1943b03086F7Ee53360f9b0672bD60818);
    address constant tempGovernor      = address(0x0D8b2C1F11c5f9cD51de6dB3b256C1e3b0800200);

    /******************************************************************************************************************************/
    /*** Temporary Pool Delegate Multisigs                                                                                      ***/
    /******************************************************************************************************************************/

    address icebreakerTemporaryPd        = address(0x37c610584f7834A8FEb490b73E2aC780AEE31905);
    address mavenPermissionedTemporaryPd = address(0xec67fd8445E9a84311E2BD118A21b2fDaACfc7FA);
    address mavenUsdcTemporaryPd         = address(0xf11897A0009b3a37f15365A976015E7F22A16d50);
    address mavenWethTemporaryPd         = address(0xbFA29AA894229d532D1aD1fd7e4226fce842632C);
    address orthogonalTemporaryPd        = address(0x47c388644C7AA8736CA34e3Bfa0ee1F8284778c1);

    /******************************************************************************************************************************/
    /*** Final Pool Delegate Multisigs                                                                                          ***/
    /******************************************************************************************************************************/

    // TODO: Updated addresses.
    address icebreakerFinalPd        = address(0x37c610584f7834A8FEb490b73E2aC780AEE31905);
    address mavenPermissionedFinalPd = address(0xec67fd8445E9a84311E2BD118A21b2fDaACfc7FA);
    address mavenUsdcFinalPd         = address(0xf11897A0009b3a37f15365A976015E7F22A16d50);
    address mavenWethFinalPd         = address(0xbFA29AA894229d532D1aD1fd7e4226fce842632C);
    address orthogonalFinalPd        = address(0x47c388644C7AA8736CA34e3Bfa0ee1F8284778c1);

    /******************************************************************************************************************************/
    /*** Asset Contracts                                                                                                        ***/
    /******************************************************************************************************************************/

    IERC20Like mpl  = IERC20Like(0x33349B282065b0284d756F0577FB39c158F935e6);
    IERC20Like usdc = IERC20Like(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
    IERC20Like wbtc = IERC20Like(0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599);
    IERC20Like weth = IERC20Like(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);

    /******************************************************************************************************************************/
    /*** Maple V1 Contracts                                                                                                     ***/
    /******************************************************************************************************************************/

    address constant loanV300Initializer       = address(0xfF2CE989b5b5881dB21f67cBe25145FFB053BCCd);
    address constant debtLockerV300Initializer = address(0x3D01aE38be6D81BD7c8De0D5Cd558eAb3F4cb79b);

    IMapleGlobalsV1Like constant mapleGlobalsV1Proxy = IMapleGlobalsV1Like(0xC234c62c8C09687DFf0d9047e40042cd166F3600);

    IMapleProxyFactoryLike constant debtLockerFactory = IMapleProxyFactoryLike(0xA83404CAA79989FfF1d84bA883a1b8187397866C);
    IMapleProxyFactoryLike constant loanFactory       = IMapleProxyFactoryLike(0x36a7350309B2Eb30F3B908aB0154851B5ED81db0);

    /******************************************************************************************************************************/
    /*** Maple V2 Contracts                                                                                                     ***/
    /******************************************************************************************************************************/

    // NOTE: These contracts are ordered the same way they are deployed, not alphabetically.
    address constant mapleGlobalsV2Implementation            = address(0x293ae1C9F4A1C85b59f656f5aEdcc31B0384078E);
    IMapleGlobalsV2Like constant mapleGlobalsV2Proxy         = IMapleGlobalsV2Like(0x112D62295D958231e97F9b8Aef2D87a0dbB81F08);
    IFeeManagerLike constant feeManager                      = IFeeManagerLike(0x2250e2562D6020f568fCaeB2602ea6B46E270537);
    address constant loanV302Implementation                  = address(0x3EBDd0457579123B7Bf0b57Eddb81F18e7f7B01C);
    address constant loanV400Initializer                     = address(0x816612A7f91b08823397d4a47F34069faC359D03);
    address constant loanV400Implementation                  = address(0x84F38295E1dd16f10AdfA460cb0cf07bE0804a4B);
    address constant loanV401Implementation                  = address(0xF604229CD99D22DB3ac00385067A81e868737E19);
    address constant loanV400Migrator                        = address(0x0887e60d725dC7C1ebDeA14B3c89f1bC9da2250A);
    address constant debtLockerV400Migrator                  = address(0x31c3ceA3687F03aa5AAc54c9F5DF2782C60B738f);
    address constant debtLockerV400Implementation            = address(0x71EBeEfaF5f631c077f48956a7Ba4623503F8890);
    IPoolDeployerLike constant poolDeployer                  = IPoolDeployerLike(0x94F7b9299D836C7307a21135d22EEF8AC10bF910);
    IMapleProxyFactoryLike constant liquidatorFactory        = IMapleProxyFactoryLike(0xE3aa6e85A43754233dFf6f2846f10Ba356f65bf4);
    IMapleProxyFactoryLike constant loanManagerFactory       = IMapleProxyFactoryLike(0xdb6F1fddDA145cAb6287947668EbD937478c483d);
    IMapleProxyFactoryLike constant poolManagerFactory       = IMapleProxyFactoryLike(0x1bF87903C1d46955BD12588a066431649aD9E3Df);
    IMapleProxyFactoryLike constant withdrawalManagerFactory = IMapleProxyFactoryLike(0x5d89e99cc7449208F5e65De8c0d377D7c6994169);
    address constant liquidatorImplementation                = address(0x48b49cFAe140D4057F446188ef1060D5Ed8BF21f);
    address constant loanManagerImplementation               = address(0x7c4F00Bb1Bb67F15459268Ef43f6DBC1bc20F375);
    address constant poolManagerImplementation               = address(0x2Dbb129cf6211f409c7C8b159B955C528409Ec87);
    address constant transitionLoanManagerImplementation     = address(0xe6FB605127aC21af1EBd23B5C1068ce21754FE65);
    address constant withdrawalManagerImplementation         = address(0x1bEB8837c78a91417bc2c6f7560B84E7Bb8185A6);
    address constant liquidatorInitializer                   = address(0xB831Ce8c4CA754f8340f2164e84E78945be84c5d);
    address constant loanManagerInitializer                  = address(0x040C6201dc87c42aE4E39251d7b8F67Bc4A7E744);
    address constant poolManagerInitializer                  = address(0xd1Ed9aafC943c29070983b46aCfe066090073bF0);
    address constant withdrawalManagerInitializer            = address(0x66442EFF1B4203C74Fe6abde0Bad5Bb564B2f6F9);
    IAccountingCheckerLike constant accountingChecker        = IAccountingCheckerLike(0x41983359D89083C21F112e8ED50de1a5FDE33Ad5);
    address constant deactivationOracle                      = address(0xBE584B9670bB3a1E803b86A958c999b1E0c8978a);
    address constant migrationHelperImplementation           = address(0x8e2bf25e5Cf340Eabcf5C9Dc9B3E44933257E5Da);
    IMigrationHelperLike constant migrationHelperProxy       = IMigrationHelperLike(0x42c9EE8e89eaeEa3C85c1AA8d8387A0E7ba6cB07);

    /******************************************************************************************************************************/
    /*** Maven 11 - USDC 01                                                                                                     ***/
    /******************************************************************************************************************************/

    ILoanLike                  mavenUsdcMigrationLoan         = ILoanLike(address(0));
    IPoolV1Like                mavenUsdcPoolV1                = IPoolV1Like(0x6F6c8013f639979C84b756C7FC1500eB5aF18Dc4);
    IPoolV2Like                mavenUsdcPoolV2                = IPoolV2Like(address(0));
    IPoolManagerLike           mavenUsdcPoolManager           = IPoolManagerLike(address(0));
    IMplRewardsLike            mavenUsdcRewards               = IMplRewardsLike(0xe5A1cb65E7a608E778B3Ccb02F7B2DFeFeE783B4);
    IStakeLockerLike           mavenUsdcStakeLocker           = IStakeLockerLike(0xbb7866435b8e5D3F6c2EA8b720c8F79db6f7C1b4);
    ITransitionLoanManagerLike mavenUsdcTransitionLoanManager = ITransitionLoanManagerLike(address(0));
    IWithdrawalManagerLike     mavenUsdcWithdrawalManager     = IWithdrawalManagerLike(address(0));

    address[] mavenUsdcLps = [
        0x00080000158A9930aeb508823103b0a977161c47,
        0x000ab07b26c48EF3Caf9ec23520D86794c9fd74a,
        0x009fDDE3E654Cb2495135708dc1590daeFb14Ea7,
        0x00DC263EF0E835F614399C67660c3f612De6412E,
        0x01E060498c74141Ec7454C6B8cC670dD1A99A2dc,
        0x01eFdb9d1A2c737c0Ded5544e655628d973e2f48,
        0x0272Ec6B528511f6D6d10F034dF8eAB8eC2e6feC,
        0x02D5AF97524e7Eb7f895ccAdC925FAe394D9ed6A,
        0x03Ad685de7409196894c65f97ced0185170b958b,
        0x047CF45F05c955d908AF374232939e154622FF0F,
        0x056517f7429D68E08d8d5831522a0706B3bb0207,
        0x05b0B5589f548c63C4559f81838fEb48B54a653d,
        0x05Eb7F0ebCFC8beE7D5283521A08EBef149569ed,
        0x07dc9483bc1839deAB93c4Bf4edcE8c613B794a3,
        0x08003dADc2cA92011ACD55EB06eA97AE5F473de9,
        0x08b1f1847efd58B7e39e8E9E45c674844E4EC844,
        0x0a53D9586Dd052a06FCA7649A02b973Cc164c1B4,
        0x0b18628bf6D046E79E14026f02325D81a214d8EE,
        0x0c8eE7DbF8cB1d980c107d3Df6357dEaC7dBe9EF,
        0x0e5Ce9264C48CCd48E0644738b3f8400453Ab617,
        0x0e6c7F5107A81cbB5813383AD112bca3FF1CB25c,
        0x0EF791A46380A148eBD509A07766E53A21a1Bef1,
        0x0f12d7bCeFC998241Db6034dB5754660a66d89Da,
        0x0f1D03268b0737E4efC677E3297640C39852cF40,
        0x1048E693B121a6386F024F2E97Ea17e28537B99a,
        0x10EE63E67f1599aBE651E526a761F428a725F235,
        0x1466D84CB04940A504574AB02D130a8F3185839c,
        0x151a888f07771f92BCe7c737119B9C2556009D6c,
        0x16C0a9C9967d8e860bf84596769ef513dd6f2094,
        0x16d442b02de9E5907Cf4b679dE18aFB458C8aF77,
        0x17014aFAc4128ff8fF6134ef95924850AB64D754,
        0x182d2D31Ce99ECDB33A2D603b0916fB431707A40,
        0x18c1ff758Ae2C5f6B59E06e4E0CC7d6578D3D50C,
        0x190a031CcBD45ABCF1B751CdBc20646FFC2bBdA9,
        0x19C338B8D7B5AC2a5C2a6cF3973ac8c46bd2C730,
        0x19Ddf9AD34da246309f7617Ee758a6F7FBF9C02c,
        0x1b262751dc4cc3257600Cf674cEa8b9CB9aCd632,
        0x1B8ee0b26fd2491a1C8B69dc3E783Ab9B2e65CC4,
        0x1C1C92723e55e99e5E0d2d9bC4e8a1c50a09Aa28,
        0x1C62ca040ea87cE54517E2579c29613d61af33e4,
        0x1d3b180c38c342DcaE23C71dc9637fc829211cc6,
        0x1D98502C64034c04C9AB4036b4d72EcF02270d6E,
        0x1Da985239FA1564255319Be5E80523d9d3CeC4a9,
        0x1eb7B41ACd5E428929Ac3C50c1ffcA42c216496D,
        0x1FF91ca355b3001E1d0373a7c5c5D62b478b58C5,
        0x203b560c2Ca927Db41A2140FC030A97C9126c8F1,
        0x2304F822f2d839bC66CF2B05978E6F79B6aCC7b0,
        0x2390E5658cDc602b7655307882371C867be5013c,
        0x243841dAa2A01d070f0Cc70507266f025324Ccf5,
        0x24e8bB6a37774D8a0187e196BEB29601Ed5920bf,
        0x25A5059213224AAd7760b40E0009e2ffc2a4380e,
        0x25B21ea6479FFE2269D53B49cD9C401Ac825eDf8,
        0x25fBc9a7FE83A8be6Ba19775D8966C0db19a7411,
        0x2656e68eC76F5077380F5c1E445AE0CD5aD2FE63,
        0x272fB300717A9F7e0215AfE22595af5cBfA58591,
        0x27B000E81f120113944D33b5aDe56be412aa077E,
        0x280AC00F2F0c002137675cAb8879132381D8376b,
        0x28a55C4b4f9615FDE3CDAdDf6cc01FcF2E38A6b0,
        0x2a94055c7542bc4c29186CC7CD3142A9407a7d5D,
        0x2b26Aa1ef7638E6eD471A274792903FCBD15B531,
        0x2b3190E4B85a27dddA3045aA95e1601f99414b5B,
        0x2B4893286DB2eA1D0dE8606d6425A5C0b1F361BB,
        0x2B908a85F1D49400bFC58700501Ec0D827782e48,
        0x2c44A67318aF3317919C73c51a7608208F86C2D3,
        0x2c44f2089251d42e649c14C73602aeDEDe508FF8,
        0x2C5710910BDe7B17eA4B2bb403Fae341FDfC6746,
        0x2E142d386019361f645F948797Ed6924fF7A294d,
        0x2E84988E2C221a1a5BDd8dC25Ca405B4A42F119e,
        0x2F0D654FE991d89Ee92065BC27A568ab905c1A31,
        0x2FD55B9133b3343D52A2d38E30A43dB9126b1eb4,
        0x3005AF5497ce6E25c3683CeFF11fB2817e0c7154,
        0x302888fD5a5ceD8C6ac305d41dd0184565b5a20F,
        0x3096496352530ab645326d13da0723599Cdb8175,
        0x309d55E357F6361Ddf20Cc5D81A8c424C869b1CB,
        0x311F17a7d0e8B062Bb6496c929cfdaDa8FF98074,
        0x31349e92130A0C852e85D58e858A598368C7d764,
        0x31F9c67605BdD59ac5fF20F701D5F206eF97a305,
        0x32ad379D17A523C79cbA370A2bD645637Ed4f4af,
        0x3540849E0e3322fCaF4ef1AEbB2d78B4B7EeEa8C,
        0x3575B29A214974db700A4c0eF7058D0972fA5a4F,
        0x35F17621387C2ED8C3e90064C2175a682BDB32bb,
        0x3673D80869e049cDd645bF51A548407c77B10426,
        0x36Be8614Ef0A6606E40746141eeA9aEA8394557B,
        0x379A5D034Ed9B98A1193f6a1F98AE721a758b729,
        0x37E69EA80C185708D898ff3eC096e1a8d4cf6684,
        0x387544F796a05528C9D05403836262DfA84a2E41,
        0x3911c65ff5678040EC055C1fb8f380519cB971F3,
        0x39593EeeCA5650C570094dbf71D5925a7245F1Bd,
        0x39804ac23636fb147aB01d4872D1f9413D932017,
        0x39c81B01650323E6D1006aD4526389D778f52256,
        0x3bE057bBAF734770c8a4CA81e2Abbdc29deb39F0,
        0x3C82A8787Ce78Af6d6648911C6171E576AcA69a5,
        0x3D035F3D088e6140EBC40276ABFEe5066Db849D1,
        0x3E05D2A0C4309Deb14D7323ad1Ef21FBf90f271f,
        0x3eD689B5085891284caD4dFEDff22d93aca23E42,
        0x3f60a58Dbaafc585Bbcd2aB7B3b20e1fa3fF4d93,
        0x40Fd38B62B734930da2C20d004f502bb7360a082,
        0x41318Efd233207DB1E78588e4A78FbB30bf1D376,
        0x41c6BeB49d2D471c1f6889C800C6AE92C6d1abb3,
        0x42d2a126C19577B82AfA6020Bd0D89fc48D8A94C,
        0x42dD9B2eCA8a6d7Bf44E8568C2eCcC588b3EeE2C,
        0x4303Ddc9943D862f2B205aF468a4A786c5137E76,
        0x430E076e5292e0028a0A17A00a65c43e6ee7fb91,
        0x449052c3Bce914D324bBFE911BF508B45A98EE4D,
        0x449E0B5564e0d141b3bc3829E74fFA0Ea8C08ad5,
        0x468F05137394F349F37c5e7D9b35661B6F68c0b5,
        0x46D5F548E02fdee3ea7E4168B7cF896429fE6fe7,
        0x473608756c3079eeC3635EA82ea9Ecaff781fC17,
        0x47480c583240Bd7f640dFd9C886Aa12E90213866,
        0x47A11b9B6EB71F047d797E44E6BA508Eba9F2e16,
        0x4857d1C4b89A046F834FD9F271b0A82f5159889b,
        0x488a79012874953F439eFF6a14C8e5541B5eD843,
        0x4b5F1348EF1127501588c0f6f18f4869eAa336D0,
        0x4BaAD650A6E58C4D3bE40358657BAc526927b53d,
        0x4BaF3c8D0dd58aF939BD3B0Ab32f97Ed831a8C22,
        0x4BBa239C9cC83619228457502227D801e4738bA0,
        0x4cb746667d8E3ce97Be93d302c6af628206446ea,
        0x4D089E2748f43AD8efBC2Da858af290C6298c08A,
        0x4D512AA00b0a6cba4438cf1507d5F3428AB9278E,
        0x4d758f7D8CF72e71eF37d0388de236dDA75707B7,
        0x4ddc290982E0DE46FaB3368F0853eA72ab5a27B6,
        0x4F2b82190998A41F905b7D6915430697242c82E5,
        0x4F4f002651E5962B9dD2a6ea9188Fe5C38F09B29,
        0x500cee602b621AcF523C8523794C56797815ba40,
        0x50b3E08D5c3a2386e0c9585031B1152a5f0E2370,
        0x50b6a381993834C623b2Bded6825824C936E48bB,
        0x50eFE9f4a43a9e3dF886ff04431C2c9C48584AcB,
        0x5118b43F116543c03197eB94A53F2fe6d50Ec9F3,
        0x51332610225DafaBddA9b5e3e05475d87402752c,
        0x522764B3Cc4081Cb9c6B3d5bE25c3A1CAda542E4,
        0x52d597334A853Cfc0e5aFDE7E813Ae5a7E965176,
        0x556D5F0a4a56675f4a3CF1fB5293328b20e338A6,
        0x5570fad9Aa8f4487C074aD4De085960705B22d63,
        0x5672c178F19d375578E6Fd3494ED077267f032a1,
        0x56871442f1C717bEf8AD1B315C3e5Df811a2E7f6,
        0x5853eD4f26A3fceA565b3FBC698bb19cdF6DEB85,
        0x5A089c72cf4dE3211Bc9bB9E06c5076E37c2E76c,
        0x5a0F7dbDD1AB03ab5Bd35D9211a2f9DB4e1D3d42,
        0x5bA1742E4424A519b3112F67C4503E5Bb8b27b60,
        0x5ba9C24A7092886a31E474A9Ed0B1D672B3f8829,
        0x5D1aeF79aEfe7769855B602aCD3eFd2939D99b65,
        0x5DD3e828700E7c21AF5ed7eaA6719ff76B378aD7,
        0x5E407FC970c0E4350f0bc438bc7c9dC1A08C9E80,
        0x5e60B0e7842Ca0142C1B8cA10b1396dE61ec086c,
        0x5E7ee474cb16dF442bC63e14684b5B00eDaDB3C0,
        0x5ede2CBA38aE20EAc6dF5595651e4f8E5084940B,
        0x5F197a23F03467F23366C19d65469aDdbD2DD18e,
        0x60D4a56A3aCBFe48375Ce7984cDF68dAbf176F71,
        0x61E491bDE2D8F913835EdF435F184a0dc3dE3970,
        0x61fab999BEad5C1D34e5884bD0c74c3623e65eF8,
        0x62c02E1Ee0D6153A097B458f9eEA2Eb1635d57c3,
        0x62d51Fa08B15411D9429133aE5F224abf3867729,
        0x62e32DE9bE0BF93F38724628F0fACCf6b174187B,
        0x6327600c8234767b78cdB4E79E64852014D4e579,
        0x638c1ee06500CA91255fA26e34b98dff97bBe96F,
        0x63ba2A2CD8FA3764A587b8910Fe8851DE2Da81A1,
        0x655EBb9eDD6E77e17e2A2c8ba3c15897CB594e60,
        0x657a97770251bD5E372Dfef3441E039aBC43c60D,
        0x688B5c7B549339922C0D2243debE2Fe921A1A488,
        0x68c196C0933E809e24d7b7265A68ED6Eda24D086,
        0x6900C1F8E31B786aD9a85219D6D3FcA20FEdBD3F,
        0x69B76190d82c540Adf627cc70b45d85F0c2a5EBc,
        0x6a73204dB71F8e054bf9A0680b02Ae96f700b595,
        0x6Ab53794466383Ca012ddDC228D981dCBF40e3A6,
        0x6D96D7C5083b7e62274AF095df87Cc29115A4249,
        0x6DFc18C0881af552BbB8B33e957829328285b88A,
        0x6f9BB7e454f5B3eb2310343f0E99269dC2BB8A1d,
        0x6fd668C9B6d2a89F270bFA591525AE0C52b07e30,
        0x70144e5b5bbf464cFf98d689254dc7C7223E01Ab,
        0x7253bbE484D7b36A05F72a616c1e1852354d9Eec,
        0x72583ae53ba95478d3893B0a99D7c081BDFcfd65,
        0x725b29e908b96BC58FCFe76120fB8e16748Ae51e,
        0x73579341011738A4Ad9CFcE427954f3dc5D49DbE,
        0x741AA7CFB2c7bF2A1E7D4dA2e3Df6a56cA4131F3,
        0x75301B375DE52686750b0de1766838719e08db75,
        0x76a059B6BfFa9EF53D7F10c3ACDb6aE4F7FD10D3,
        0x78b22b2256f057980c500E2bd26053E10AE7e581,
        0x78d033B34b80F0c56eDFeafbe47edcBDEDa1bAa8,
        0x79305bA7623F27441E39bfEe4fB7218B8224d4C8,
        0x7A7A427B975e2b17Bea38D9713ad7078bbA0c013,
        0x7aE0fdaE6b5f6cD0a882cE201a39f6211c59ee0A,
        0x7b22Fb198DceF415763c13661509Fd369Ef8B198,
        0x7d5074Ec4337dA3f2f5B4bCAb5e79666434b9642,
        0x7d541D057F177836879dc5fdBED25A71d3184880,
        0x7D6105D75C5E6A40791a50a52a92365545e9B112,
        0x7d96A6f41fd31C7624f7069415BE58b5e3576D34,
        0x7eb4D1f3B748890D7DFCd8EAe09b087454FEDcE9,
        0x7f1239685deeC22330Da51039DBb074C782c5345,
        0x8129c94d2F2b18Fa4b63bD0A3B64EdE4823374AE,
        0x81813CF66F39ad2E99508EbF74F3E8f51AeBcDB4,
        0x81AE5e24Ac6b220751851b6626ea5DC1cc9D51b1,
        0x81b2A91EC65540A879Dcd1C9DA56AD7d036b8B1A,
        0x820cE800B58C7FAad586a335FD57a866Cc61B463,
        0x8295918D123A6a27b064Bdcbb2F88eeE6bA3a4ff,
        0x836D45c29D168cC68e99B58ec72b54b201c1339c,
        0x8399d70C0821a0b8C145BA0AcdDb5c087Fb2145D,
        0x83D7d26b6F5e17153f937dfA04B1105DeA833D09,
        0x84b16F2ea251397e7A330398158DB6ECB16aaf97,
        0x84cACa8Bea5f9c2090f6BBeAB249f4218F46996C,
        0x86B3cc69e508e504C4909Bfe9d8d7ae6F31fB896,
        0x88C696aD5FDa46e2EB0029C2CbF5b5E5dd9C019A,
        0x8B4aa04E9642b387293cE6fFfA42715a9cd19f3C,
        0x8B620586f7a6063a966Df30E9C9872A0b4c2232E,
        0x8C6d9F12C4624afBF4fdCB0892A0fA7e5e6F4412,
        0x8dEe3735c5Bd16BF246290b695B0726dCB7c067D,
        0x8e70Ca936a2f2d81cBbF1Dc84Aabe4213C87b8E9,
        0x8E8b45bfd592EE172486f79Bb8278FEa2eAbD8ce,
        0x8f3ab67B3130AAe724104fF85Df628519b885CeB,
        0x8F866aA4929442ba2e872CBcC8B8d07023647670,
        0x8ffa85a0c59Cf23967eb31C060B2ca3A920276E1,
        0x900CC7F0C67894d3ea90369778e2d4F996Ee60aE,
        0x902659B51CF8e57937f834d76DC0e66c70ee03Ef,
        0x9152c860626D78AD4C2E2723452fcE3D1dBdbEf1,
        0x929d5AB51be0B6249D8E6A63E4802Ec20B2Ef17e,
        0x9323441091F39BE7F1F9331013eA245b04168e78,
        0x93d24b9A8d733f3B296A654994C589D306698d2D,
        0x94F4D3a5791F71ffdD83ac5d0d7f16846b835bB0,
        0x959b83F2b3f7c7f05c8f8AC00F9A8f9f749e90ee,
        0x96E3e323966713a1f56dbb5D5bFabB28B2e4B428,
        0x98B2180e96cB483162E2aab070E38A0b03c34C7d,
        0x98dD67619bf3A2B18DA622569f2709c97CD6b365,
        0x991b9d51e5526D497A576DF82eaa4BEA51EAD16e,
        0x99999738D82A31d6A12B1bc789c5B0C09168AFd1,
        0x9A8A9958ac1B70c49ccE9693CCb0230f13F63505,
        0x9b3611ABceb1550b7ff2ebd46CF6aE4319130014,
        0x9b6Cf4E87f67848b709e041B09A72D4bF48c5814,
        0x9Da50F6578883b069bF120a9Bbe9fAb93Ab246b7,
        0x9dc46EbC2aF07B20D589532b5E53303B7Cf022ac,
        0x9DcA7ce5Ae2eB59e3896f0baf6B6424324A12022,
        0x9e545574C59115bD78869d815Df4D53A70D83fB4,
        0x9f37F4FB3F4F9a2eAa2300bd79530Bf73F11d2EF,
        0x9Fb21C7FBfA9a1b293b4e4383c8ef8305ef2ca44,
        0xa05527778c5d874ff4926AF98d162E3fbf4d96DB,
        0xa099C2AD2BEf49E19E4a0dF6161B139EE5d298E3,
        0xa09bdEB26336243Dcbbc359304441e76CF739365,
        0xA2EcA4F005B1d69884993DFc9186B14a14E1bAEe,
        0xA548A8EABA8cFD6113Ec2ee7F212e489c5aa4072,
        0xa5b42880846634A466DD9a56eDfC489fBe435eFE,
        0xa619172FC79483f54389763482A7298B98df2EE3,
        0xa675406Cc0c2d20213372100CF3e5F3Ec0FEd863,
        0xA6A728F6223304D072852DC4D2Be4B999Bb7295e,
        0xa73c5C3da9dD61B2B15C9e3683Fd0296eB593C7A,
        0xA88bc7966406de71353f7fbE31dE4d6172ECA4f3,
        0xa8DcF7F97274e916091fF7aeA749Ba158B884a67,
        0xA97F33B6f7Ab305BD64cDca861768de6d33d8C64,
        0xa99C3d4d7e57894859D5b7440C329AE1fE499B57,
        0xaaC7359Fb5D39Db6C562cACe5E0947b591F16fF5,
        0xaB0F88D49A4C80FBadA18715C7233373078e6CD9,
        0xaB90d14Fe1B984e633fbFc87C6f284B8814170fC,
        0xABF93061d785E65E80A85ea4E3D62966A36C3B56,
        0xAC3ed1444e1eF53C7933e87485F5A8eD50733809,
        0xaCd44152E64c83542183fe27F30a9eE43D443E74,
        0xAEC854aB2648D959B11ddc7ec8AbFbBd70256255,
        0xAf3F50fEf8666b6c7d153fbB88072f718846De45,
        0xaf54171F21EF6B1A9f97A9959030Cc598c1e5Fd8,
        0xafD0659e7993bD4D820f17a2bb2e79205feaF9B9,
        0xB0dfC7D643eB301066084EE2957f783c997bE24b,
        0xB187a6d7BFAdbca875164eB2Be8A862b320Dfc98,
        0xB1f0e758951A02B24D04dd211d0424445Ae04c5C,
        0xB222752FfE62812ee77AA06F8F7d3aFA768101E7,
        0xB2acd0214F87d217A2eF148aA4a5ABA71d3F7956,
        0xb335C459FA462AE5B950Fb572a0588707B89f633,
        0xB3CE5ae1A2796AcAc6aB45A74A9cca557816C9f8,
        0xb44cD5c304e1A9dD56C621D47060939df83a9238,
        0xB60f415f5130cB97Dc489bEa1eA4214dA5b35d03,
        0xb6CaDf3D152A33dbE2767d8cEb31283b7b3c78f1,
        0xB80A418076275A0634a180d44211b76d74305263,
        0xb8100F4139e649f008aaD63E53484d947aDF8FF9,
        0xb848c56dBec8b9F7147aF261880B8d9F1Aa05C09,
        0xb852084e0a989cE90359C2684195d66b0a243280,
        0xba0b3e6A81d8f26a46d958a36cd364EC0EE4476D,
        0xbA31c6d318F840340A4131a34b0069B2dd5eC8c9,
        0xBa5E26770DB2706c13DA908b207431172012AcD3,
        0xBb6f397d9d8bf128dDa607005397F539B43CD710,
        0xbd096BA73671EE9c50209F85E0E3F950f588C4ff,
        0xbE6394198fc55A5F9748650883F15504640D5f7F,
        0xBe74bF893512bF82e19Ac7aA9C73E2c3a3e153f1,
        0xBe9998830C38910EF83e85eB33C90DD301D5516e,
        0xbf534Da8D25AC3305B744916123208EA92E4868b,
        0xC0e10D43cDAbE15Aa3668F501f6Bd2e273A32a6f,
        0xc15E19f60cB7C5A8dEFa38901a87dC272bDaFC00,
        0xc1C589dc0922399b966f515d4b6436707d679974,
        0xc1c7f785dE74D64225ef22475F1169056cf64630,
        0xc31dC3bb5bCE3284A15019E8b8Aeb212a091284b,
        0xc437F2c71763833E67622685A26f0490a3E7a364,
        0xc474c00256FA9f6D3F1B7b71dBDe12D44A1ADF27,
        0xc4b2286bE2635A4CE1C986EDAb361f7391837cB7,
        0xC4DD94F53210169889DA9a9E96B66cD61874365C,
        0xC62EC81a1ecE67023f6bd3D5da1B47907a1D9f5b,
        0xC644343019F06050C583B5d2cAafD1962b1e7cF3,
        0xC6708c7337F981Eda06c428Bb5b33D93b65a34aC,
        0xc7d43e758641ceCdc2Ee48f28Cb751718be7bEba,
        0xca76644C4F989c698Be79f8531e43b6e830bcEb2,
        0xcb18f6dCda3c60c8999Fe72CB76a2118FF97C891,
        0xCD1629C9Bb9DaA4ce0c5E84dfD2Be6f3c4DB76ea,
        0xCD9054a152b817C0098fF57c7a407a66736Ef812,
        0xcDBb138dEB5C7ec5d186698d719fA4F060E4bFC1,
        0xCE1233917a92d90D90f45c38B7DB305D00693Cd1,
        0xcff842A621F439354BD43027c6E7Acf42e5691D8,
        0xD0485ddc7AE77C2A04F15c28Ca9ac2C4d8B74369,
        0xD05471D614A7b0D1fCdA75c40dFb61Cb4AF2758D,
        0xd1d255f610C732C9c60583540E49db844736F616,
        0xd1E1c014323347Ed36db2DD10d687e0C6B16189F,
        0xD1eFEd7d784634fc9A3237999487fc6315E0321A,
        0xD2050719eA37325BdB6c18a85F6c442221811FAC,
        0xD27262803a83B2f38C5720e934c1d461c081e631,
        0xd28624a3B9E391401e5771dAe16f7e3C8B95Ae34,
        0xD321Ee41540822CcA0C136F651DB81C4AF303bEa,
        0xD3b475df4Ec2959d4E984eb58f68184BED59339F,
        0xd50520f57b66b7101528C9860d8b2e788eE774a9,
        0xd53Ea1cd7d20316d77eA633fdf99a06f576ca29e,
        0xD546AECbA38Aba6CF8b8070D20edc50e4DE3f86D,
        0xD56f06ff5FF1beEa43cFFFC227757F1E2Bae6126,
        0xD5ddBA3fDC8Ee0F48628AF97D85529E801d7d2F2,
        0xD6897f53b7120054Be1afd8c47d68740fCADaB7D,
        0xd6DBC45210ED9b2F096A77713Adb6Be1b097C453,
        0xd7E8E098b05a119B32d2c16253377839Ca6F77Fa,
        0xD8aCA3Fd7ad5bfBb9f82a43E88A36f00a0E680b3,
        0xD8F7Cf4602DCa6eFbB728f50606473339D6Ae9A0,
        0xD93A3ced8Ca0a74a29D85cAB06Dff41dec207991,
        0xD96923F7152C54223bfF90A615Ce3797034855Ab,
        0xd97331D4a96b2139DEd3dA430c7621968D8149a6,
        0xd988EB2777ec4d844ced75f68148A08310bEFc76,
        0xdAB9d75D4Ef5447adde6184471C759500815673f,
        0xDacf1065b12849298dc5B47EcE9553094000074F,
        0xDb33d69d2a660C541EB4ef1D0e956b9A5e2D34f7,
        0xe09d6b11e8db4230094084920889C45bAd85b1e2,
        0xE0A998E2416159Ec62A02b15E52760f85aBfa13e,
        0xe2D0E650707383336E97365545a68d207757F1c2,
        0xe31f3CCA152Fbbe45d73Ef64dE25d81228F8f7a7,
        0xE4BBe2f185Fb37EffC311c190d0DB2Ec8Eb46893,
        0xE4de1953e5e8C8685c6d41020faAbF5dc23711D1,
        0xe58Aa11A1AD425b12B4a3155124245cd36DA4f5e,
        0xE79bC301E7DfaeB5Eb0A3cC3be3AB71CF721aE6F,
        0xE864166688e95618920e32619753E23175f189ce,
        0xE896Db62e14614B8aEF0bB967080Dc87fDe3c8C0,
        0xe9595317Dc5fE9FEa60BAD0cDb3240A82Ae8662D,
        0xe9ce2ed0D2bad6F082E3f346c7D52FA4B1B436da,
        0xE9d6e2B6d15e386266B634fe12B868FaA3B3FD5E,
        0xeB6C7FEC42f66D7a8cbaA633B1693255D593Ccbf,
        0xeCe13dd5d40c44277A6cC8c014350aE64F7005fD,
        0xeD8634adcF0Cd3Fafdbb1cAf0571c7a9060d07DE,
        0xEE0922A6b0768e32FA66a8AA51E8C0f085A2Ed4c,
        0xeeA8F7bA122FBadeB1aE725ba81294360Ac5F9Aa,
        0xEECD7ceee1640ed61D02A857c6b2e4aFD807Fea6,
        0xf0163143Ed4F65CEdC3fF7DB3A0B30A610088518,
        0xf0f5c8Fae4D28BBdfe218aeA5Bd13bC8B61f94B9,
        0xf5f18DC4e702A8E2759c1896e3B55a0621C2D2c9,
        0xF6853c77a2452576EaE5af424975a101FfC47308,
        0xF6F3e1C256042D7813159E84E88E0f13FE5FA562,
        0xf7664803c6Fc11c49C2d6e3a1f7684e00BdEe49C,
        0xf85605545e3D0DB432b1f87b9d43B41096485cdb,
        0xF915CF6f8D7C6D5D20d78411A6B98881d923d2d0,
        0xF986678318FcCF839F4b1Fa3A522C84234FC4495,
        0xf9c92B0f0d578b92c00d4af28D3d3b1cD1B069e9,
        0xf9db64e6FDEE3770e6181C345a4AcF51b8607577,
        0xFA2283f212f2579Af943179FAC2e0A5cCFCC1D3f,
        0xfa9B56c9ef453B739F5ac244A080A1c6bA6a5DCf,
        0xfAbacb07863Bf43Cf9215b0787a924CaA438f674,
        0xfB27C8582976F1A29d58e89Bcc89dA1e54D78076,
        0xFd1916343d7D2Ec8C8d8ee18055bD551137E1a0e,
        0xFE744807F15C9F1C379c346E59D7C7b55Fe56369,
        0xfeBa6502ea8C7FB27ABf4D83e51715d3BD434EC0,
        0xfF0d3D86DB276Aa5F554C8FE309AeB15f075cAdb,
        0xfF3fc772434505ABff38EEcDe3C689D4b0254528,
        0xFfd0a90d886bd980cb7E62Da012119DE86c4C804,
        0xfFEF59Ed193185aA2AD61fE1C7c4AFa17A8CA789
    ];

    address[] mavenUsdcCoverProviders = [
        address(0x0c8bFC46C4fB39b6eEd7814E8830fAc0a45F8D6D),
        address(0x0f07EBbd719C9aAd480AcE5f6aA2c044E92380Ac),
        address(0x1B793b70834A80B1CF1b9C279084409De419c956),
        address(0x186cf5714316F47BC59e30a850615A3f938d7D79),
        address(0x212F527CBf536af122931FEf9EED1De87f8dF6Ed),
        address(0x2719150aEA3b6bEcfC85229f8A89B7F94AEccE1b),
        address(0x360C3f56976c2429658Ba9AA763BdF1Ff835A50A),
        address(0x3Fa457EACC2d90570C9d2a435a9a59f9A46605E1),
        address(0x52705A276D86c4dc7f33a54AF565C038FbdB8e2a),
        address(0x53e73538c28A96B68d92E5B049C3996BE048D3A2),
        address(0x607F2D398D51CC0D2E87036C02b36c250A9f3909),
        address(0x6f9BB7e454f5B3eb2310343f0E99269dC2BB8A1d),
        address(0x7371Da5AC817C05547da65a84EACd72D653027AF),
        address(0x7E0Df04CBeA8fC4740D2d64a84E34d1a028987D4),
        address(0x8735F6C54b98d8C4da04115caee48B1ff31e7E9C),
        address(0x8B311BCb95D12b98252b6c1b9f8752de79E8d50D),
        address(0x8B4aa04E9642b387293cE6fFfA42715a9cd19f3C),
        address(0x8fe8F4AE3DD8AA5c190e42fA108560996b35942A),
        address(0xa2e759bDb0BF658eD2812aDa1Ecff0D6Ca4F68AE),
        address(0xa44A09B196d767061Cc252c30d253Ced797f035f),
        address(0xB187a6d7BFAdbca875164eB2Be8A862b320Dfc98),
        address(0xB204Ff6f1074d4fF83FAb608671A982dB46DB3f2),
        address(0xbAa882D68FC5325fC3899dE264F24B5981523A5C),
        address(0xbF780E695A8c37ae8c4030Cc75FfEcCDCF03FddC),
        address(0xc6E4Ad3ccdfC65687D2d60a454a8bdDc1F4d6c06),
        address(0xc87d690a8D20FAE8509aa27db0850B199645327C),
        address(0xcD89D190353b1D0D4C103102C38b76F7696D511d),
        address(0xDe3258C1C45a557F4924d1E4e3d0A4E5341607Ee),
        address(0xe015c0D33389e5F0382CceeC817CC3032edE113D),
        address(0xe18B7E20c0b9A8FA16C20911B706Be8DC69d3485),
        address(0xEF9355e1f3Ed17459078DFb54bf609C3f65E3f34),
        address(0xFe14c77979Ea159605b0fABDeB59B1166C3D95e3),
        address(0xab38A4E78a0549f60Df1A78f15f35F03F39f11F4),
        address(0x0168002cc0CFeDb3E77Af7172bf28adBD783ce5C),
        address(0x990d11977378D4610776e6646b2cAAe543Ea4EDA)
    ];

    ILoanLike[] mavenUsdcLoans = [
        ILoanLike(0x245De7E3B9B21B68c2C8D2e4759652F0dbCE65A6),
        ILoanLike(0x502EE6D0b16d834547Fc44344D4BE3E019Fc2573),
        ILoanLike(0x726893373DE92b8272298D76a7D60a5F51b90dA9),
        ILoanLike(0xa58fD39138083783689d700758D00873538C6C2A),
        ILoanLike(0xd027CdD569b6cd1aD13dc82d42d0CD7cDeda3521),
        ILoanLike(0xF6950F28353cA676100C2a92DD360DEa16A213cE)
    ];

    // ["0x009fdde3e654cb2495135708dc1590daefb14ea7","0x219fd48e2ef72b8b55c2e3fe78614b350c06d6eb","0x2e46037a6b9720cd4fcb4498e65324908abb8d30","0x3ef96be3c7b9446b78903c40fc509789898f1cef","0x584b52397a51ed108178970675c3d6622df9b2be","0x8c6d9f12c4624afbf4fdcb0892a0fa7e5e6f4412","0x9928c2751aff664cec0a100f36bf2a31c5dcd8c7","0xe83c69d9594118ada9f95af629c989805a33c138"]

    /******************************************************************************************************************************/
    /*** Maven 11 - USDC (Permissioned)                                                                                         ***/
    /******************************************************************************************************************************/

    ILoanLike                  mavenPermissionedMigrationLoan         = ILoanLike(address(0));
    IPoolV1Like                mavenPermissionedPoolV1                = IPoolV1Like(0xCC8058526De295c6aD917Cb41416366D69A24CdE);
    IPoolV2Like                mavenPermissionedPoolV2                = IPoolV2Like(address(0));
    IPoolManagerLike           mavenPermissionedPoolManager           = IPoolManagerLike(address(0));
    IMplRewardsLike            mavenPermissionedRewards               = IMplRewardsLike(address(0));
    IStakeLockerLike           mavenPermissionedStakeLocker           = IStakeLockerLike(0x15D297B15A631D1f3B53A337D31BDd2d950d5402);
    ITransitionLoanManagerLike mavenPermissionedTransitionLoanManager = ITransitionLoanManagerLike(address(0));
    IWithdrawalManagerLike     mavenPermissionedWithdrawalManager     = IWithdrawalManagerLike(address(0));

    address[] mavenPermissionedLps = [
        0x009fDDE3E654Cb2495135708dc1590daeFb14Ea7,
        0x219Fd48E2eF72b8b55C2E3Fe78614b350c06D6eB,
        0x2E46037a6b9720cd4fCb4498E65324908aBb8d30,
        0x584B52397A51eD108178970675c3D6622DF9B2bE,
        0x8C6d9F12C4624afBF4fdCB0892A0fA7e5e6F4412,
        0x9928C2751aff664Cec0a100F36bf2A31c5dcd8c7,
        0xe83C69d9594118adA9f95AF629C989805a33c138
    ];

    address[] mavenPermissionedCoverProviders = [0xab38A4E78a0549f60Df1A78f15f35F03F39f11F4];

    ILoanLike[] mavenPermissionedLoans = [
        ILoanLike(0x500055809685ecebA5eC55786f65440583954501),
        ILoanLike(0xa83b134809183c634A692D5b5F457b78Cd6913e6)
    ];

    /******************************************************************************************************************************/
    /*** Maven 11 - WETH                                                                                                        ***/
    /******************************************************************************************************************************/

    ILoanLike                  mavenWethMigrationLoan         = ILoanLike(address(0));
    IPoolV1Like                mavenWethPoolV1                = IPoolV1Like(0x1A066b0109545455BC771E49e6EDef6303cb0A93);
    IPoolV2Like                mavenWethPoolV2                = IPoolV2Like(address(0));
    IPoolManagerLike           mavenWethPoolManager           = IPoolManagerLike(address(0));
    IMplRewardsLike            mavenWethRewards               = IMplRewardsLike(0x0a76C7913C94F2AF16958FbDF9b4CF0bBdb159d8);
    IStakeLockerLike           mavenWethStakeLocker           = IStakeLockerLike(0xD5Deeb06859369e42cf1906408eD6Cb249E0e002);
    ITransitionLoanManagerLike mavenWethTransitionLoanManager = ITransitionLoanManagerLike(address(0));
    IWithdrawalManagerLike     mavenWethWithdrawalManager     = IWithdrawalManagerLike(address(0));

    address[] mavenWethLps = [
        address(0x0013CEFc104698Bb40d574E2aE6C822d5D52cff3),
        address(0x0145bF81e40d6062630514F29cd3293F17685Fe0),
        address(0x0148107d2b0fC3E90E8aC427A9058BeAfFc5Dd79),
        address(0x01E060498c74141Ec7454C6B8cC670dD1A99A2dc),
        address(0x02054619b6D340DaDFb822a1a365644b565616B9),
        address(0x0519bA35Ae9cE8A987BBA57f1B7D22fcFd8b7fA8),
        address(0x056517f7429D68E08d8d5831522a0706B3bb0207),
        address(0x0c9ff457f1CDA6113555c4A6dAB2Db297961A18a),
        address(0x0F1B32640fe41249a5C3eE765c86c28112dECa02),
        address(0x10EE63E67f1599aBE651E526a761F428a725F235),
        address(0x11be28b25720eFb11bd78790C80b215F46254394),
        address(0x186cf5714316F47BC59e30a850615A3f938d7D79),
        address(0x191a20118EF3D41a914412bF4383910baBDc69d0),
        address(0x2141b0Dae3D7dd2792ECfD096273571a791BdbE4),
        address(0x25365E93c880681a92c91BAC112018A763C09e50),
        address(0x311F17a7d0e8B062Bb6496c929cfdaDa8FF98074),
        address(0x343b4f05481d70e4fc1f2bE9218B1eb2F755d200),
        address(0x3af586034a0923Ed561B6C2AD9b3D566162eacd0),
        address(0x3Ecd0359496F9A49A1b11eB50Bb603C262Ff4218),
        address(0x46309da0f20b99339a4B88EB93941Ca1E9Ea3DCB),
        address(0x4F2b82190998A41F905b7D6915430697242c82E5),
        address(0x5118b43F116543c03197eB94A53F2fe6d50Ec9F3),
        address(0x54d020c2fe9d0C9D9b562FA1FFDbc6Fa8A0BAB93),
        address(0x5A30a2C5a2B3B5b76ad721877D4163B599af757a),
        address(0x63A9dF1C07BdeB97D634344827bf8f6140D93EC6),
        address(0x657a97770251bD5E372Dfef3441E039aBC43c60D),
        address(0x688B5c7B549339922C0D2243debE2Fe921A1A488),
        address(0x73F7261cF493105202F8dcbB11C126a65703dA55),
        address(0x775f6A8EAA17775EB19e7f873ae2d8a807B20B95),
        address(0x86950F7fC23920aFb83523d8362FaD39712ec719),
        address(0x8bD774073Ec3d7b39a4769780ecA539102cE46DF),
        address(0x8d26C9DAC7E16738752fa1446b956A97C63e2F39),
        address(0x8dcB33D373966486885aA933c2dcb2B134bA9445),
        address(0x8eB2E34552A618f92bA32E045a06529b186dC8Da),
        address(0x9164E822Db664A1B139F39Cc3eCC40aecd276b0F),
        address(0x948b1Ce64180e3d50489E7111194cf069e73785a),
        address(0x96EdF266EeAbBF4e2C136EAFf7BF30eECaD52c49),
        address(0x9928C2751aff664Cec0a100F36bf2A31c5dcd8c7),
        address(0x9d375d3F149e625F2445113D94341441067482e4),
        address(0x9e10002b5A242362FCdD689F9709dFe6a08F05f3),
        address(0xa0f75491720835b36edC92D06DDc468D201e9b73),
        address(0xa6B8f968389CfFF9c40B265F2214e43B98Fa44D5),
        address(0xA937A10855280d50013b04a562D4c808DFECD698),
        address(0xA9b7f513decA109D2271DFF29aedD08934d5a84F),
        address(0xaB3efcD5583d2EBc01742CF1C88B7C034Fd0A8eC),
        address(0xAC397d83EA60a16131abB42cA11975E867c23bf4),
        address(0xACf14710b3A8E5F47369eAb81E728e0052811DbF),
        address(0xAF0B4E80a78017B0F9290B3D943dEB4B727346C8),
        address(0xb44cD5c304e1A9dD56C621D47060939df83a9238),
        address(0xb5419E8A95c0CFc7cC18D728d7E12b7749e50822),
        address(0xB577CC8AA76D3607067934Fd6477f0A392194A83),
        address(0xb6D844E2529Bc79a444662aa55f72acA08fd8f54),
        address(0xe2008b01A2AD0A9AeEA9f71ecC6A176138553a61),
        address(0xe6B9d0D9fa7707fCB264c9532Db8771d4332bF88),
        address(0xF59F1D0a8Add8fFC347d044E0F065208A3422c51),
        address(0xfa38A1dB71e675a5F7C9d318955F787CDbB5c1de),
        address(0xFaCf46Ea1E0aD2681103E726F64CFC503E9dA5D6),
        address(0xFE4AD60c8EC639Ca7002d7612d5987DDFC16A4fB)
    ];

    address[] mavenWethCoverProviders = [
        address(0x990d11977378D4610776e6646b2cAAe543Ea4EDA),
        address(0x31c039383d787457b75D185D820D4A37aB80DAD2),
        address(0x0168002cc0CFeDb3E77Af7172bf28adBD783ce5C)
    ];

    ILoanLike[] mavenWethLoans = [
        ILoanLike(0x1154DB30D92b1d504719738A13c754B77cF6B75d),
        ILoanLike(0x2cB5c20309B2DbfDda758237f20c94b5F72d0331),
        ILoanLike(0x333FA79511F4F175ce1aF4DdD82E135198cf015e),
        ILoanLike(0x4DbE67c683A731807EAAa99A1DF2D3E79ebECA00),
        ILoanLike(0x53c5434b6561791e57DcdA39F798B6577c25594C),
        ILoanLike(0x64982f1aA56340C0051bDCeFb7a69911Fd9D141d),
        ILoanLike(0x6c4463896be1bFAafd4378882a92E0113532090D),
        ILoanLike(0x91A4eEe4D33d9cd7840CAe21A4f408c0919F555D),
        ILoanLike(0xa948182c5ba0Aa003C61AbA8D7095F18D1A2aB8f),
        ILoanLike(0xC8c17328796F472A97B7784cc5F52b802A89deC1),
        ILoanLike(0xd0bab1D546E4A623839791f30481862a1cb1A428),
        ILoanLike(0xFcF8725d0D9A786448c5B9b9cc67226d7e4d5c3D)
    ];

    /******************************************************************************************************************************/
    /*** Orthogonal Trading - USDC 01                                                                                           ***/
    /******************************************************************************************************************************/

    ILoanLike                  orthogonalMigrationLoan         = ILoanLike(address(0));
    IPoolV1Like                orthogonalPoolV1                = IPoolV1Like(0xFeBd6F15Df3B73DC4307B1d7E65D46413e710C27);
    IPoolV2Like                orthogonalPoolV2                = IPoolV2Like(address(0));
    IPoolManagerLike           orthogonalPoolManager           = IPoolManagerLike(address(0));
    IMplRewardsLike            orthogonalRewards               = IMplRewardsLike(0xf9D4D5a018d91e9BCCC1e35Ea78FcfEcF4c5Cbca);
    IStakeLockerLike           orthogonalStakeLocker           = IStakeLockerLike(0x12B2BbBfAB2CE6789DF5659E9AC27A4A91C96C5C);
    ITransitionLoanManagerLike orthogonalTransitionLoanManager = ITransitionLoanManagerLike(address(0));
    IWithdrawalManagerLike     orthogonalWithdrawalManager     = IWithdrawalManagerLike(address(0));

    address[] orthogonalLps = [
        address(0x0013CEFc104698Bb40d574E2aE6C822d5D52cff3),
        address(0x00843213a104A752Ec360108688979e378204137),
        address(0x0099E3ea4f7AA9505be2c1c94149116B9856208b),
        address(0x009fDDE3E654Cb2495135708dc1590daeFb14Ea7),
        address(0x02d7F86F6e4aB78F4020E001204372072aB364C8),
        address(0x02fFb9B4bBC29f9A59b20C541d369C5add62a5a3),
        address(0x032e7c4e7F677D5559Ab1b8b74F3108bcbc09cDB),
        address(0x042a135bd342910ad7F67bBda74e3fd4125D1272),
        address(0x0485A925b92F64D195B5f65D0B4C3B72004e98A4),
        address(0x0519bA35Ae9cE8A987BBA57f1B7D22fcFd8b7fA8),
        address(0x072422f1b6946740E43dA4E2003f565a582A8e89),
        address(0x0790F2C20b1517F9f93D85Ff72f10Cf8287c8D56),
        address(0x07AE98D69128300e0Ad7379b1927d8089d1BaeDB),
        address(0x082Bd48Cf19628D7d3149C6AcCDa9468a39cC07E),
        address(0x08D64d365Bf7BF47869E0e5e95Ef07bFEbA6152a),
        address(0x09dbC4a902199bbe7F7eC29B3714731786F2E878),
        address(0x0a53D9586Dd052a06FCA7649A02b973Cc164c1B4),
        address(0x0c8d567A7ca2C7da6456F6684074f8D5DB89B512),
        address(0x0f8CcC8DD9D878aaD26CDDD1b54cAcB3519534E1),
        address(0x0FeB0f31D67ADBBc950Ac0c5266490A9a9735a49),
        address(0x0fee1Bb1c5376d660Ea0b40841ebd71a55B98D4e),
        address(0x1058c3aE17e20dB7504b8A7cc3F526f4C6600d98),
        address(0x10eaACA8E8B5Cf1eD0949e060790C62D6F8f39b8),
        address(0x11456f26D6763ed1b0A000A42fC1054A9eD6c57a),
        address(0x11513067f63e5bC50a3555F998b245B56220fA40),
        address(0x1465e375f1D4da50c7f976d7AeD564730C164Ff9),
        address(0x155313f50C5ba3FD0988f6818B17F6A163C987F1),
        address(0x16d442b02de9E5907Cf4b679dE18aFB458C8aF77),
        address(0x175242d8bAd39B13Bc8203D28ba36F0c6dA4E9AC),
        address(0x179517f1C6c3981A50630f5c8b3D7099875cB8a6),
        address(0x17EA85484cD4E97bE63fC02F20a196EDEAa937a9),
        address(0x185542374ce5Fc8bF8F215F5Fc681370704fD124),
        address(0x186cf5714316F47BC59e30a850615A3f938d7D79),
        address(0x18822A5535e0A70b34Dfa00b23fA183DCABeE531),
        address(0x18C4158C1eF33d96089184Cf08c8b5972a6b6581),
        address(0x1973255Dd628f67cF5ED5025268CFcC50f3cf91F),
        address(0x19BeAA3a5535a4c64838c7eF1f14A99a8DAEb580),
        address(0x1BD658c933D592519d57FD728a1afB659F474D3B),
        address(0x1d3b180c38c342DcaE23C71dc9637fc829211cc6),
        address(0x1e11A5870AdE768471134758c8b99C3Aac2A15Da),
        address(0x1e79F6714c7dFBb6504357786A2aaBb2304dE2DD),
        address(0x1fe4259875E21cF8ac2EE49D1A9C774dF6427dF7),
        address(0x2175CE7c56BAa22874Eeb021c1270E6198059Cda),
        address(0x21E10167F7e56419C763C32A070B32705f036acb),
        address(0x2291F52bddc937b5B840d15E551e1DA8C80c2B3c),
        address(0x2453c6CA9a6611DED1726fd5ba6eb99E437447D2),
        address(0x24e8bB6a37774D8a0187e196BEB29601Ed5920bf),
        address(0x24fC7A0751BBF53C239cC1D21d2951A5b21f733d),
        address(0x2574d2367C58a037604d79a5a6DDD5E13603cF12),
        address(0x26b4b3d787B9B763aDa19203059D621Bca3a870f),
        address(0x2730BBb1a1dC9061a1c689Bf89280c7Ce89d5D9F),
        address(0x276B36e87d414fb21BD87d2fdC413697C9De52f4),
        address(0x27b847b883f4420068a8cDB0e06fB35f5D12784E),
        address(0x28a55C4b4f9615FDE3CDAdDf6cc01FcF2E38A6b0),
        address(0x28f70B9a61ca03eb6ce6092E4E4a4AA53013ED6C),
        address(0x2923046908093ea883ec124ef55389337aEc15DF),
        address(0x2A254687F5056EA5235d41f218D7E3BB946DAdFf),
        address(0x2ACF58b4C80DBe20C8D2c141929b3726d2CF65Ee),
        address(0x2ADd6d79dC913ABaC8713DC515F1003030FEEC8E),
        address(0x2afFCD7650c2c116EDB6907725DAB53A259285c7),
        address(0x2C5710910BDe7B17eA4B2bb403Fae341FDfC6746),
        address(0x2c5aBc767AB347A852112b80bf62b221f15A6Fe7),
        address(0x2d1EF4aCf4cae6a38950971AaAA15f88D9b3f165),
        address(0x2E3C2B562783EcB5b30d2Cdd0d3FD67a68a1105b),
        address(0x2E46037a6b9720cd4fCb4498E65324908aBb8d30),
        address(0x2F1264DCA7397b768fF567db2d4Bf6F409594286),
        address(0x2FD55B9133b3343D52A2d38E30A43dB9126b1eb4),
        address(0x302888fD5a5ceD8C6ac305d41dd0184565b5a20F),
        address(0x30636256c5D3f0552f7B51dDE19a0f075A5aC6b6),
        address(0x30bACd12a889C9Be7E5DA52aa089744C62AFF878),
        address(0x314C0695273Ba259Bb60074f2C92c67AC7ae6D40),
        address(0x32aEDE281Ddb2E28e0953B413eAdD107B98F50C2),
        address(0x32Bb9CA7be141A6146f9a688EB597a26162749B8),
        address(0x3382726Df6Df71cEd9A002308820909315ED450c),
        address(0x33B7aD520a13206B9776cf7Bb8A7cD3a22567866),
        address(0x33c038b8C1b6a71565d0a371a77E71153Bb8401D),
        address(0x3428cfd24666a0e0f34654373caDecd698b7B2Ee),
        address(0x3522b690EB07A991A5CA405aB2d8B465D4CC5B10),
        address(0x352bDC63C766Ea44021479C484c868F031845548),
        address(0x35F17621387C2ED8C3e90064C2175a682BDB32bb),
        address(0x391A1f7eAf6b8021E9f5830c9065DE0d57178665),
        address(0x3bb8c541c0D03Ac25892C8Baf7254Af12F3B2841),
        address(0x3C8A4F21625A709D0FE0Ef3a6d24801fac19CC67),
        address(0x3C9dcdeB350d80D03b5cBBA0604a5211d77eC235),
        address(0x3d4309DC284d0FA044c532d3276a5b3eDEDc79fc),
        address(0x3e7d4cd9c6F7d69e2A55CeDE3369fF672f7DF6A2),
        address(0x3e8ACfF977fb67220e06FAdDb8e04c2E1AEF2a31),
        address(0x40CCfaCf2Ef60D282F244b8648D96E7300bba5e4),
        address(0x41318Efd233207DB1E78588e4A78FbB30bf1D376),
        address(0x416cFADABa6EAD3f759Fc50574aB0cd342832Fb5),
        address(0x417aC7E5e214053149746e28D516683FFb90e933),
        address(0x42d2a126C19577B82AfA6020Bd0D89fc48D8A94C),
        address(0x43339da15DCa3be00001263d57D8Ee8C79B2Af6A),
        address(0x4452700F01B6863DeC653E3183c6C951020Bc666),
        address(0x44EdC199Cb77F7A7373359E7bFf3c444ECff71d3),
        address(0x46084221C31c246E02e3210A5078f70C34cc9ADA),
        address(0x468b84EfDf2AdFCEdde007403290E8FC396A0b3F),
        address(0x47b2743C2B6B6b9a4848f1D1a20D4DdA2E56CF99),
        address(0x47C3006af872af4022895C8720224f786Bad397c),
        address(0x4838425B186E8DB85971A5a40F1a5c172c2eB2a1),
        address(0x491345dDf2dFC0e96D4d5D431cA4B3dB51d74B2f),
        address(0x4a8B9E2C2940fdd39aceb384654dc59aCB58C337),
        address(0x4B0943930e1FF67E4D4A56E9e912B1D2E47924d4),
        address(0x4C026d5D6A7fe1B2e2B28B916Ef2016f6058F7B4),
        address(0x4C71c487dC43544195961Ef7E83c9E9a57A5E4Eb),
        address(0x4E264ee6080BfC6ec89bca450938b42F89e2Ff98),
        address(0x4e80B64BD13709FFd694873698AdDc11Fb27a779),
        address(0x50b3E08D5c3a2386e0c9585031B1152a5f0E2370),
        address(0x52705A276D86c4dc7f33a54AF565C038FbdB8e2a),
        address(0x53E4E79fA1E6a0075E782d6BfC47d054Df88F62a),
        address(0x548B4a7B042FBd4AEdC2B640047214d925A1F435),
        address(0x55Fe5a18d337Cc353fF6C69003c1bdb2526eba58),
        address(0x560feCc7B74f261A57Cbcbc8cF300564d456e562),
        address(0x58A266895f58F271Daf8DF8BdD4505f337c63700),
        address(0x5AE36d7Acd459302876b2d1C312d5c2B0507b794),
        address(0x5ee9C8c85Dbe12C0cE3F2acC031fd91ac7af7512),
        address(0x5F197a23F03467F23366C19d65469aDdbD2DD18e),
        address(0x60a17dfE47C933168e3e0316E5606d3E67940C99),
        address(0x60C27FF141434E790825e1778ab264B15D07C64A),
        address(0x615E0fD7c16719d75F010E9dA5eAa920cF971d66),
        address(0x61fab999BEad5C1D34e5884bD0c74c3623e65eF8),
        address(0x6220fbA94a0c8e8041fAde92A1b6Fc05eC188643),
        address(0x62d51Fa08B15411D9429133aE5F224abf3867729),
        address(0x63ba2A2CD8FA3764A587b8910Fe8851DE2Da81A1),
        address(0x646208A19Fb152C80FDaAdcdFd804339f22949C0),
        address(0x64FFD52a2Ee01975366c3B3b823b15fB0D53BA04),
        address(0x65B1B96bD01926d3d60DD3c8bc452F22819443A9),
        address(0x66879e99Fe3C6B4BAe016608502aB9D139Ca1DC1),
        address(0x688B5c7B549339922C0D2243debE2Fe921A1A488),
        address(0x68EC07489b69de1e7ad4B8e6CEd2249A1d33404c),
        address(0x69e17C53b4B7Fd9D6d81ba620E2e0d0DEb2F880f),
        address(0x6A654dC0AfF2ec4BAeC53104483D48a9240b9C9a),
        address(0x6B6310BD7fB278c7D6a12f888a0360B44d209E33),
        address(0x6C99C45b39D1cddb61b272798ea1dA2cDAc9bCc8),
        address(0x6d13881C26F2fE3F91BE685970EB9e0693B72F22),
        address(0x6D96D7C5083b7e62274AF095df87Cc29115A4249),
        address(0x6f9BB7e454f5B3eb2310343f0E99269dC2BB8A1d),
        address(0x6fEdfDB4249Cd5DCA3030FD09E0E1368f23CB4F8),
        address(0x70B0Deeb4b1c98FCa3368325A3e8965001143c83),
        address(0x71a15Ac12ee91BF7c83D08506f3a3588143898B5),
        address(0x721A931746f0d85d4D5DF72B2d20b24A2fdBB07F),
        address(0x73075e2c5Ea7A30bc15fCa364a67CBb70A348f58),
        address(0x73E3766c7e445ddeB11787D61e8000a0c52FB739),
        address(0x75b21A583C7Ac7Cf64193b62E73dc4C597c5e7F7),
        address(0x7666148566dCFaafF444b3afe5E89b9C82009e93),
        address(0x76a059B6BfFa9EF53D7F10c3ACDb6aE4F7FD10D3),
        address(0x76Fd5E21650e0A179D79Eda03a08Cf97C1D56495),
        address(0x789E8DD02FfCCd7A753B048559d4FBeA1e1a1b7c),
        address(0x79994704b7C4388ee88A92874B78d0e44622CB64),
        address(0x7A7E5d6963bFc8d6055BE42E6b114F34C03F7d45),
        address(0x7C464002258EdC9913cCB23dE7f6F95193FEEb9D),
        address(0x7d96A6f41fd31C7624f7069415BE58b5e3576D34),
        address(0x7e8891718119647Ab464d5Dfd70f696F03402B74),
        address(0x7e8C520CB0B1Cedcc009113cb339f7F8247a3630),
        address(0x80795Df53Cd359d98ACba7348DB35CF301162F7d),
        address(0x81803c4a08088c35589A43955ceD5f5c24a1E980),
        address(0x81FA0f35b54790F78e76C74D05Bd6d95632C030b),
        address(0x8295918D123A6a27b064Bdcbb2F88eeE6bA3a4ff),
        address(0x8457bBdE947e827FF3DCA20D11aaD5643503B38E),
        address(0x86220aA5b12cb8eFb255F53e90e30bA6893cf059),
        address(0x86f0159Ab3a33EB9BD63ABBDbd6c2665010ee1d5),
        address(0x871061661C9AfE93307D956CBb6250813cdFECF9),
        address(0x87CdfB28868C5B02D9ea2dC8c09B6919Fd2C8a51),
        address(0x8a843023F1EEA0C96Ee1C76585EffdEeE4cd0d63),
        address(0x8B69F0e26355Fe3D0590328a6a2DeeDAB8536cB5),
        address(0x8Bf1852d591394ED9583B12e71434DF4d1C3A4d4),
        address(0x8bF3FD1368F511917416E9E7B5701724DdB61557),
        address(0x8C39f76b8A25563d84D8bbad76443b0E9CbB3D01),
        address(0x8D12B8c3bEf358d1901d891a74FA801aBa2b79B0),
        address(0x8dcB33D373966486885aA933c2dcb2B134bA9445),
        address(0x8e7A621813606a89E3975385f7dB8B3A0c1D6430),
        address(0x8e95dBc2008435C295e2f5222e1c3574683cb6Cf),
        address(0x8eaa1fd3604eA8dF8A91b981c478653eaeAEc404),
        address(0x8eB2E34552A618f92bA32E045a06529b186dC8Da),
        address(0x8f3ab67B3130AAe724104fF85Df628519b885CeB),
        address(0x8F99729DF9E57e1f927982cb803D004378b775bb),
        address(0x9152c860626D78AD4C2E2723452fcE3D1dBdbEf1),
        address(0x91e795eB6a2307eDe1A0eeDe84e6F0914f60a9C3),
        address(0x929d5AB51be0B6249D8E6A63E4802Ec20B2Ef17e),
        address(0x9376878e0a52a0A71570DB963467d789cFF44Fe2),
        address(0x948b1Ce64180e3d50489E7111194cf069e73785a),
        address(0x961870e8aA20DD1A6a5833d0854a6A5c4Ad77EC0),
        address(0x96E3e323966713a1f56dbb5D5bFabB28B2e4B428),
        address(0x979581C17a030F70e3B13129F2DdF2bC84a17a8E),
        address(0x97Ba2CCF0c43ef10a09B2C53DB0DF4572f18FE7C),
        address(0x98B2180e96cB483162E2aab070E38A0b03c34C7d),
        address(0x98B83B8286A0fB02031e72A77515575a9928E5B5),
        address(0x9a568bFeB8CB19e4bAfcB57ee69498D57D9591cA),
        address(0x9b616Ac1D31F17Be9B23560d93699cA7732e2808),
        address(0x9F29e950aAfd15f97f186EB5e37A96687E2C726B),
        address(0x9fF50A0f45Aa14Deb08C86d45139ee2F5Ffe099f),
        address(0xa05527778c5d874ff4926AF98d162E3fbf4d96DB),
        address(0xa0f75491720835b36edC92D06DDc468D201e9b73),
        address(0xa13B9db1587dB796829EeFa7718B98a5bEd7Ab35),
        address(0xa29d37532F393DC6616875D88635dA97aF557c40),
        address(0xA316CAF146A853f8af39477F8BEf800633936f44),
        address(0xA408a1E70a1aa0f2D20c51785c3153C1D4ae7b6C),
        address(0xA447663ED37a952580bAD82bA4De0BBf00ABd89A),
        address(0xA5D591875cE13D7abf04d63419e2970F0d51Aa51),
        address(0xa6B8f968389CfFF9c40B265F2214e43B98Fa44D5),
        address(0xA6B9F899beE09d940E3Fe5e40DCD1eCB6210CC19),
        address(0xA71B4045baad5653a00d1556313FF8fD6c9c704e),
        address(0xA789777851a67Fbf695c9bD87C36030Bb7EAb955),
        address(0xa7F0e234bC6deee1Fe06De391921B75971ED0889),
        address(0xa931b486F661540c6D709aE6DfC8BcEF347ea437),
        address(0xAAc13424b283A8DE742695E1aD02476E36EDcEF6),
        address(0xaaC7359Fb5D39Db6C562cACe5E0947b591F16fF5),
        address(0xAAF33a7e4756D097B2158551a25374Daf600c49D),
        address(0xAC0367375eC176d30f38DbC50904209F4dc67CF4),
        address(0xAcfa72D3f8C51F877F32da0d0E8f959AE37A64E3),
        address(0xAe692eB3bA02BEA99B94e4E608D3315F5330e635),
        address(0xAEdd430Db561575A8110991aE4CE61548e771199),
        address(0xB04F6b8694B051B598E16bB6A3Fa0214467aa8F4),
        address(0xB0cc91ff95715ab56b49b9eA84C8b4424A65BB21),
        address(0xB1f0e758951A02B24D04dd211d0424445Ae04c5C),
        address(0xB222752FfE62812ee77AA06F8F7d3aFA768101E7),
        address(0xB3172C3Fc1D0d15d7f412958f86c17A282a0A0C5),
        address(0xb3a9b31E0E678A9db4483BB19CE8298717cbd37f),
        address(0xB3d5Ad7895938Fd96Bf1A2D63f6cc78BCd25ad7f),
        address(0xB3f4F030bC9F8dD7624e39bDA342673bE7E0981A),
        address(0xB41FbD3Dc97e2e5E3757C11c62E8f4e11eDF705b),
        address(0xB60bdA0Bab52839A3334bd849D2afB2Aa566E631),
        address(0xb6955f00cC028F1D45C7868C0dDBAE4BB345626c),
        address(0xb6ADB8eC1dB32A4b6D42362b8E32f6CC0804Af31),
        address(0xb80433aCda106efc72D62A1D231C4d3f44CdD34b),
        address(0xB87c3425681B936bdb0c06c503EC22cE3EeA50Fc),
        address(0xB8F5fE695DE64a298Cd254e7a93b9a279D85DcEd),
        address(0xbA31c6d318F840340A4131a34b0069B2dd5eC8c9),
        address(0xBa97213cd25f277971e2B6DBa718D45EeDDb79F8),
        address(0xbAd1012ABC959FcD92D6eF2F59F143fB42e15773),
        address(0xbb3621a539895f5Dc6B54A231Ed30125Bb265C48),
        address(0xbb6B34131210C091cb2890b81fCe7103816324a5),
        address(0xBB6c1EE1e04Fa0bC445406C281fA6c97A163801b),
        address(0xBD1f7d88C76A86C60d41bDDD4819fAe404e7151E),
        address(0xBdd7EF6117c2a300d4D14B1E4C05F00beBf18045),
        address(0xbE102d2698b089e6e2A18c66281ECf29cF35d58e),
        address(0xBe432c37f4DD1548338e185A6AA5176e75BA1592),
        address(0xbEA07b01E8Fe3936A3D206158521A87addB65cfE),
        address(0xc0F6bd9F0BE7E08b51f65B82fC95A19Df826F0fE),
        address(0xc1c4cFC4C6df09B3D837C153014ACFdBD85e5Bc9),
        address(0xC2C37FB220Ca9f40BAbcd12E40cE651088fF613F),
        address(0xc337C76158c131beDf95a5D4e0C27EC8eFdb7f02),
        address(0xC3598d91844B061195136600AD243b077Cc164e2),
        address(0xc3Be098f9594E57A3e71f485a53d990FE3961fe5),
        address(0xC52eAf71CB5D91dbF4c508B5BA0503c4518FA768),
        address(0xC62EC81a1ecE67023f6bd3D5da1B47907a1D9f5b),
        address(0xC6Ebf8Ee3d6B387Ea6ec7F4C4cEbad99e27230a7),
        address(0xCa4D0e87E1401B9FE036CA6b46c46bE56925E136),
        address(0xcb408E5aa81EB7A759E244bC53ad35900Fa11557),
        address(0xCc9F61d9ca83E38eEfCCBac3A825AcBFab10B080),
        address(0xcffdEd2e943dfE2fca1d227e795c597864870fc2),
        address(0xD05471D614A7b0D1fCdA75c40dFb61Cb4AF2758D),
        address(0xd16295DEA1115C9df62FC35017bB359fb1E6d639),
        address(0xD1eFEd7d784634fc9A3237999487fc6315E0321A),
        address(0xD321Ee41540822CcA0C136F651DB81C4AF303bEa),
        address(0xD36782243731D84F7F59F393532B123DBba4A9D4),
        address(0xD39eDe02D333356E86759aC65686fD32ED2f4319),
        address(0xD4E26683635bf3dc9EAD5F31B935c33cC1Ce1838),
        address(0xd5329311ad1024e7EB2e7eD722bC22DA23cdA8ef),
        address(0xd699571A57D3Efe7c50369Fb5350448FA1ad246E),
        address(0xd6DBC45210ED9b2F096A77713Adb6Be1b097C453),
        address(0xD7a4ACaf3263EF2616AfE7773d538801ddA9b6B0),
        address(0xd874387eBb001a6B0BEa98072f8dE05f8965E51E),
        address(0xd97331D4a96b2139DEd3dA430c7621968D8149a6),
        address(0xD9AD275e9cf78d37982425024bd6Ec0eB1e1EE93),
        address(0xDA669BA5e1eEA30519098fA86AaF5e25bD9CF16B),
        address(0xDC513ee74C040213C50D39e516532748E84902e6),
        address(0xDC95764e664AA9f3E090494989231BD2486F5de0),
        address(0xdcb67E5e80e7411c451Ca9eDEEBcDE0CC9aF175B),
        address(0xdd7D5859824917560Ba0586F4A4df2a5Fcd9825A),
        address(0xdE0f4538010c538A1bCA467722E626475cE5F955),
        address(0xdF0635793e91D4F8e7426Dbd9Ed08471186F428D),
        address(0xDfA8ee9Ff8798B37800F3Ab18807273D7CaAF1b6),
        address(0xdfb2345cb3E38d515E4edF949EC21e09509f82A1),
        address(0xe15cf0EDe90e9059188fc8439014D1fFE29E0bbc),
        address(0xe480c1b7A4f2990B91fBDE616D4B4DCe06482b42),
        address(0xe4C8bEC115A3F4381e25Fe9b16f835643E43ccaa),
        address(0xe4e409194C7dF0972e6369a3548d1D0b6B92b488),
        address(0xE53cf4430E6afD6754a5a0a9d0cc34D715F90150),
        address(0xe54554b38DB81380243bB5C705fDE2a24018C8a9),
        address(0xe58Aa11A1AD425b12B4a3155124245cd36DA4f5e),
        address(0xe72AFd50bDECdf13e46d89E56AFa58b0d5698fDF),
        address(0xE864166688e95618920e32619753E23175f189ce),
        address(0xe9472FdFFaa6792df8Ff5FAaB5866C90DC7F6f22),
        address(0xe9ce2ed0D2bad6F082E3f346c7D52FA4B1B436da),
        address(0xEA20CaD24f6D2190ED8cA63d4E144699557F24cF),
        address(0xEC3e872bF997a17C3A05B575567a5B3F54fD4b7C),
        address(0xEE94Ad846860D3B7463249F382Fc9C36c033AB1F),
        address(0xEec8FefCecc0BF86bDa761dEA940C236b8e698C1),
        address(0xF12f9896b41D25520539f21217eE675fD9266CfF),
        address(0xf1d0d9c16193789f00bBFa14c068DAbfb5451d48),
        address(0xF1f8955E117E4F378e135215aaE452037680152B),
        address(0xF3E5FC84Fd8eB3bd1f2556A4cCB43253e177C553),
        address(0xf424Da7E5cd837e63ed5eF993611CC70a68dBa28),
        address(0xf48ED9a03fC6bb55949F08649Cb54D792928cDFE),
        address(0xf4accc554e0672F9381d0a97eAD1Ed80B4896DBD),
        address(0xF659FAAc0401CC19110321dcc7989c101CceD8E4),
        address(0xf6E2Da7D82ee49f76CE652bc0BeB546Cbe0Ea521),
        address(0xF8b4B764b79F7709253Efc47cC5B30350c283E34),
        address(0xF930b0A0500D8F53b2E7EFa4F7bCB5cc0c71067E),
        address(0xf989Be400e5d9bCb9054cA96BC560b8037Ce8D88),
        address(0xf9db64e6FDEE3770e6181C345a4AcF51b8607577),
        address(0xfB27C8582976F1A29d58e89Bcc89dA1e54D78076)
    ];

    address[] orthogonalCoverProviders = [
        address(0x04eB07C283Cd6d9bf237118e2732D8b6Ee5eE457),
        address(0x09F41c916B5C2e26706fEbf7c4666d2afE57419A),
        address(0x0BD1454fa01dD11bF6646BF8bc17a3E48Fda3734),
        address(0x0e8bC80BAeb4DE22e8bE1007EFDFaE79CD15EDF7),
        address(0x12Be641f6CE5d30E422e1573e0759496Dc127614),
        address(0x1e79F6714c7dFBb6504357786A2aaBb2304dE2DD),
        address(0x2291F52bddc937b5B840d15E551e1DA8C80c2B3c),
        address(0x26b4b3d787B9B763aDa19203059D621Bca3a870f),
        address(0x2e2E066432bA88688C83d9F62E8e5E0e25646a5D),
        address(0x39Fa9C5d71A0eCd684B6Ce62c5EE897a6D2874d2),
        address(0x468b84EfDf2AdFCEdde007403290E8FC396A0b3F),
        address(0x53e73538c28A96B68d92E5B049C3996BE048D3A2),
        address(0x554959af42454442370c782b9F2F7265D64Fb469),
        address(0x6ab791754298D6D6d7C182DC1572126B4eD24897),
        address(0x6bfd30747Ba72Ac7BB2f20D6138e1312020fAFe8),
        address(0x710fDB2dc7774A9755cA36070704D7B12625DfF5),
        address(0x7371Da5AC817C05547da65a84EACd72D653027AF),
        address(0x75A8c6047De5A6aC0a6f15438DFe32C9B97e2299),
        address(0x81FA0f35b54790F78e76C74D05Bd6d95632C030b),
        address(0x8476D9239fe38Ca683c6017B250112121cdB8D9B),
        address(0x86220aA5b12cb8eFb255F53e90e30bA6893cf059),
        address(0x8B311BCb95D12b98252b6c1b9f8752de79E8d50D),
        address(0x929A5753C41eaed288F946bCBFe4a954Ad341797),
        address(0x9376878e0a52a0A71570DB963467d789cFF44Fe2),
        address(0xA5D591875cE13D7abf04d63419e2970F0d51Aa51),
        address(0xA6cCb9483E3E7a737E3a4F5B72a1Ce51838ba122),
        address(0xb9648d93832cAbefA403145D99b15869834b04E3),
        address(0xBD235D7aAA1171B25c52B097F1daA36cd527C550),
        address(0xD591c28C3396008FFb936521C9ceb4cCcc801d27),
        address(0xD6F82502F20647dd8d78DFFb6AD7F8D8193d5e29),
        address(0xe015c0D33389e5F0382CceeC817CC3032edE113D),
        address(0xe72AFd50bDECdf13e46d89E56AFa58b0d5698fDF),
        address(0xeba98049A242D9788C2FE12B74F774080a17BF3e),
        address(0xF4Ae6165c3E05Ae7426c5B5200E8b9A7565aC595),
        address(0xF9107317B0fF77eD5b7ADea15e50514A3564002B)
    ];

    ILoanLike[] orthogonalLoans = [
        ILoanLike(0x0BEaA8B67B039DB80357Ef8336006FFdE144FD89),
        ILoanLike(0x1F1b8762CC4F8a2C637207E14Dea7A5C3FAD8bC1),
        ILoanLike(0x574054524D43cC85D040912b46f4038f05f54404),
        ILoanLike(0x5A595d84014602e787d16756E685024ccd449E5d),
        ILoanLike(0x7627d2285f0EEf60c22f2a2685657664804eC634),
        ILoanLike(0xaCcF086884D709f0bCa3791c16FC256DF309A8F4),
        ILoanLike(0xb43623a3c0501b026d099038d2De26e489d4A147),
        ILoanLike(0xb715372589b3aEf4ba6A0D6F154470F7a508696f)
    ];

    /******************************************************************************************************************************/
    /*** Icebreaker Finance - USDC                                                                                              ***/
    /******************************************************************************************************************************/

    ILoanLike                  icebreakerMigrationLoan         = ILoanLike(address(0));
    IPoolV1Like                icebreakerPoolV1                = IPoolV1Like(0x733f56782d21b403E5Ee9c8343645E1535F73CD4);
    IPoolV2Like                icebreakerPoolV2                = IPoolV2Like(address(0));
    IPoolManagerLike           icebreakerPoolManager           = IPoolManagerLike(address(0));
    IMplRewardsLike            icebreakerRewards               = IMplRewardsLike(address(0));
    IStakeLockerLike           icebreakerStakeLocker           = IStakeLockerLike(0x1dC467a44aE188fc3eee41d88A32511D261e511B);
    ITransitionLoanManagerLike icebreakerTransitionLoanManager = ITransitionLoanManagerLike(address(0));
    IWithdrawalManagerLike     icebreakerWithdrawalManager     = IWithdrawalManagerLike(address(0));

    address[] icebreakerLps = [
        address(0x009fDDE3E654Cb2495135708dc1590daeFb14Ea7),
        address(0x184e46651946B861654436027bffdC97f9a45079),
        address(0x221c7c5a448c87F6834818f255d28e5A8124C4A1)
    ];

    address[] icebreakerCoverProviders = [0x184e46651946B861654436027bffdC97f9a45079];

    ILoanLike[] icebreakerLoans;

}
