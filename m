Return-Path: <linux-remoteproc+bounces-1015-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1705F894F41
	for <lists+linux-remoteproc@lfdr.de>; Tue,  2 Apr 2024 11:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 496CD1C20A8F
	for <lists+linux-remoteproc@lfdr.de>; Tue,  2 Apr 2024 09:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4AD5914D;
	Tue,  2 Apr 2024 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lXqaysT1"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14875731E;
	Tue,  2 Apr 2024 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051805; cv=none; b=qb5haUIf/gERgiR46Gfne4e1mvLnoi+3q7A4QWo7rIETzIAxpd9c/1Bexel9RnnSMZwSgZUmUpEHj8tLnnlvlSVRY+aii+PJOiXIwLolb9Rgrl3dEDoxEboQSVK6mhGLBn3UWSccM9PLQLcuhjy6nHXbuAq43Ot3Ia2rnAu2Gp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051805; c=relaxed/simple;
	bh=j9p4SY1dLRpZ23VVMTRetjhW1vilDPZriFPu/5VOa3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8Xuy9o6Mjx1PgqktlqNaJGCBVv9galyBpQIWhNPhMH8kENkLjmA4nm/RZyyd2kfi+p3NOIkDN2YPtSO/nL1OQQ/oSJQJPTvm/bLbJ+e7gLCYMiOIkAw3vhnZzCBpWIAjbe+ezdDkU8ujUsVuaQY4ah0LSMcosjk+G3f6G2PWi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lXqaysT1; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712051802;
	bh=j9p4SY1dLRpZ23VVMTRetjhW1vilDPZriFPu/5VOa3k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lXqaysT19gYQIQ4HXXS9+ssUM9Zy9g48q/mVd8DC6sEORZqgkkXV8RmQgk6nB2XPa
	 Np3bJ129sch32/NnWUeHaBDt6JHtt40yI55d6X8prhtqjb99Rx66yqVPiRRoQibamp
	 Nd76QbCvsIHpkYFKXOfb0LQGDzg0yG5YIw67LHPiCjAsmYFsVRsMGUdNwGSG2jDCPD
	 eoEJnPNdMBBi/XEef+IVngTkQlntkIBWKNUglWC1WGF4yRDkr+uLScz50Pgb/H2QF+
	 CsrCSV5oZLTzE6NbAsf7YRI+7WQJ7yLOlY29nXxDsgv9DcRV7lJ9tstSX6ZkMmcFuZ
	 VfHu89DY6GjYw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F3EA137820EE;
	Tue,  2 Apr 2024 09:56:40 +0000 (UTC)
Message-ID: <b6ed8710-1608-4343-8a58-5f8e0e16d10d@collabora.com>
Date: Tue, 2 Apr 2024 11:56:40 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: mediatek: Don't parse extraneous subnodes
 for multi-core
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, matthias.bgg@gmail.com, tzungbi@kernel.org,
 tinghan.shen@mediatek.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, kernel@collabora.com
References: <20240321084614.45253-1-angelogioacchino.delregno@collabora.com>
 <20240321084614.45253-3-angelogioacchino.delregno@collabora.com>
 <ZfxRyMyUqyqtXy8n@p14s> <9ef4e974-740e-4698-bb38-f236521a425c@collabora.com>
 <ZgWA/E46i/CaoM74@p14s>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ZgWA/E46i/CaoM74@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 28/03/24 15:38, Mathieu Poirier ha scritto:
> On Wed, Mar 27, 2024 at 01:49:58PM +0100, AngeloGioacchino Del Regno wrote:
>> Il 21/03/24 16:27, Mathieu Poirier ha scritto:
>>> On Thu, Mar 21, 2024 at 09:46:14AM +0100, AngeloGioacchino Del Regno wrote:
>>>> When probing multi-core SCP, this driver is parsing all sub-nodes of
>>>> the scp-cluster node, but one of those could be not an actual SCP core
>>>> and that would make the entire SCP cluster to fail probing for no good
>>>> reason.
>>>>
>>>> To fix that, in scp_add_multi_core() treat a subnode as a SCP Core by
>>>> parsing only available subnodes having compatible "mediatek,scp-core".
>>>>
>>>> Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    drivers/remoteproc/mtk_scp.c | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
>>>> index 67518291a8ad..fbe1c232dae7 100644
>>>> --- a/drivers/remoteproc/mtk_scp.c
>>>> +++ b/drivers/remoteproc/mtk_scp.c
>>>> @@ -1096,6 +1096,9 @@ static int scp_add_multi_core(struct platform_device *pdev,
>>>>    	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
>>>>    	for_each_available_child_of_node(np, child) {
>>>> +		if (!of_device_is_compatible(child, "mediatek,scp-core"))
>>>> +			continue;
>>>> +
>>>
>>> Interesting - what else gets stashed under the remote processor node?  I don't
>>> see anything specified in the bindings.
>>>
>>
>> Sorry for the late reply - well, in this precise moment in time, upstream,
>> nothing yet.
>>
>> I have noticed this while debugging some lockups and wanted to move the scp_adsp
>> clock controller node as child of the SCP node (as some of those clocks are located
>> *into the SCP's CFG register space*, and it's correct for that to be a child as one
>> of those do depend on the SCP being up - and I'll spare you the rest) and noticed
>> the unexpected behavior, as the SCP driver was treating those as an SCP core.
>>
>> There was no kernel panic, but the SCP would fail probing.
>>
>> This is anyway a missed requirement ... for platforms that want *both* two SCP
>> cores *and* the AudioDSP, as that'd at least be two nodes with the same iostart
>> (scp@1072000, clock-controller@1072000), other than the reasons I explained some
>> lines back.
>>
>> ...and that's why this commit was sent :-)
>>
> 
> Please update the bindings with the extra clock requirement in your next
> revision.
> 

Ok.

Can you please take only patch 1/2 of this series so that I can delay this one
for a bit? I don't have time to work on that exactly right now.

Thanks,
Angelo



