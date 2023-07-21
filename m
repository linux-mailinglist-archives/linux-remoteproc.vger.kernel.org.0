Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1716475BF62
	for <lists+linux-remoteproc@lfdr.de>; Fri, 21 Jul 2023 09:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjGUHOm (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 21 Jul 2023 03:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGUHOl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 21 Jul 2023 03:14:41 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A942710;
        Fri, 21 Jul 2023 00:14:39 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36L6Vr21026911;
        Fri, 21 Jul 2023 07:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=sfOPu6GrGESxmLaVpll2FfMbLdUhj1O3QpCA3VqTshg=;
 b=GXZYdvkeOfZHyk/Z11qDeJVQQ2PHxnv/aY2zQml8BgTkRTNUQwpoTgQSIttuxl0WpGuy
 EwQrPqnglYwy2JSfYn8Rs+im72K/LQzWH+Fd/b8KaXcq7HH2qdA0DFgS8uaBZ0Jhg63+
 apWSAAIh1Pn85yWvWuQq4LTHppcWVDSxCwAeQvkjnMW9So8HrO9PC0hkiTx9WAPaPymT
 e5hdP5ROa9gnRhcEIgDZm24lHX7rvuWhcIbS2QYLraER0RpmL+lbbCL26VAAPdakp7Ki
 bW0cd+46ydVuZOLykwb22mpdc7NLQQ6MYkV3lzW35DEQOLx9FTdUnq2tz3510OiOBUjJ zA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rxxqv326f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jul 2023 07:14:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36L7EXB6018814
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Jul 2023 07:14:33 GMT
Received: from [10.216.60.229] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 00:14:25 -0700
Message-ID: <a996fcc8-381d-6534-8b08-549c4ecfb748@quicinc.com>
Date:   Fri, 21 Jul 2023 12:44:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [V3,09/11] remoteproc: qcom: Add Hexagon based multipd rproc
 driver
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <mathieu.poirier@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <quic_eberman@quicinc.com>, <kvalo@kernel.org>,
        <loic.poulain@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     <quic_srichara@quicinc.com>, <quic_sjaganat@quicinc.com>,
        <quic_kathirav@quicinc.com>, <quic_anusha@quicinc.com>
References: <20230718120501.3205661-1-quic_mmanikan@quicinc.com>
 <20230718120501.3205661-10-quic_mmanikan@quicinc.com>
 <fedea75a-a5f1-fbe4-7f12-75bfdf9bfcf2@linaro.org>
From:   Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <fedea75a-a5f1-fbe4-7f12-75bfdf9bfcf2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: v_qB3oT3zJhA4Gp-k8yxQPlJ2zqidWrq
X-Proofpoint-GUID: v_qB3oT3zJhA4Gp-k8yxQPlJ2zqidWrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-21_04,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307210063
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 7/19/2023 12:56 PM, Krzysztof Kozlowski wrote:
> On 18/07/2023 14:04, Manikanta Mylavarapu wrote:
>> It adds support to bring up remoteproc's on multipd model.
>> Pd means protection domain. It's similar to process in Linux.
>> Here QDSP6 processor runs each wifi radio functionality on a
>> separate process. One process can't access other process
>> resources, so this is termed as PD i.e protection domain.
>>
>> Here we have two pd's called root and user pd. We can correlate
>> Root pd as root and user pd as user in linux. Root pd has more
>> privileges than user pd. Root will provide services to user pd.
>>
> 
> 
>> +static int q6_get_inbound_irq(struct qcom_q6v5 *q6,
>> +			      struct platform_device *pdev,
>> +			      const char *int_name,
>> +			      int index, int *pirq,
>> +			      irqreturn_t (*handler)(int irq, void *data))
>> +{
>> +	int ret, irq;
>> +	char *interrupt, *tmp = (char *)int_name;
>> +	struct q6_wcss *wcss = q6->rproc->priv;
>> +
>> +	irq = platform_get_irq(pdev, index);
>> +	if (irq < 0) {
>> +		if (irq != -EPROBE_DEFER)
>> +			dev_err_probe(&pdev->dev, irq,
>> +				      "failed to retrieve %s IRQ: %d\n",
>> +				      int_name, irq);
> 
> Wait, what? This does not make any sense. dev_err_probe is to replace
> all this dance. return dev_err_probe which I explicitly asked last time:
> 
> https://lore.kernel.org/all/2061a641-4b97-1aa6-27cd-99f01a785033@linaro.org/
> 
>> +		return irq;
>> +	}
>> +
>> +	*pirq = irq;
>> +
>> +	interrupt = devm_kzalloc(&pdev->dev, BUF_SIZE, GFP_KERNEL);
>> +	if (!interrupt)
>> +		return -ENOMEM;
>> +
>> +	snprintf(interrupt, BUF_SIZE, "q6v5_wcss_userpd%d_%s", wcss->pd_asid, tmp);
>> +
>> +	ret = devm_request_threaded_irq(&pdev->dev, *pirq,
>> +					NULL, handler,
>> +					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>> +					interrupt, q6);
>> +	if (ret) {
>> +		dev_err_probe(&pdev->dev, ret,
>> +			      "failed to acquire %s irq\n", interrupt);
>> +		return ret;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int q6_get_outbound_irq(struct qcom_q6v5 *q6,
>> +			       struct platform_device *pdev,
>> +			       const char *int_name)
>> +{
>> +	struct qcom_smem_state *tmp_state;
>> +	unsigned  bit;
>> +
>> +	tmp_state = qcom_smem_state_get(&pdev->dev, int_name, &bit);
>> +	if (IS_ERR(tmp_state)) {
>> +		dev_err_probe(&pdev->dev, IS_ERR(tmp_state),
>> +			      "failed to acquire %s state\n", int_name);
>> +		return PTR_ERR(tmp_state);
> 
> So it is everywhere...
> 
> 
>> +	}
>> +
>> +	if (!strcmp(int_name, "stop")) {
>> +		q6->state = tmp_state;
>> +		q6->stop_bit = bit;
>> +	} else if (!strcmp(int_name, "spawn")) {
>> +		q6->spawn_state = tmp_state;
>> +		q6->spawn_bit = bit;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int init_irq(struct qcom_q6v5 *q6,
>> +		    struct platform_device *pdev, struct rproc *rproc,
>> +		    int crash_reason, const char *load_state,
>> +		    void (*handover)(struct qcom_q6v5 *q6))
>> +{
>> +	int ret;
>> +	struct q6_wcss *wcss = rproc->priv;
>> +
>> +	q6->rproc = rproc;
>> +	q6->dev = &pdev->dev;
>> +	q6->crash_reason = crash_reason;
>> +	q6->handover = handover;
>> +
>> +	init_completion(&q6->start_done);
>> +	init_completion(&q6->stop_done);
>> +	init_completion(&q6->spawn_done);
>> +
>> +	ret = q6_get_outbound_irq(q6, pdev, "stop");
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = q6_get_outbound_irq(q6, pdev, "spawn");
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Get pd_asid to prepare interrupt names */
>> +	wcss->pd_asid = qcom_get_pd_asid(rproc);
>> +
>> +	ret = q6_get_inbound_irq(q6, pdev, "fatal", 0, &q6->fatal_irq,
>> +				 q6v5_fatal_interrupt);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = q6_get_inbound_irq(q6, pdev, "ready", 1, &q6->ready_irq,
>> +				 q6v5_ready_interrupt);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = q6_get_inbound_irq(q6, pdev, "stop-ack", 3, &q6->stop_irq,
>> +				 q6v5_stop_interrupt);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = q6_get_inbound_irq(q6, pdev, "spawn-ack", 2, &q6->spawn_irq,
>> +				 q6v5_spawn_interrupt);
>> +	if (ret)
>> +		return ret;
>> +	return 0;
>> +}
>> +
>> +static void q6_release_resources(struct platform_device *pdev)
>> +{
>> +	struct rproc *upd_rproc;
>> +	struct device_node *upd_np;
>> +	struct platform_device *upd_pdev;
>> +
>> +	/* Release userpd resources */
>> +	for_each_available_child_of_node(pdev->dev.of_node, upd_np) {
> 
> You should not iterate over OF to get devices to unregister. What if you
> have more nodes than before because of overlay?
> 
> 
Yeah correct, i won't iterate over OF to get devices.

>> +		upd_pdev = of_find_device_by_node(upd_np);
>> +		if (!upd_pdev)
>> +			continue;
>> +
>> +		upd_rproc = platform_get_drvdata(upd_pdev);
>> +		if (!upd_rproc) {
>> +			platform_device_unregister(upd_pdev);
>> +			continue;
>> +		}
>> +
>> +		rproc_del(upd_rproc);
>> +		rproc_free(upd_rproc);
>> +	}
>> +}
>> +
>> +static int q6_register_userpd(struct platform_device *pdev)
>> +{
>> +	struct q6_wcss *wcss;
>> +	struct rproc *rproc = NULL;
>> +	int ret;
>> +	struct device_node *userpd_np;
>> +	struct platform_device *userpd_pdev;
>> +	const char *firmware_name = NULL;
>> +
>> +	for_each_available_child_of_node(pdev->dev.of_node, userpd_np) {
>> +		ret = of_property_read_string(userpd_np, "firmware-name",
>> +					      &firmware_name);
>> +		if (ret < 0)
>> +			continue;
>> +
>> +		dev_info(&pdev->dev, "%s node found\n", userpd_np->name);
>> +
>> +		userpd_pdev = of_platform_device_create(userpd_np,
>> +							userpd_np->name,
>> +							&pdev->dev);
>> +		if (!userpd_pdev) {
>> +			ret = -ENODEV;
>> +			dev_err_probe(&pdev->dev, ret,
>> +				      "failed to create %s platform device\n",
>> +				      userpd_np->name);
>> +			goto release_resource;
>> +		}
>> +		userpd_pdev->dev.driver = pdev->dev.driver;
>> +		rproc = rproc_alloc(&userpd_pdev->dev, userpd_pdev->name,
>> +				    &wcss_ops, firmware_name,
>> +				    sizeof(*wcss));
>> +		if (!rproc) {
>> +			ret = -ENOMEM;
>> +			goto release_resource;
>> +		}
>> +
>> +		wcss = rproc->priv;
>> +		wcss->dev = &userpd_pdev->dev;
>> +
>> +		ret = q6_alloc_memory_region(wcss);
>> +		if (ret)
> 
> How do you release the resource allocated in rproc_alloc() for this
> node? drvdata is not set, so your cleanup function will skip it.
> 
Yeah correct. I will free the rproc pointer and call cleanup API
to unregister platform device.

Is it fine ?

Thanks & Regards,
Manikanta.

>> +			goto release_resource;
>> +
>> +		ret = init_irq(&wcss->q6, userpd_pdev, rproc,
>> +			       WCSS_CRASH_REASON, NULL, NULL);
>> +		if (ret)
>> +			goto release_resource;
>> +
>> +		rproc->auto_boot = false;
>> +		ret = rproc_add(rproc);
>> +		if (ret)
>> +			goto release_resource;
>> +
>> +		platform_set_drvdata(userpd_pdev, rproc);
>> +		qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, userpd_pdev->name);
>> +	}
>> +	return 0;
>> +
>> +release_resource:
>> +	q6_release_resources(pdev);
>> +	return ret;
>> +}
>> +
>> +static int q6_wcss_probe(struct platform_device *pdev)
>> +{
>> +	const struct wcss_data *desc;
>> +	struct q6_wcss *wcss;
>> +	struct rproc *rproc;
>> +	int ret;
>> +	char *subdev_name;
>> +	const char **firmware;
>> +
>> +	desc = of_device_get_match_data(&pdev->dev);
>> +	if (!desc)
>> +		return -EINVAL;
>> +
>> +	firmware = devm_kcalloc(&pdev->dev, MAX_FIRMWARE,
>> +				sizeof(*firmware), GFP_KERNEL);
>> +	if (!firmware)
>> +		return -ENOMEM;
>> +
>> +	ret = of_property_read_string_array(pdev->dev.of_node, "firmware-name",
>> +					    firmware, MAX_FIRMWARE);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	rproc = rproc_alloc(&pdev->dev, pdev->name, desc->ops,
>> +			    firmware[0], sizeof(*wcss));
>> +	if (!rproc)
>> +		return -ENOMEM;
>> +
>> +	wcss = rproc->priv;
>> +	wcss->dev = &pdev->dev;
>> +	wcss->desc = desc;
>> +	wcss->firmware = firmware;
>> +
>> +	ret = q6_alloc_memory_region(wcss);
>> +	if (ret)
>> +		goto free_rproc;
>> +
>> +	ret = desc->init_irq(&wcss->q6, pdev, rproc,
>> +			     desc->crash_reason_smem, NULL, NULL);
>> +	if (ret)
>> +		goto free_rproc;
>> +
>> +	if (desc->glink_subdev_required)
>> +		qcom_add_glink_subdev(rproc, &wcss->glink_subdev, desc->ssr_name);
>> +
>> +	subdev_name = (char *)(desc->ssr_name ? desc->ssr_name : pdev->name);
> 
> Wrong cast. Why are you dropping const? That's a bug.
> 
>> +	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, subdev_name);
>> +
>> +	rproc->auto_boot = false;
>> +	ret = rproc_add(rproc);
>> +	if (ret)
>> +		goto free_rproc;
>> +
>> +	platform_set_drvdata(pdev, rproc);
>> +
>> +	ret = q6_register_userpd(pdev);
>> +	if (ret) {
>> +		dev_err_probe(&pdev->dev, ret, "Failed to register userpd\n");
>> +		return ret;
> 
> return dev_err_probe
> 
>> +	}
>> +
>> +	return 0;
>> +
>> +free_rproc:
>> +	rproc_free(rproc);
>> +
>> +	return ret;
> 
> Best regards,
> Krzysztof
> 
