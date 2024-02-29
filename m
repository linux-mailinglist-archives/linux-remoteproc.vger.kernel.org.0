Return-Path: <linux-remoteproc+bounces-645-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B85486D784
	for <lists+linux-remoteproc@lfdr.de>; Fri,  1 Mar 2024 00:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22BF7287A58
	for <lists+linux-remoteproc@lfdr.de>; Thu, 29 Feb 2024 23:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68D6200D6;
	Thu, 29 Feb 2024 23:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJmcCson"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB62D4595C
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Feb 2024 23:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709247899; cv=none; b=mPzMW511NBs8gMNawsiw5sVFXCD3rZL4XG10hWhnjTcQFJ08vfa4+LJ0HDLALDPW6tpqsyx2ITa2NsuP/sVRdkXtipzjWDfIwY72T1GjJzefPUXGncoEBkDSneIFkgzabcCJ5vSrCmBss19oJG5B6SJ2nJEDqfyQ+zUcZ2Cv+sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709247899; c=relaxed/simple;
	bh=qf2lT77fKGu4LWHZCRb6Z0Uv6eDUPOBbSOeOXdp1Rms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CcOdKvYDav5cbVR0AxOauBun9fw2ME3FJUKuCx9tOI5eWdq/pX9ROkRcWySSn8AhtmSA3tHPUmgBeF9YGEUR3V2gSobqaKGyLS72X8WhYXv7ST5uUs/wFc3N56cqbxVPWsTwtwyvXzAXbwSsjWuibizzL/dL838A+t2i/YGZJNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DJmcCson; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so2589864276.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Feb 2024 15:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709247896; x=1709852696; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TIJPcII4p8qLU28ntWv9B/bdbUcLOsFsvs30Qwk+hM0=;
        b=DJmcCsonEorFPCfUzBx3VhY4RbP7p2DrzkwWp88JMdKmqPdXJGh/W+whoTx8ap9CDu
         Xaf6WgBy9Nwy2op7g+QxxVtHWIhTEPg5UYDWU8V0eK818hWstPBtDpwrMR0WzAVWVGCm
         V46zHkoGGbOnKT8K9+OdUmiNBd3OLwCF6iaWnWlxXEGLF0u7bt+HB0UIQ+oMaOIpuzSy
         L7YEJ4BUkILtyq6KEde52rDDAC017oa2XZAQg1Mp9MtTYZWUANY5vxdUO+ZNvc4aoL7A
         MK66BSvtTQMtgupiu4WmQaDBeAPR8JMVmQw7RCL6kasHVL/+lyjm2k5WmVVIrFxttvk6
         Wfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709247896; x=1709852696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIJPcII4p8qLU28ntWv9B/bdbUcLOsFsvs30Qwk+hM0=;
        b=qCA94UALKA6VJsDRrBjkjXAn1QCoYcrX1/bSbXKrWLxVoejKbGgF70tD6xbz+tn3gb
         C9D3xxIbXrX+CfQ7pqxNnqduJwQdWfktNZAA/t3MprEGTGxPtAbPjxNTEXgYSsJhw564
         sbd/wnLkNeUQmwdSo7nR2bcB1IKKvVldunjjhJ1gDEIT+CgTlx3p/0V1zk/wdONnWuf5
         62HjUPZgXWNaOWaEGx8HhJEQvpfdHwk2BpC1tk6l8VISeYxHr79PPXhwkADb9oKDrnfy
         u9BcMyOk35Fgw6YQAHCCRothP2q2UXjUsaxlPmvUxnw044rmF3+EkFYGz40X3tHhc8Mb
         4T4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMD5+XSO4Gyx5kHLCEN7PvPABbFgXO6jeg/GVliT440Ssu1vtgQEyDFw+r80VPUrIncxF500Mtsxi+XU3cYCvCQbaj4zNSFMyViz9Lny3eKw==
X-Gm-Message-State: AOJu0Yx2El6P79RZ0c4mReC+FpvQ9IeitAeYBpwaE6ZoJ2XHphhfHVYU
	XgNlzzDJY1gDW6iNgeyRN5yxp3Bv5klYz18ydDUsi+OjlrCIDlS+TeE8UMUDSW3SxyJU7C6KhIi
	nY2Hoz4c4Nsk4Cm0R3fGu/l6MemjeJt7Wz5Jd7g==
X-Google-Smtp-Source: AGHT+IE6Rr1X3iSsGfV7fPNpU5Z4YEkUFvT6flP8+HUcvfagu6f0FwNRvFzk6jFDXzzDQkFQ+G69AIp01zdRtM7RIb4=
X-Received: by 2002:a25:dc8e:0:b0:dc2:a46:3d29 with SMTP id
 y136-20020a25dc8e000000b00dc20a463d29mr2961673ybe.9.1709247895737; Thu, 29
 Feb 2024 15:04:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org> <20240301-qcom-pd-mapper-v2-3-5d12a081d9d1@linaro.org>
In-Reply-To: <20240301-qcom-pd-mapper-v2-3-5d12a081d9d1@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Mar 2024 01:04:43 +0200
Message-ID: <CAA8EJpr4w_x9hacWgX4W7C2FpNPTMaAjfMY8W0MZ6131Bw3bdA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/5] remoteproc: qcom: adsp: add configuration for
 in-kernel pdm
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Mar 2024 at 01:00, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add domain / service configuration for the in-kernel protection domain
> mapper service.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/remoteproc/Kconfig          |  1 +
>  drivers/remoteproc/qcom_q6v5_adsp.c | 87 +++++++++++++++++++++++++++++++++++--
>  2 files changed, 84 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 48845dc8fa85..f1698d4c302e 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -181,6 +181,7 @@ config QCOM_Q6V5_ADSP
>         depends on QCOM_SYSMON || QCOM_SYSMON=n
>         depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
>         depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
> +       depends on QCOM_PD_MAPPER || QCOM_PD_MAPPER=n
>         select MFD_SYSCON
>         select QCOM_PIL_INFO
>         select QCOM_MDT_LOADER
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 93f9a1537ec6..5751bcb0c285 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -23,6 +23,7 @@
>  #include <linux/remoteproc.h>
>  #include <linux/reset.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> +#include <linux/soc/qcom/pd_mapper.h>
>  #include <linux/soc/qcom/smem.h>
>  #include <linux/soc/qcom/smem_state.h>
>
> @@ -75,6 +76,9 @@ struct adsp_pil_data {
>         const char **pd_names;
>         unsigned int num_pds;
>         const char *load_state;
> +
> +       const struct qcom_pdm_domain_data * const *domains;
> +       size_t num_domains;
>  };
>
>  struct qcom_adsp {
> @@ -116,6 +120,9 @@ struct qcom_adsp {
>         struct qcom_sysmon *sysmon;
>
>         int (*shutdown)(struct qcom_adsp *adsp);
> +
> +       const struct qcom_pdm_domain_data * const *domains;
> +       size_t num_domains;
>  };
>
>  static int qcom_rproc_pds_attach(struct qcom_adsp *adsp, const char **pd_names,
> @@ -374,6 +381,7 @@ static int adsp_start(struct rproc *rproc)
>         struct qcom_adsp *adsp = rproc->priv;
>         int ret;
>         unsigned int val;
> +       int i;
>
>         ret = qcom_q6v5_prepare(&adsp->q6v5);
>         if (ret)
> @@ -434,8 +442,18 @@ static int adsp_start(struct rproc *rproc)
>                 goto disable_adsp_clks;
>         }
>
> +       for (i = 0; i < adsp->num_domains; i++) {
> +               ret = qcom_pdm_add_domain(adsp->domains[i]);
> +               if (ret)
> +                       goto err_domains;
> +       }
> +
>         return 0;
>
> +err_domains:
> +       while (--i >= 0)
> +               qcom_pdm_del_domain(adsp->domains[i]);
> +
>  disable_adsp_clks:
>         clk_bulk_disable_unprepare(adsp->num_clks, adsp->clks);
>  disable_power_domain:
> @@ -463,6 +481,10 @@ static int adsp_stop(struct rproc *rproc)
>         struct qcom_adsp *adsp = rproc->priv;
>         int handover;
>         int ret;
> +       int i;
> +
> +       for (i = 0; i < adsp->num_domains; i++)
> +               qcom_pdm_del_domain(adsp->domains[i]);
>
>         ret = qcom_q6v5_request_stop(&adsp->q6v5, adsp->sysmon);
>         if (ret == -ETIMEDOUT)
> @@ -690,6 +712,8 @@ static int adsp_probe(struct platform_device *pdev)
>         adsp->rproc = rproc;
>         adsp->info_name = desc->sysmon_name;
>         adsp->has_iommu = desc->has_iommu;
> +       adsp->domains = desc->domains;
> +       adsp->num_domains = desc->num_domains;
>
>         platform_set_drvdata(pdev, adsp);
>
> @@ -764,7 +788,56 @@ static void adsp_remove(struct platform_device *pdev)
>         rproc_free(adsp->rproc);
>  }
>
> -static const struct adsp_pil_data adsp_resource_init = {
> +static const struct qcom_pdm_domain_data adsp_audio_pd = {
> +       .domain = "msm/adsp/audio_pd",
> +       .instance_id = 74,
> +       .services = {
> +               "avs/audio",
> +               NULL,
> +       },
> +};
> +
> +static const struct qcom_pdm_domain_data adsp_charger_pd = {
> +       .domain = "msm/adsp/charger_pd",
> +       .instance_id = 74,
> +       .services = { NULL },
> +};
> +
> +static const struct qcom_pdm_domain_data adsp_root_pd = {
> +       .domain = "msm/adsp/root_pd",
> +       .instance_id = 74,
> +       .services = { NULL },
> +};
> +
> +static const struct qcom_pdm_domain_data adsp_sensor_pd = {
> +       .domain = "msm/adsp/sensor_pd",
> +       .instance_id = 74,
> +       .services = { NULL },
> +};
> +
> +static const struct qcom_pdm_domain_data *sc7280_adsp_domains[] = {
> +       &adsp_audio_pd,
> +       &adsp_root_pd,
> +       &adsp_charger_pd,
> +       &adsp_sensor_pd
> +};
> +
> +static const struct qcom_pdm_domain_data cdsp_root_pd = {
> +       .domain = "msm/cdsp/root_pd",
> +       .instance_id = 76,
> +       .services = { NULL },
> +};
> +
> +static const struct qcom_pdm_domain_data *qcs404_cdsp_domains[] = {
> +       &cdsp_root_pd,
> +};
> +
> +static const struct qcom_pdm_domain_data *sdm845_adsp_domains[] = {
> +       &adsp_audio_pd,
> +       &adsp_root_pd,
> +};
> +
> +static const struct adsp_pil_data adsp_sdm845_resource_init = {
>         .crash_reason_smem = 423,
>         .firmware_name = "adsp.mdt",
>         .ssr_name = "lpass",
> @@ -779,6 +852,8 @@ static const struct adsp_pil_data adsp_resource_init = {
>         .num_clks = 7,
>         .pd_names = (const char*[]) { "cx" },
>         .num_pds = 1,
> +       .domains = sdm845_adsp_domains,
> +       .num_domains = ARRAY_SIZE(sdm845_adsp_domains),
>  };
>
>  static const struct adsp_pil_data adsp_sc7280_resource_init = {
> @@ -794,9 +869,11 @@ static const struct adsp_pil_data adsp_sc7280_resource_init = {
>                 "gcc_cfg_noc_lpass", NULL
>         },
>         .num_clks = 1,
> +       .domains = sc7280_adsp_domains,
> +       .num_domains = ARRAY_SIZE(sc7280_adsp_domains),
>  };
>
> -static const struct adsp_pil_data cdsp_resource_init = {
> +static const struct adsp_pil_data cdsp_qcs404_resource_init = {
>         .crash_reason_smem = 601,
>         .firmware_name = "cdsp.mdt",
>         .ssr_name = "cdsp",
> @@ -831,10 +908,10 @@ static const struct adsp_pil_data wpss_resource_init = {
>  };
>
>  static const struct of_device_id adsp_of_match[] = {
> -       { .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_resource_init },
> +       { .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_qcs404_resource_init },
>         { .compatible = "qcom,sc7280-adsp-pil", .data = &adsp_sc7280_resource_init },
>         { .compatible = "qcom,sc7280-wpss-pil", .data = &wpss_resource_init },
> -       { .compatible = "qcom,sdm845-adsp-pil", .data = &adsp_resource_init },
> +       { .compatible = "qcom,sdm845-adsp-pil", .data = &adsp_sdm845_resource_init },
>         { },
>  };
>  MODULE_DEVICE_TABLE(of, adsp_of_match);
> @@ -846,6 +923,8 @@ static struct platform_driver adsp_pil_driver = {
>                 .name = "qcom_q6v5_adsp",
>                 .of_match_table = adsp_of_match,
>         },
> +       .domains = qcs404_cdsp_domains,
> +       .num_domains = ARRAY_SIZE(qcs404_cdsp_domains),

This is a rogue chunk, please drop it if you were to test the series.
I'll drop it for v3.

>  };
>
>  module_platform_driver(adsp_pil_driver);
>
> --
> 2.39.2
>


-- 
With best wishes
Dmitry

