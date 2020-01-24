Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF2401475BE
	for <lists+linux-remoteproc@lfdr.de>; Fri, 24 Jan 2020 01:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729678AbgAXAxN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 23 Jan 2020 19:53:13 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41135 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729425AbgAXAxM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Jan 2020 19:53:12 -0500
Received: by mail-pg1-f194.google.com with SMTP id x8so117269pgk.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jan 2020 16:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=82i4ghdDNZSMUmCjzDqbYDjwMvaFAElG5B2IOllLw+E=;
        b=bYRRSg4+JXSgNM7bME3TTTkUthQOkALZhNe97sgdt+wM0r2I/H2lJiVbE3Ac3Lq7Aj
         VvFifd3WPCotuW6FsNPQ72tTi+1C4M/JNpEkq3QbJim2u2TYYzp3ERZdpUpkxHByYZn4
         xj94t0YNd4tstA0WDLDDYOnp+Amho8zXg4qBZS/5mRKwvXQx+NCkn9m/0iojQKM5s+SM
         qPJxF/QHqIIqF/bx1QR52+akoDjLz/oYfFPagZEXmKJJeWTOQ336q6+0DiXNJcNJXVqK
         29Kg7jJuzLLihmiyNz2JrQ1HupR/BGeqBJ32GqRbjkx93ITiSw+gaNYIb1rOyuD8yDUR
         +ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=82i4ghdDNZSMUmCjzDqbYDjwMvaFAElG5B2IOllLw+E=;
        b=cEDBWhcavxYNL6Ao3g4DK/6hTIrIk+3MtXeI/6HqcbVGhx19bY71fnW1Fz3XTb1Y8x
         MmkZhKU+alVISEdJFuqByx5VJIQhteEjl8F5Ky7G6UhyEqXaJoC++Ouj5k60704N5O7M
         c3n5taDvGyFnKUDJ51sbU7+Q9Mj+NSiX1yBBMUxg3okAlo/CzQwTWMfqyHeNm49ve0Uq
         xDvo2P5PfE42x9kp2aNzERH4CJuPw5n/r8DHiMhocbht68j8F5WD+C4qqUngGH7klXPy
         pj40IuIRIHaeLI2KkNVL+hEcr8l6saeq0ufsjcPLYUbWTsgyE+qyVGYCtVmI8NOCoxX7
         Pxgg==
X-Gm-Message-State: APjAAAV0fGiQkjfCIfBZkHV0C/2PUpDf0efdO6MfT8kzbZsgCoIQapkW
        pJ3A5+g00V+e2GlhDOs6WhoisA==
X-Google-Smtp-Source: APXvYqxPQLYbCG3Qzw20vWN1uRCqG7av1XqvVJNetF3tJ/ydHy5zOHFPXC0llO24jb9Am+sroPH1ww==
X-Received: by 2002:a65:4d46:: with SMTP id j6mr1228483pgt.63.1579827191657;
        Thu, 23 Jan 2020 16:53:11 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id u12sm3906790pfm.165.2020.01.23.16.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 16:53:11 -0800 (PST)
Date:   Thu, 23 Jan 2020 17:53:09 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Clement Leger <cleger@kalray.eu>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Loic PALLARDY <loic.pallardy@st.com>
Subject: Re: [PATCH v2] remoteproc: Add elf64 support in elf loader
Message-ID: <20200124005309.GA30148@xps15>
References: <20190819114516.28665-1-cleger@kalray.eu>
 <20191004184220.24817-1-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004184220.24817-1-cleger@kalray.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Clement,

On Fri, Oct 04, 2019 at 08:42:20PM +0200, Clement Leger wrote:
> elf32 and elf64 mainly differ by their types. In order to avoid
> copy/pasting the whole loader code, generate static inline functions
> which will access values according to the elf class. It allows to keep a
> common loader basis.
> In order to accomodate both elf types sizes, the maximum size for a
> elf header member is chosen using the maximum value of both elf class.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>
> Tested-by: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
> ---
> Changes in v2:
>  - Add ELF64 support in documentation
>

First and foremost please address the complaints from checkpatch.
 
> ---
>  Documentation/remoteproc.txt               |   2 +-
>  drivers/remoteproc/remoteproc_elf_loader.c | 135 ++++++++++++++++++-----------
>  drivers/remoteproc/remoteproc_elf_loader.h |  69 +++++++++++++++
>  drivers/remoteproc/remoteproc_internal.h   |   2 +-
>  drivers/remoteproc/st_remoteproc.c         |   2 +-
>  include/linux/remoteproc.h                 |   4 +-
>  6 files changed, 157 insertions(+), 57 deletions(-)
>  create mode 100644 drivers/remoteproc/remoteproc_elf_loader.h
> 
> diff --git a/Documentation/remoteproc.txt b/Documentation/remoteproc.txt
> index 77fb03acdbb4..bf4f0c41ec4e 100644
> --- a/Documentation/remoteproc.txt
> +++ b/Documentation/remoteproc.txt
> @@ -230,7 +230,7 @@ in the used rings.
>  Binary Firmware Structure
>  =========================
>  
> -At this point remoteproc only supports ELF32 firmware binaries. However,
> +At this point remoteproc supports ELF32 and ELF64 firmware binaries. However,
>  it is quite expected that other platforms/devices which we'd want to
>  support with this framework will be based on different binary formats.
>  
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index b17d72ec8603..6a2d31d6092c 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -31,6 +31,7 @@
>  #include <linux/elf.h>
>  
>  #include "remoteproc_internal.h"
> +#include "remoteproc_elf_loader.h"
>  
>  /**
>   * rproc_elf_sanity_check() - Sanity Check ELF firmware image
> @@ -43,8 +44,16 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  {
>  	const char *name = rproc->firmware;
>  	struct device *dev = &rproc->dev;
> +	/*
> +	 * Elf files are beginning with the same structure. Thus, to simplify
> +	 * header parsing, we can use the elf32_hdr one for both elf64 and
> +	 * elf32.
> +	 */
>  	struct elf32_hdr *ehdr;
> +	u32 elf_shdr_size;
> +	u64 phoff, shoff;
>  	char class;
> +	u16 phnum;
>  
>  	if (!fw) {
>  		dev_err(dev, "failed to load %s\n", name);
> @@ -58,9 +67,13 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)

In the current code [1] fw->size is compared against the size of an elf32_hdr.
If support for elf64 is added that code needs to be modified to check for the
right header size using fw_elf_get_class().

[1] https://elixir.bootlin.com/linux/v5.5-rc6/source/drivers/remoteproc/remoteproc_elf_loader.c#L46

>  
>  	ehdr = (struct elf32_hdr *)fw->data;
>  
> -	/* We only support ELF32 at this point */
> +	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
> +		dev_err(dev, "Image is corrupted (bad magic)\n");
> +		return -EINVAL;
> +	}
> +

Is there a reason to move this check up where?  If not please bring it back to
its original location, that is below:

 "if (fw->size < ehdr->e_shoff + sizeof(structelf32_shdr))"

>  	class = ehdr->e_ident[EI_CLASS];
> -	if (class != ELFCLASS32) {
> +	if (class != ELFCLASS32 && class != ELFCLASS64) {
>  		dev_err(dev, "Unsupported class: %d\n", class);
>  		return -EINVAL;
>  	}
> @@ -75,26 +88,29 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  		return -EINVAL;
>  	}
>  
> -	if (fw->size < ehdr->e_shoff + sizeof(struct elf32_shdr)) {
> -		dev_err(dev, "Image is too small\n");
> -		return -EINVAL;
> -	}
> +	phoff = elf_hdr_e_phoff(class, fw->data);
> +	shoff = elf_hdr_e_shoff(class, fw->data);
> +	phnum =  elf_hdr_e_phnum(class, fw->data);
> +	elf_shdr_size = elf_size_of_shdr(class);
>  
> -	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
> -		dev_err(dev, "Image is corrupted (bad magic)\n");
> +	if (fw->size < shoff + elf_shdr_size) {
> +		dev_err(dev, "Image is too small\n");
>  		return -EINVAL;
>  	}
>  
> -	if (ehdr->e_phnum == 0) {
> +	if (phnum == 0) {
>  		dev_err(dev, "No loadable segments\n");
>  		return -EINVAL;
>  	}
>  
> -	if (ehdr->e_phoff > fw->size) {
> +	if (phoff > fw->size) {
>  		dev_err(dev, "Firmware size is too small\n");
>  		return -EINVAL;
>  	}
>  
> +	dev_dbg(dev, "Firmware is an elf%d file\n",
> +		class == ELFCLASS32 ? 32 : 64);
> +

Yes, this is useful.

>  	return 0;
>  }
>  EXPORT_SYMBOL(rproc_elf_sanity_check);
> @@ -110,11 +126,9 @@ EXPORT_SYMBOL(rproc_elf_sanity_check);
>   * Note that the boot address is not a configurable property of all remote
>   * processors. Some will always boot at a specific hard-coded address.
>   */
> -u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> +u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
>  {
> -	struct elf32_hdr *ehdr  = (struct elf32_hdr *)fw->data;
> -
> -	return ehdr->e_entry;
> +	return elf_hdr_e_entry(fw_elf_get_class(fw), fw->data);
>  }
>  EXPORT_SYMBOL(rproc_elf_get_boot_addr);
>  
> @@ -145,37 +159,41 @@ EXPORT_SYMBOL(rproc_elf_get_boot_addr);
>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct device *dev = &rproc->dev;
> -	struct elf32_hdr *ehdr;
> -	struct elf32_phdr *phdr;
> +	const void *ehdr, *phdr;
>  	int i, ret = 0;
> +	u16 phnum;
>  	const u8 *elf_data = fw->data;
> +	u8 class = fw_elf_get_class(fw);
> +	u32 elf_phdr_size = elf_size_of_phdr(class);
>  
> -	ehdr = (struct elf32_hdr *)elf_data;
> -	phdr = (struct elf32_phdr *)(elf_data + ehdr->e_phoff);
> +	ehdr = elf_data;
> +	phnum = elf_hdr_e_phnum(class, ehdr);
> +	phdr = elf_data + elf_hdr_e_phoff(class, ehdr);
>  
>  	/* go through the available ELF segments */
> -	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
> -		u32 da = phdr->p_paddr;
> -		u32 memsz = phdr->p_memsz;
> -		u32 filesz = phdr->p_filesz;
> -		u32 offset = phdr->p_offset;
> +	for (i = 0; i < phnum; i++, phdr += elf_phdr_size) {
> +		u64 da = elf_phdr_p_paddr(class, phdr);
> +		u64 memsz = elf_phdr_p_memsz(class, phdr);
> +		u64 filesz = elf_phdr_p_filesz(class, phdr);
> +		u64 offset = elf_phdr_p_offset(class, phdr);
> +		u32 type = elf_phdr_p_type(class, phdr);
>  		void *ptr;
>  
> -		if (phdr->p_type != PT_LOAD)
> +		if (type != PT_LOAD)
>  			continue;
>  
> -		dev_dbg(dev, "phdr: type %d da 0x%x memsz 0x%x filesz 0x%x\n",
> -			phdr->p_type, da, memsz, filesz);
> +		dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\n",
> +			type, da, memsz, filesz);
>  
>  		if (filesz > memsz) {
> -			dev_err(dev, "bad phdr filesz 0x%x memsz 0x%x\n",
> +			dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
>  				filesz, memsz);
>  			ret = -EINVAL;
>  			break;
>  		}
>  
>  		if (offset + filesz > fw->size) {
> -			dev_err(dev, "truncated fw: need 0x%x avail 0x%zx\n",
> +			dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
>  				offset + filesz, fw->size);
>  			ret = -EINVAL;
>  			break;
> @@ -184,14 +202,15 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		/* grab the kernel address for this device address */
>  		ptr = rproc_da_to_va(rproc, da, memsz);
>  		if (!ptr) {
> -			dev_err(dev, "bad phdr da 0x%x mem 0x%x\n", da, memsz);
> +			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> +				memsz);
>  			ret = -EINVAL;
>  			break;
>  		}
>  
>  		/* put the segment where the remote processor expects it */
> -		if (phdr->p_filesz)
> -			memcpy(ptr, elf_data + phdr->p_offset, filesz);
> +		if (filesz)
> +			memcpy(ptr, elf_data + offset, filesz);
>  
>  		/*
>  		 * Zero out remaining memory for this segment.
> @@ -208,24 +227,32 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  }
>  EXPORT_SYMBOL(rproc_elf_load_segments);
>  
> -static struct elf32_shdr *
> -find_table(struct device *dev, struct elf32_hdr *ehdr, size_t fw_size)
> +static const void *

Not sure I understand the "const" - was the compiler complaining?

> +find_table(struct device *dev, const struct firmware *fw)
>  {
> -	struct elf32_shdr *shdr;
> +	const void *shdr, *name_table_shdr;
>  	int i;
>  	const char *name_table;
>  	struct resource_table *table = NULL;
> -	const u8 *elf_data = (void *)ehdr;
> +	const u8 *elf_data = (void *)fw->data;
> +	u8 class = fw_elf_get_class(fw);
> +	size_t fw_size = fw->size;
> +	const void *ehdr = elf_data;
> +	u16 shnum = elf_hdr_e_shnum(class, ehdr);
> +	u32 elf_shdr_size = elf_size_of_shdr(class);
> +	u16 shstrndx = elf_hdr_e_shstrndx(class, ehdr);
>  
>  	/* look for the resource table and handle it */
> -	shdr = (struct elf32_shdr *)(elf_data + ehdr->e_shoff);
> -	name_table = elf_data + shdr[ehdr->e_shstrndx].sh_offset;
> +	shdr = elf_data + elf_hdr_e_shoff(class, ehdr);
> +	name_table_shdr = shdr + (shstrndx * elf_shdr_size);
> +	name_table = elf_data + elf_shdr_sh_offset(class, name_table_shdr);

It took me a while but I figured out what is happening here.  To save me (and
other people) from going through the same mental process every time I look at
this code, please add a comment for each of the above 3 lines. 

>  
> -	for (i = 0; i < ehdr->e_shnum; i++, shdr++) {
> -		u32 size = shdr->sh_size;
> -		u32 offset = shdr->sh_offset;
> +	for (i = 0; i < shnum; i++, shdr += elf_shdr_size) {
> +		u64 size = elf_shdr_sh_size(class, shdr);
> +		u64 offset = elf_shdr_sh_offset(class, shdr);
> +		u32 name = elf_shdr_sh_name(class, shdr);
>  
> -		if (strcmp(name_table + shdr->sh_name, ".resource_table"))
> +		if (strcmp(name_table + name, ".resource_table"))
>  			continue;
>  
>  		table = (struct resource_table *)(elf_data + offset);
> @@ -279,21 +306,21 @@ find_table(struct device *dev, struct elf32_hdr *ehdr, size_t fw_size)
>   */
>  int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw)
>  {
> -	struct elf32_hdr *ehdr;
> -	struct elf32_shdr *shdr;
> +	const void *shdr;
>  	struct device *dev = &rproc->dev;
>  	struct resource_table *table = NULL;
>  	const u8 *elf_data = fw->data;
>  	size_t tablesz;
> +	u8 class = fw_elf_get_class(fw);
> +	u64 sh_offset;
>  
> -	ehdr = (struct elf32_hdr *)elf_data;
> -
> -	shdr = find_table(dev, ehdr, fw->size);
> +	shdr = find_table(dev, fw);
>  	if (!shdr)
>  		return -EINVAL;
>  
> -	table = (struct resource_table *)(elf_data + shdr->sh_offset);
> -	tablesz = shdr->sh_size;
> +	sh_offset = elf_shdr_sh_offset(class, shdr);
> +	table = (struct resource_table *)(elf_data + sh_offset);
> +	tablesz = elf_shdr_sh_size(class, shdr);
>  
>  	/*
>  	 * Create a copy of the resource table. When a virtio device starts
> @@ -326,13 +353,17 @@ EXPORT_SYMBOL(rproc_elf_load_rsc_table);
>  struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
>  						       const struct firmware *fw)
>  {
> -	struct elf32_hdr *ehdr = (struct elf32_hdr *)fw->data;
> -	struct elf32_shdr *shdr;
> +	const void *shdr;
> +	u64 sh_addr, sh_size;
> +	u8 class = fw_elf_get_class(fw);
>  
> -	shdr = find_table(&rproc->dev, ehdr, fw->size);
> +	shdr = find_table(&rproc->dev, fw);
>  	if (!shdr)
>  		return NULL;
>  
> -	return rproc_da_to_va(rproc, shdr->sh_addr, shdr->sh_size);
> +	sh_addr = elf_shdr_sh_addr(class, shdr);
> +	sh_size = elf_shdr_sh_size(class, shdr);
> +
> +	return rproc_da_to_va(rproc, sh_addr, sh_size);

The prototype for the above is as follow:

void *rproc_da_to_va(struct rproc *rproc, u64 da, int len)

But sh_size is a u64, which will cause problem that are hard to debug.  I think
it is better to move 'len' to an 8 byte type along with the refactoring of the
existing code that is implied.  I suggest to split this work in a preparatory
patch (that will still be part of this set).  

>  }
>  EXPORT_SYMBOL(rproc_elf_find_loaded_rsc_table);
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.h b/drivers/remoteproc/remoteproc_elf_loader.h
> new file mode 100644
> index 000000000000..fac3565734f9
> --- /dev/null
> +++ b/drivers/remoteproc/remoteproc_elf_loader.h
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Remote processor elf loader defines
> + *
> + * Copyright (C) 2019 Kalray, Inc.
> + */
> +
> +#ifndef REMOTEPROC_ELF_LOADER_H
> +#define REMOTEPROC_ELF_LOADER_H
> +
> +#include <linux/elf.h>
> +#include <linux/types.h>
> +
> +/**
> + * fw_elf_get_class - Get elf class
> + * @fw: the ELF firmware image
> + *
> + * Note that we use and elf32_hdr to access the class since the start of the
> + * struct is the same for both elf class
> + *
> + * Return: elf class of the firmware
> + */
> +static inline u8 fw_elf_get_class(const struct firmware *fw)
> +{
> +	struct elf32_hdr *ehdr = (struct elf32_hdr *)fw->data;
> +
> +	return ehdr->e_ident[EI_CLASS];
> +}
> +
> +#define ELF_GET_FIELD(__s, __field, __type) \
> +static inline __type elf_##__s##_##__field(u8 class, const void *arg) \
> +{ \
> +	if (class == ELFCLASS32) \
> +		return (__type) ((const struct elf32_##__s *) arg)->__field; \
> +	else \
> +		return (__type) ((const struct elf64_##__s *) arg)->__field; \
> +}
> +
> +ELF_GET_FIELD(hdr, e_entry, u64)
> +ELF_GET_FIELD(hdr, e_phnum, u16)
> +ELF_GET_FIELD(hdr, e_shnum, u16)
> +ELF_GET_FIELD(hdr, e_phoff, u64)
> +ELF_GET_FIELD(hdr, e_shoff, u64)
> +ELF_GET_FIELD(hdr, e_shstrndx, u16)
> +
> +ELF_GET_FIELD(phdr, p_paddr, u64)
> +ELF_GET_FIELD(phdr, p_filesz, u64)
> +ELF_GET_FIELD(phdr, p_memsz, u64)
> +ELF_GET_FIELD(phdr, p_type, u32)
> +ELF_GET_FIELD(phdr, p_offset, u64)
> +
> +ELF_GET_FIELD(shdr, sh_size, u64)
> +ELF_GET_FIELD(shdr, sh_offset, u64)
> +ELF_GET_FIELD(shdr, sh_name, u32)
> +ELF_GET_FIELD(shdr, sh_addr, u64)

I like how you did this.

> +
> +#define ELF_STRUCT_SIZE(__s) \
> +static inline unsigned long elf_size_of_##__s(u8 class) \
> +{ \
> +	if (class == ELFCLASS32)\
> +		return sizeof(struct elf32_##__s); \
> +	else \
> +		return sizeof(struct elf64_##__s); \
> +}
> +
> +ELF_STRUCT_SIZE(shdr)
> +ELF_STRUCT_SIZE(phdr)
> +
> +#endif /* REMOTEPROC_ELF_LOADER_H */
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 45ff76a06c72..4ef745e3a1bc 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -63,7 +63,7 @@ phys_addr_t rproc_va_to_pa(void *cpu_addr);
>  int rproc_trigger_recovery(struct rproc *rproc);
>  
>  int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw);
> -u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
> +u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
>  int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw);
>  struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index 51049d17b1e5..e23abd8a96b0 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -193,7 +193,7 @@ static int st_rproc_start(struct rproc *rproc)
>  		}
>  	}
>  
> -	dev_info(&rproc->dev, "Started from 0x%x\n", rproc->bootaddr);
> +	dev_info(&rproc->dev, "Started from 0x%llx\n", rproc->bootaddr);
>  
>  	return 0;
>  
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 04d04709f2bd..512de9a2590c 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -362,7 +362,7 @@ struct rproc_ops {
>  				struct rproc *rproc, const struct firmware *fw);
>  	int (*load)(struct rproc *rproc, const struct firmware *fw);
>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
> -	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> +	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>  };
>  
>  /**
> @@ -478,7 +478,7 @@ struct rproc {
>  	int num_traces;
>  	struct list_head carveouts;
>  	struct list_head mappings;
> -	u32 bootaddr;
> +	u64 bootaddr;
>  	struct list_head rvdevs;
>  	struct list_head subdevs;
>  	struct idr notifyids;

Please hold off before doing another respin of this patch.  While doing
something completely different I noticed TI also did some work in this area.
I'd like to take some time to look at their implementation and see if they carry
features that haven't been included here.  I intend to do this tomorrow.

Thanks,
Mathieu 

> -- 
> 2.15.0.276.g89ea799
> 
